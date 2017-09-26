package com.ht.controller;

import com.ht.bean.Agency;
import com.ht.common.Constants;
import com.ht.common.Send;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.common.util.EncryptUtil;
import com.ht.common.util.FileUtil;
import com.ht.common.util.SpellUtil;
import com.ht.service.AgencyService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by 7025 on 2017/8/24.
 */
public class AgencyController extends ActionSupport implements ServletRequestAware {

    // 无
    private HttpServletRequest request;
    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录

    // set
    private AgencyService agencyService;
    private String validate; // 手机验证码验证
    private String code; // 图片验证码验证
    private String common;// 用来接收登录信息，手机号、邮箱、用户名
    private String password;


    // get
    private ControllerResult controllerResult;

    // get set
    private Agency agency;

    private List<Agency> rows;//get
    private int total;//get
    private int offset;//第几条开始,set
    private int limit;//每页几行，set

    private String phone;//set

    private File upload;//set
    private String uploadFileName;//set

    public String reg() {
        if("reg".equals(validateCommon("reg"))) {
            return validateCommon("reg");
        }
        if(!code.equals(request.getSession().getAttribute("code"))) {
            controllerResult = ControllerResult.getFailResult("图片验证码错误！");
            return "reg";
        }
        agency.setCreatedTime(Calendar.getInstance().getTime());
        agency.setStatus(Constants.ACTIVATION);
        agency.setSpell(SpellUtil.getSpell(agency.getName()));
        agency.setPwd(EncryptUtil.md5Encrypt(agency.getPwd()));
        agency.setLogo("img/headDefault.png");
        agencyService.save(agency);
        controllerResult = ControllerResult.getSuccessResult("注册成功！");
        logger.info("经销商注册");
        return "reg";
    }

    public String authCode() {
        try {
            Send.sendSms(phone);
            String i = String.valueOf(Send.i);//短信中的验证码
            System.out.println(i);
        }catch(Exception e) {
            e.printStackTrace();
        }
        controllerResult = ControllerResult.getSuccessResult("发送成功！");
        return "authCode";
    }

    public String detail(){
        agency = agencyService.getById(agency.getId());
        return "detail";
    }

    public String checkCode() {
        String i = String.valueOf(Send.i);//短信中的验证码
        System.out.println(i);
        String validate = request.getParameter("validate");
        System.out.println("v:"+validate);
        if(!validate.equals(i)){
            System.out.print("v:"+validate + "i:" + i);
            controllerResult = ControllerResult.getFailResult("验证码错误");
            System.out.println("验证码错误");
        }else{
            System.out.print("v:"+validate + "i:" + i);
            controllerResult = ControllerResult.getSuccessResult("验证码正确");
            System.out.println("验证码正确");
        }
        return "checkCode";
    }

    public String login() {
        HttpSession session = request.getSession();
        Agency agency1 = agencyService.getByEmailPwd(common,EncryptUtil.md5Encrypt(agency.getPwd()));
        if(agency1 != null) {
            if(agency1.getCheckedStatus() == Constants.FREEZE) {
                controllerResult = ControllerResult.getFailResult("登录失败");
                return "login";
            }
            request.getSession().removeAttribute("admin");
            request.getSession().removeAttribute("agency");
            request.getSession().removeAttribute("user");
            request.getSession().removeAttribute("employee");
            session.setAttribute("agency", agency1);
            logger.info("经销商登录");
            controllerResult = ControllerResult.getSuccessResult("登录成功");
            return "login";
        }
        Agency agency2 = agencyService.getByNamePwd(common, EncryptUtil.md5Encrypt(agency.getPwd()));
        if(agency2 != null) {
            if(agency2.getCheckedStatus() == Constants.FREEZE) {
                controllerResult = ControllerResult.getFailResult("登录失败");
                return "login";
            }
            request.getSession().removeAttribute("admin");
            request.getSession().removeAttribute("agency");
            request.getSession().removeAttribute("user");
            request.getSession().removeAttribute("employee");
            session.setAttribute("agency", agency2);
            logger.info("经销商登录");
            controllerResult = ControllerResult.getSuccessResult("登录成功");
            return "login";
        }
        Agency agency3 = agencyService.getByPhonePwd(common, EncryptUtil.md5Encrypt(agency.getPwd()));
        if(agency3 != null) {
            if(agency3.getCheckedStatus() == Constants.FREEZE) {
                controllerResult = ControllerResult.getFailResult("登录失败");
                return "login";
            }
            request.getSession().removeAttribute("admin");
            request.getSession().removeAttribute("agency");
            request.getSession().removeAttribute("user");
            request.getSession().removeAttribute("employee");
            session.setAttribute("agency", agency3);
            logger.info("经销商登录");
            controllerResult = ControllerResult.getSuccessResult("登录成功");
            return "login";
        }
        controllerResult = ControllerResult.getFailResult("登录信息与密码错误");
        return "login";
    }

    public String update() {
        Agency agency1 = agencyService.getById(agency.getId());
        agency1.setLeader(agency.getLeader());
        agency1.setTel(agency.getTel());
        agency1.setIntro(agency.getIntro());
        agency1.setAddress(agency.getAddress());
        agencyService.update(agency1);
        HttpSession session = request.getSession();
        session.setAttribute("agency", agency1);
        logger.info("经销商修改信息");
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        return "update";
    }

