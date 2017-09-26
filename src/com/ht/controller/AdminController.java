package ht.controller;

import com.ht.bean.Admin;
import com.ht.common.bean.ControllerResult;
import com.ht.common.util.EncryptUtil;
import com.ht.service.AdminService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by sweet on 2017/8/24.
 */
public class AdminController extends ActionSupport implements ServletRequestAware {

    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录
    private HttpServletRequest request;

    private AdminService adminService;//set
    private Admin admin;//get,set
    private ControllerResult controllerResult;//get,传信息到前台
    //private String loginInfo;//set，前台传到后台

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    /*public void setLoginInfo(String loginInfo) {
        this.loginInfo = loginInfo;
    }*/



    //管理员登录的方法
    public String login() {
        System.out.print(admin.getPhone()+EncryptUtil.md5Encrypt(admin.getPwd()));
        Object obj = adminService.getByPhonePwd(admin.getPhone(), EncryptUtil.md5Encrypt(admin.getPwd()));
        if(obj != null) {
            Admin admin = (Admin) obj;
            controllerResult = ControllerResult.getSuccessResult("success");
            request.getSession().removeAttribute("admin");
            request.getSession().removeAttribute("agency");
            request.getSession().removeAttribute("user");
            request.getSession().removeAttribute("employee");
            request.getSession().setAttribute("admin", admin);
            //request.getSession().setAttribute("admin", admin1);
            logger.info("管理员登录");
            return "loginSuccess";
        }
        controllerResult = ControllerResult.getFailResult("手机号或密码错误");
        return "loginFail";
    }

    //为跳转到管理员登录页面
    public String adminLoginPage() {
        return "adminLoginPage";
    }

    //为跳转到管理员后台页面
    public String toBackground() {
        if(request.getSession().getAttribute("admin") != null) {
            return "adminBackground";
        } else {
            return "adminLoginPage";
        }
    }

    public String logout(){
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        return "logout";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
