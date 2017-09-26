package ht.controller;

import com.ht.bean.*;
import com.ht.common.Constants;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.service.AppointmentService;
import com.ht.service.EmployeeService;
import com.ht.vo.EmployeePlus;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class AppointmentController extends ActionSupport implements ServletRequestAware {

    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录
    private HttpServletRequest request;

    private AppointmentService appointmentService;
    private EmployeeService employeeService;

    private Appointment appointment;
    private List<Appointment> rows;
    private int total;
    private int limit;//set
    private int offset;//set

    private ControllerResult controllerResult;//get


    public void setAppointmentService(AppointmentService appointmentService) {
        this.appointmentService = appointmentService;
    }

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public Appointment getAppointment() {
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }

    public List<Appointment> getRows() {
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

    public ControllerResult getControllerResult() {
        return controllerResult;
    }


    public String allAppointmentByEmployeePage(){
        return "allAppointmentByEmployeePage";
    }


    public String allAppointmentByAgencyPage(){
        return "allAppointmentByAgencyPage";
    }


    public String listByEmployee(){
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("employee");
        if(obj == null) {
            return "listByEmployee";
        }
        Employee employee  = (Employee) obj;
        Pager<Appointment> appointmentPager = new Pager<>();
        appointmentPager.setPageSize(limit);
        appointmentPager.setBeginIndex(offset);
        appointmentPager = appointmentService.listByEmployeeId(appointmentPager,employee.getId());
        rows = appointmentPager.getResults();
        total = appointmentPager.getTotal();
        return "listByEmployee";
    }

    public String listByAgency(){
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("agency");
        if(obj == null) {
            return  "listByAgency";
        }
        Agency agency  = (Agency) obj;
        Pager<Appointment> appointmentPager = new Pager<>();
        appointmentPager.setPageSize(limit);
        appointmentPager.setBeginIndex(offset);
        appointmentPager = appointmentService.listByAgencyId(appointmentPager,agency.getId());
        rows = appointmentPager.getResults();
        total = appointmentPager.getTotal();
        return  "listByAgency";
    }

    /**
     * 修改预约状态
     * @return
     */
    public String changeAppStatus(){
        String id = request.getParameter("id");
        String appStatus = request.getParameter("appStatus");
        Appointment appointment = appointmentService.getById(id);
        appointment.setAppStatus(appStatus);
        appointmentService.update(appointment);
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        logger.info("修改了id为"+appointment.getId()+"的预约的预约状态");
        return "changeAppStatus";
    }

    /**
     * 激活冻结
     * @return
     */
    public String changeStatus(){
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        Appointment appointment = appointmentService.getById(id);
        appointment.setStatus(Integer.valueOf(status));
        appointmentService.update(appointment);
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        logger.info("修改了id为"+appointment.getId()+"的状态");
        return "changeStatus";
    }

    /**
     * 添加看房时间
     * @return
     */
    public String addArriveTime(){
        String id = request.getParameter("id");
        String time = request.getParameter("arriveTime");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date date = sdf.parse(time);
            Appointment appointment1 = appointmentService.getById(id);
            appointment1.setArriveTime(date);
            appointmentService.update(appointment1);
            controllerResult = ControllerResult.getSuccessResult("添加成功");
            logger.info("添加了id为"+appointment1.getId()+"的看房时间");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "addArriveTime";
    }


    /**
     * 在楼盘页面点击预约按钮后进入选择员工预约
     * @return
     */
    public String appointmentByEmployee(){
        Object obj = request.getSession().getAttribute("user");
        if(obj == null) {
            return "appointmentByEmployee";
        }
        User user  = (User)obj;
        String buildsId = request.getParameter("buildsId");
        List<Employee> employees = new ArrayList<>();
        employees = employeeService.listByBuildings(buildsId);
        List<EmployeePlus> employeePluses = new ArrayList<>();
        for(int i = 0,size = employees.size();i<size;i++){
            Employee employee = employees.get(i);
            EmployeePlus employeePlus = new EmployeePlus();
            employeePlus.setId(employee.getId());
            employeePlus.setName(employee.getName());
            employeePlus.setPhone(employee.getPhone());
            employeePlus.setHeadicon(employee.getHeadicon());
            Appointment appointment = appointmentService.getByUserAndEmployee(user.getId(),employee.getId());
            if(appointment!=null){
                employeePlus.setHaveAppo(true);
            }
            employeePluses.add(employeePlus);
        }

        request.setAttribute("employees",employeePluses);
        request.setAttribute("buildsId",buildsId);
        return "appointmentByEmployee";
    }

    /**
     * 取消预约
     * @return
     */
    public String delAppointment(){
        String appointmentId = request.getParameter("appointmentId");
        Appointment appointment1 = new Appointment();
        appointment1.setId(appointmentId);
        appointmentService.remove(appointment1);
        controllerResult = ControllerResult.getSuccessResult("取消成功");
        logger.info("用户取消了一个预约");
        return "delAppointment";
    }

    public String delAppointmentByUserEmployee(){
        String userId = request.getParameter("userId");
        String employeeId = request.getParameter("employeeId");
        appointmentService.removeByUserEmployee(userId,employeeId);
        controllerResult = ControllerResult.getSuccessResult("您已取消预约");
        return "delAppointmentByUserEmployee";
    }

    /**
     * 判断用户是否已经预约某个员工
     * @return
     */
    public String judgtAppointmentByUser(){
        String userId = request.getParameter("userId");
        String buildsId = request.getParameter("buildsId");
        List<Employee> employees = employeeService.listByBuildings(buildsId);
        for(int i = 0,length = employees.size();i<length;i++){
            Employee employee = employees.get(i);
             appointment = appointmentService.getByUserAndEmployee(userId,employee.getId());
            if(appointment!=null){
                break;
            }
        }
        return "judgtAppointmentByUser";
    }

    /**
     * 添加预约
     * @return
     */
    public String addAppointment(){
        String employeeId = request.getParameter("employeeId");
        String userId = request.getParameter("userId");
        Employee employee = employeeService.getById(employeeId);
        Agency agency = new Agency();
        User user =new User();
        user.setId(userId);
        agency.setId(employee.getAgency().getId());
        appointment.setUser(user);
        appointment.setAgency(agency);
        appointment.setEmployee(employee);
        appointment.setStatus(Constants.ACTIVATION);
        appointment.setAppStatus("已预约");
        appointment.setCreatedTime(Calendar.getInstance().getTime());
        appointmentService.save(appointment);
        controllerResult = ControllerResult.getSuccessResult("预约成功");
        logger.info("添加了一个预约");
        return "addAppointment";
    }

    /**
     * 用户查看自己的预约页面
     * @return
     */
    public String seeAppointmentByUserPage(){
        return "seeAppointmentByUserPage";
    }

    /**
     * 通过用户查询自己的所有预约
     * @return
     */
    public String listByUser(){
        Object obj = request.getSession().getAttribute("user");
        if(obj != null) {
            User user  = (User)obj;
            Pager<Appointment> appointmentPager = new Pager<>();
            appointmentPager.setPageSize(limit);
            appointmentPager.setBeginIndex(offset);
            appointmentPager = appointmentService.listByUser(appointmentPager,user.getId());
            rows = appointmentPager.getResults();
            total = appointmentPager.getTotal();
        }
        return "listByUser";
    }

    /**
     * 修改预约
     * @return
     */
    public String changeAppointment(){
        String appArriveTimeStr = request.getParameter("appArriveTime");
        String houseId = request.getParameter("houseId");
        String appointmentId = request.getParameter("appointmentId");
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.DEFAULT_DATE_PATTERN);
        try {
            Date appArriveTime = sdf.parse(appArriveTimeStr);
            Appointment appointment1 = appointmentService.getById(appointmentId);
            appointment1.setAppArriveTime(appArriveTime);
            House house = new House();
            house.setId(houseId);
            appointment1.setHouse(house);
            appointmentService.update(appointment1);
            controllerResult = ControllerResult.getSuccessResult("修改成功");
            logger.info("用户修改了id为"+appointmentId+"的预约");
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return "changeAppointment";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