    public String updatePwd() {
        Agency agency1 = agencyService.getByPhonePwd(agency.getPhone(), EncryptUtil.md5Encrypt(agency.getPwd()));
        if(agency1 == null) {
            controllerResult = ControllerResult.getFailResult("查无此人");
            return "updatePwd";
        }
        agency1.setPwd(EncryptUtil.md5Encrypt(password));
        agencyService.update(agency1);
        logger.info("经销商修改密码");
        return "updatePwd";
    }


    public String loginPage() {
        return "loginPage";
    }


    public String regPage() {
        return "regPage";
    }

    public String home() {
        if(request.getSession().getAttribute("agency") != null) {
            return "home";
        } else {
            return "loginPage";
        }
    }

    public String info() {
        return "info";
    }

    public String updatePage() {
        return "updatePage";
    }

    public String updatePwdPage() {
        return "updatePwdPage";
    }

    public String waitCheck() {
        return "waitCheck";

    }
    private String validateCommon(String method) {
        if(agencyService.getName(agency.getName())) {
            controllerResult = ControllerResult.getFailResult("名字被占用！");
            return method;
        }
        if(agencyService.getEmail(agency.getEmail())) {
            controllerResult = ControllerResult.getFailResult("邮箱被占用！");
            return method;
        }
        if(agencyService.getPhone(agency.getPhone())) {
            controllerResult = ControllerResult.getFailResult("手机号被占用！");
            return method;
        }
        return null;
    }

    //跳转到未审核的经销商分页页面
    public String uncheckPager() {
        return "uncheckPager";
    }

    //返回未审核经销商的页面
    public String uncheck() {
        rows = new ArrayList<Agency>();
        total = (int)agencyService.uncheckCount();
        Pager<Agency> pager = new Pager<Agency>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        pager = agencyService.unCheckedPager(pager);
        rows = pager.getResults();
        logger.info("管理员查看未审核经销商分页页面");
        return "uncheck";
    }


    //跳转到已审核的经销商分页页面
    public String checkPager() {
        return "checkPager";
    }

    //跳转到已审核的经销商分页页面
    public String check() {
        rows = new ArrayList<Agency>();
        total = (int)agencyService.checkCount();
        Pager<Agency> pager = new Pager<Agency>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        pager = agencyService.checkedPager(pager);
        rows = pager.getResults();
        logger.info("管理员查看已审核经销商分页页面");
        return "check";
    }

    //审核的方法
    public String dealCheck() {
        Agency agency  = new Agency();
        String id = request.getParameter("id");
        agency = agencyService.getById(id);
        agency.setCheckedStatus(1);
        agencyService.update(agency);
        controllerResult = ControllerResult.getSuccessResult("通过审核");
        logger.info("管理员审核经销商");
        return "dealCheck";
    }

    //把状态变为可用的方法
    public String beUsable() {
        Agency agency  = new Agency();
        String id = request.getParameter("id");
        agency = agencyService.getById(id);
        agency.setStatus(1);
        agencyService.update(agency);
        controllerResult = ControllerResult.getSuccessResult("激活");
        logger.info("管理员激活经销商");
        return "beUsable";
    }

    //把状态变为不可用的方法
    public String beDisable() {
        Agency agency  = new Agency();
        String id = request.getParameter("id");
        agency = agencyService.getById(id);
        agency.setStatus(0);
        agencyService.update(agency);
        controllerResult = ControllerResult.getSuccessResult("冻结");
        logger.info("管理员冻结经销商");
        return "beDisable";
    }

    public String adminUpAgency() {
        Agency agency1 = new Agency();
        String id = request.getParameter("id");
        agency1 = agencyService.getById(id);
        agency1.setLeader(agency.getLeader());
        agency1.setName(agency.getName());
        agency1.setIntro(agency.getIntro());
        agency1.setAddress(agency.getAddress());
        agencyService.update(agency1);
        return "adminUpAgency";
    }

    public String logout(){
        HttpSession session = request.getSession();
        session.removeAttribute("agency");
        return "logout";
    }

    //跳转到修改logo页面
    public String upHeadIcon() {
        return "upHeadIcon";
    }

    //修改logo操作
    public String checkHeadIcon() {
        //Employee employee = (Employee)request.getSession().getAttribute("employee");
        Object obj = request.getSession().getAttribute("agency");
        if(obj == null) {
            controllerResult = ControllerResult.getFailResult("修改失败");
            return "checkHeadIcon";
        }
        Agency agency = (Agency)obj;
        if(uploadFileName != null) {
            try {
                FileUtils.copyFile(upload, new File(FileUtil.uploadPath() + File.separator + uploadFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            agency.setLogo(Constants.UPLOADS + "/" + uploadFileName);
        } else {
            controllerResult = ControllerResult.getFailResult("修改失败");
            return "upHeadIcon";
        }
        agencyService.update(agency);
        logger.info("经销商修改logo");
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        return "checkHeadIcon";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    public void setAgencyService(AgencyService agencyService) {
        this.agencyService = agencyService;
    }

    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public void setValidate(String validate) {
        this.validate = validate;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setCommon(String common) {
        this.common = common;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Agency> getRows() {
        return rows;
    }

    public int getTotal() {
        return total;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }
}
