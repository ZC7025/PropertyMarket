package com.ht.controller;

import com.ht.bean.User;
import com.ht.common.Constants;
import com.ht.common.Send;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.common.util.EncryptUtil;
import com.ht.common.util.FileUtil;
import com.ht.service.UserService;
import com.ht.vo.charts.UserChartsData;
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

public class UserController extends ActionSupport  implements ServletRequestAware{

    private final static Logger logger = Logger.getLogger(AdminController.class);
    private HttpServletRequest request;

    private UserService userService ;

    private User user;//get set

    private ControllerResult controllerResult;

    private String phoneOrEmail;//用于接收用户登录输入的电话或邮箱 set

    private String newPwd;

    private String conNewPwd;

    private int offset;//第几条开始,set
    private int limit;//每页几行，set
    private int total;//get
    private List<User> rows;//get
    private UserChartsData userChartsData; // get

    private File upload;//set
    private String uploadFileName;//set

    private String phone;//set

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public void setPhoneOrEmail(String phoneOrEmail) {
        this.phoneOrEmail = phoneOrEmail;
    }

    public void setNewPwd(String newPwd) {
        this.newPwd = newPwd;
    }

    public void setConNewPwd(String conNewPwd) {
        this.conNewPwd = conNewPwd;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getTotal() {
        return total;
    }

    public List<User> getRows() {
        return rows;
    }

    public UserChartsData getUserChartsData() {
        return userChartsData;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String charts() {
        userChartsData = userService.getChartsData();
        return "charts";
    }

    public String chartsPage() {
        return "chartsPage";
    }

    /**
     * 用户注册方法
     * @return
     */
    public String register(){

        boolean ifphone = userService.getPhone(user.getPhone());
        boolean ifemail = userService.getEmail(user.getEmail());
        if(ifphone){
            controllerResult = ControllerResult.getFailResult("此手机号已被注册");
        }else if(ifemail){
            controllerResult = ControllerResult.getFailResult("此邮箱已被注册");
        }else {
            user.setPwd(EncryptUtil.md5Encrypt(user.getPwd()));
            user.setCreatedTime(Calendar.getInstance().getTime());
            user.setStatus(Constants.ACTIVATION);
            user.setNickname("这个人很懒，没有昵称");
            user.setHeadicon("img/headDefault.png");
            userService.save(user);
            controllerResult = ControllerResult.getSuccessResult("注册成功");
        }
        logger.info("有用户注册");
        return "register";
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

    public String userLoginPage (){
        return "userLoginPage";
    }

    public String userRegisterPage (){
        return "userRegisterPage";
    }

    public String login(){
        if(phoneOrEmail!=null && phoneOrEmail.endsWith(".com")){
            user = userService.getByEmailPwd(phoneOrEmail,EncryptUtil.md5Encrypt(user.getPwd()));
            if(user!=null){
                request.getSession().removeAttribute("admin");
                request.getSession().removeAttribute("agency");
                request.getSession().removeAttribute("user");
                request.getSession().removeAttribute("employee");
                request.getSession().setAttribute("user", user);
                controllerResult = ControllerResult.getSuccessResult("登录成功");
            }else{
                controllerResult = ControllerResult.getFailResult("账户或密码有误");
            }
        }else{
            user = userService.getByPhonePwd(phoneOrEmail,EncryptUtil.md5Encrypt(user.getPwd()));
            if(user!=null){
                request.getSession().removeAttribute("admin");
                request.getSession().removeAttribute("agency");
                request.getSession().removeAttribute("user");
                request.getSession().removeAttribute("employee");
                request.getSession().setAttribute("user", user);
                controllerResult = ControllerResult.getSuccessResult("登录成功");
            }else{
                controllerResult = ControllerResult.getFailResult("账户或密码有误");
            }
        }
        logger.info("用户登录");
        return "login";
    }

    public String userCenter(){
        if(request.getSession().getAttribute("user") != null) {
            return "userCenter";
        } else {
            return "userLoginPage";
        }
    }

    public String userMessage(){
        return "userMessage";
    }


    public String userLoginout(){
        return "userLoginout";
    }

    public String userChangeMessage(){
        user.setId(user.getId().trim());
        userService.update(user);
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        User user1  = userService.getById(user.getId());
        session.setAttribute("user",user1);
        controllerResult = ControllerResult.getSuccessResult("信息修改成功");
        logger.info("用户修改信息");
        user = null;
        return "userChangeMessage";
    }

    public String userChangePwdPage(){
        return "userChangePwdPage";
    }

    public String userChangePwd(){
         if(newPwd !=null && conNewPwd !=null ){
            if( newPwd.equals(conNewPwd)){
                String pwd  = EncryptUtil.md5Encrypt(user.getPwd());
                user = userService.getById(user.getId());
                if(user.getPwd().equals(pwd)){
                    user.setPwd(EncryptUtil.md5Encrypt(newPwd));
                    userService.update(user);
                    controllerResult = ControllerResult.getSuccessResult("密码修改成功");
                }else{
                    controllerResult = ControllerResult.getFailResult("原密码输入有误");
                }
            }else{
                controllerResult = ControllerResult.getFailResult("新密码不一致");
            }
        }
        logger.info("用户修改密码");
        return "userChangeMessage";
    }

    //管理员模板里跳转到用户分页页面
    public String toUserPager() {
        return "toUserPager";
    }

    //所有用户分页
    public String userPager() {
        rows = new ArrayList<User>();
        total = (int)userService.count();
        Pager<User> pager = new Pager<User>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        pager = userService.listByPager(pager);
        rows = pager.getResults();
        logger.info("管理员查看所有用户分页页面");
        return "userPager";
    }
    //把状态变为可用的方法
    public String beUsable() {
       User user = new User();
       String id = request.getParameter("id");
       user = userService.getById(id);
       user.setStatus(1);
       userService.update(user);
       controllerResult = ControllerResult.getSuccessResult("激活");
       logger.info("管理员激活用户");
       return "beUsable";
    }

    //把状态变为不可用的方法
    public String beDisable() {
        User user = new User();
        String id = request.getParameter("id");
        user = userService.getById(id);
        user.setStatus(0);
        userService.update(user);
        controllerResult = ControllerResult.getSuccessResult("冻结");
        logger.info("管理员冻结用户");
        return "beDisable";
    }

    public String logout(){
        user = null;
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "logout";
    }

    public String userLoginPage1(){
        return "userLoginPage1";
    }

    //跳转到修改头像页面
    public String upHeadIcon() {
        return "upHeadIcon";
    }

    //修改头像操作
    public String checkHeadIcon() {
       // Employee employee = (Employee)request.getSession().getAttribute("employee");
        Object obj = request.getSession().getAttribute("user");
        if(obj != null) {
            User user = (User)obj;
            if(uploadFileName != null) {
                try {
                    FileUtils.copyFile(upload, new File(FileUtil.uploadPath() + File.separator + uploadFileName));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                user.setHeadicon(Constants.UPLOADS + "/" + uploadFileName);
            } else {
                controllerResult = ControllerResult.getFailResult("修改失败");
                return "upHeadIcon";
            }
            userService.update(user);
            logger.info("员工修改头像");
            controllerResult = ControllerResult.getSuccessResult("修改成功");
        }
        return "checkHeadIcon";
    }

    /**
     * 获取用户
     * @return
     */
    public String getById(){
        Object obj = request.getSession().getAttribute("user");
        if (obj != null) {
            User user1 = (User) obj;
            user = userService.getById(user1.getId());
        }
        return "getById";
    }

    public String welcome(){
        return "welcome";
    }
    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }


}
