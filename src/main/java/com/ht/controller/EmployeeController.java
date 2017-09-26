package com.ht.controller;

import com.ht.bean.Agency;
import com.ht.bean.Employee;
import com.ht.common.Constants;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.common.util.EncryptUtil;
import com.ht.common.util.FileUtil;
import com.ht.service.EmployeeService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;


/**
 * Created by sweet on 2017/8/25.
 */
public class EmployeeController extends ActionSupport implements ServletRequestAware {

    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录
    private HttpServletRequest request;
    private ControllerResult controllerResult;//get,传到后台

    private EmployeeService employeeService;//set

    private Employee employee;//get,set
    private String id;//set,页面传过来的
    private String phoneOrEmail;//set,页面传过来的

    private String beforePwd;//set
    private String newPwd;
    private String confirmPwd;

    private List<Employee> rows;
    private int total;

    private int limit;
    private int offset;

    private List<Employee> employees;

    private File upload;//set
    private String uploadFileName;//set


    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }


    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setBeforePwd(String beforePwd) {
        this.beforePwd = beforePwd;
    }

    public void setNewPwd(String newPwd) {
        this.newPwd = newPwd;
    }

    public void setConfirmPwd(String confirmPwd) {
        this.confirmPwd = confirmPwd;
    }

    public void setPhoneOrEmail(String phoneOrEmail) {
        this.phoneOrEmail = phoneOrEmail;
    }

    public List<Employee> getRows() {
        return rows;
    }

    public int getTotal() {
        return total;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    //跳转到员工登录页面
    public String employeeLoginPager() {
        return "employeeLoginPager";
    }

    //跳转到员工后台页面
    public String toBackground() {
        if(request.getSession().getAttribute("employee") != null){
            return "toBackground";
        } else {
            return "employeeLoginPager";
        }
    }

    //跳转到查看员工个人信息页面
    public String viewPersonInfo() {
        return "viewPersonInfo";
    }

    //跳转到修改密码界面
    public String toUpdatePwdPage() {
        return "toUpdatePwdPage";
    }

    //员工登录
    public String login() {
        System.out.print(phoneOrEmail + EncryptUtil.md5Encrypt(employee.getPwd()) );
        if(phoneOrEmail!=null && phoneOrEmail.endsWith(".com")){
            employee = employeeService.getByEmailPwd(phoneOrEmail,EncryptUtil.md5Encrypt(employee.getPwd()));
            if(employee!=null){
                request.getSession().removeAttribute("admin");
                request.getSession().removeAttribute("agency");
                request.getSession().removeAttribute("user");
                request.getSession().removeAttribute("employee");
                request.getSession().setAttribute("employee", employee);
                controllerResult = ControllerResult.getSuccessResult("登录成功");
                //logger.info("员工登录");
            }else{
                controllerResult = ControllerResult.getFailResult("账户或密码有误");
            }
        }else{
            employee = employeeService.getByPhonePwd(phoneOrEmail,EncryptUtil.md5Encrypt(employee.getPwd()));
            if(employee!=null){
                request.getSession().removeAttribute("admin");
                request.getSession().removeAttribute("agency");
                request.getSession().removeAttribute("user");
                request.getSession().removeAttribute("employee");
                request.getSession().setAttribute("employee", employee);
                controllerResult = ControllerResult.getSuccessResult("登录成功");
                //logger.info("员工登录");
            }else{
                controllerResult = ControllerResult.getFailResult("账户或密码有误");
            }
        }
        return "login";
    }

    //更新员工个人信息
    public String updateEmpPersonInfo() {
        //employee.setPwd(EncryptUtil.md5Encrypt(employee.getPwd()));
        employee.setId(employee.getId().trim());
        employeeService.update(employee);
        employee = employeeService.getById(employee.getId());
        request.getSession().setAttribute("employee", employee);
        controllerResult = ControllerResult.getSuccessResult("success");
        return "updateEmpPersonInfo";
    }

    //更新员工密码
    public String updateEmpPwd() {
        Employee employee = employeeService.getById(id);
        if(EncryptUtil.md5Encrypt(beforePwd).equals(employee.getPwd())){
            if(newPwd.equals(confirmPwd)){
                controllerResult = ControllerResult.getSuccessResult("更新成功");
                employee.setPwd(EncryptUtil.md5Encrypt(confirmPwd));
                employeeService.update(employee);
                logger.info("员工修改密码");
            }else{
                controllerResult = ControllerResult.getFailResult("两次密码不一致");
            }
        }else{
            controllerResult = ControllerResult.getFailResult("原密码不正确");
        }
        return "updateEmpPwd";
    }


    public String addPage(){
        return "addPage";
    }

    public String add(){
        employee.setCreatedTime(Calendar.getInstance().getTime());
        employee.setPwd(EncryptUtil.md5Encrypt(employee.getPwd()));
        employee.setStatus(Constants.ACTIVATION);
        employee.setHeadicon("img/headDefault.png");
        employeeService.save(employee);
        controllerResult = ControllerResult.getSuccessResult("添加员工成功");
        logger.info("添加了一个员工");
        return "add";
    }

    /**
     * 进入分页查询所有的员工页面
     * @return
     */
    public String allEmployeePage(){
        return "allEmployeePage";
    }
    /**
     * 分页查询所有的员工
     * @return
     */
    public String allEmployee(){
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("agency");
        if(obj != null) {
            Agency agency  = (Agency) obj;
            Pager<Employee> pager = new Pager<Employee>();
            pager.setBeginIndex(offset);
            pager.setPageSize(limit);
            pager = employeeService.listByAgency(pager,agency.getId());
            rows = pager.getResults();
            total = pager.getTotal();
        }
        return "allEmployee";
    }

    public String changeStatus(){
        Employee employee = new Employee();
        employee.setId(request.getParameter("id"));
        employee.setStatus(Integer.valueOf(request.getParameter("status")));
        employeeService.updateStatus(employee);
        logger.info("修改了Id为"+employee.getId()+"员工的状态");
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        return "changeStatus";
    }

    public String input(){
        return "input";
    }

    public String changeMessage(){
        String id = request.getParameter("id");
        Employee employee1 = employeeService.getById(id);
        employee1.setQq(employee.getQq());
        employee1.setWechat(employee.getWechat());
        employee1.setAddress(employee.getAddress());
        employee1.setBasicSalary(employee.getBasicSalary());
        employee1.setBuildings(employee.getBuildings());
        employeeService.update(employee1);
        controllerResult = ControllerResult.getSuccessResult("信息修改成功");
        logger.info("修改了Id为"+employee.getId()+"员工的信息");
        return "changeMessage";
    }

    public String listByAgencyID(){
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("agency");
        if(obj != null) {
            Agency agency  = (Agency) obj;
            employees = employeeService.listByAgeencyId(agency.getId());
        }
        return "listByAgencyID";
    }

    public String logout(){
        HttpSession session = request.getSession();
        session.removeAttribute("employee");
        return "logout";
    }

    //跳转到修改头像页面
    public String upHeadIcon() {
        return "upHeadIcon";
    }

    //修改头像操作
    public String checkHeadIcon() {
        Object obj = request.getSession().getAttribute("employee");
        if(obj != null) {
            Employee employee = (Employee)obj;
            if(uploadFileName != null) {
                try {
                    FileUtils.copyFile(upload, new File(FileUtil.uploadPath() + File.separator + uploadFileName));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                employee.setHeadicon(Constants.UPLOADS + "/" + uploadFileName);
            } else {
                controllerResult = ControllerResult.getFailResult("修改失败");
                return "upHeadIcon";
            }
            employeeService.update(employee);
            logger.info("员工修改头像");
            controllerResult = ControllerResult.getSuccessResult("修改成功");
        } else {
            controllerResult = ControllerResult.getFailResult("修改失败");
        }
        return "checkHeadIcon";
    }

    /**
     * 获取员工资料
     * @return
     */
    public String getById(){
        Object obj = request.getSession().getAttribute("employee");
        if(obj != null) {
            Employee employee1 = (Employee)obj;
            employee = employeeService.getById(employee1.getId());
        }
        return "getById";
    }


    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
