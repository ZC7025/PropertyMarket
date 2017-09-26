package com.ht.controller;

import com.ht.bean.Agency;
import com.ht.bean.Employee;
import com.ht.bean.Mission;
import com.ht.bean.Sale;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.service.EmployeeService;
import com.ht.service.MissionService;
import com.ht.service.SaleService;
import com.ht.vo.MissionPlus;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class MissionController extends ActionSupport implements ServletRequestAware {

    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录
    private HttpServletRequest request;

    private EmployeeService employeeService;
    private MissionService missionService;
    private SaleService saleService;
    private List<MissionPlus> rows;//get
    private int total;//get

    private int limit;//set
    private int offset;//set

    private String month;
    private String month1;

    private Mission mission;

    private ControllerResult controllerResult;

    public MissionController() {
    }


    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public void setMissionService(MissionService missionService) {
        this.missionService = missionService;
    }

    public void setSaleService(SaleService saleService) {
        this.saleService = saleService;
    }

    public List<MissionPlus> getRows() {
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

    public String allMissionPage(){
        return "allMissionPage";
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public Mission getMission() {
        return mission;
    }

    public void setMission(Mission mission) {
        this.mission = mission;
    }

    public String add(){
        if(month1 == null || month1==""){
            month1 = "2017-08";
        }
        Object obj = request.getSession().getAttribute("agency");
        if(obj == null) {
            controllerResult = ControllerResult.getFailResult("初始化失败");
            return "add";
        }
        Agency agency  = (Agency) obj;
        List<Employee> employees = employeeService.listByAgeencyId(agency.getId());
        for (int i = 0,size = employees.size();i<size;i++ ){
            Mission mission  = new Mission();
            mission.setBonusPercent(0.0010);
            mission.setMonthes(month1);
            mission.setQuantity(5);
            Employee employee = new Employee();
            employee.setId(employees.get(i).getId());
            mission.setEmployee(employee);
            missionService.save(mission);
        }
        controllerResult = ControllerResult.getSuccessResult("初始化成功");
        logger.info("初始化了"+month+"的绩效数据");
        month = month1;
        return "add";
    }

    public String listMissionByMonth(){

        //默认月份
        if(month == null || month==""){
            month = "2017-08";
        }

        String month2  = month.substring(month.length()-2,month.length());

        Pager<Mission> missionPager = new Pager<Mission>();
        missionPager.setPageSize(limit);
        missionPager.setBeginIndex(offset);
        missionPager = missionService.listMissionByMonth(missionPager,month);
        total = missionPager.getTotal();

        rows = new ArrayList<MissionPlus>();

        for (int i = 0,max = missionPager.getResults().size(); i<max;i++){
            MissionPlus missionPlus = new MissionPlus();
            Mission mission = missionPager.getResults().get(i);
            missionPlus.setId(mission.getId());
            missionPlus.setBonusPercent(mission.getBonusPercent());
            missionPlus.setEmployee(mission.getEmployee());
            missionPlus.setMonthes(mission.getMonthes());
            missionPlus.setQuantity(mission.getQuantity());
            List<Sale>  sales = saleService.listByEmployeeIdAndMonth(mission.getEmployee().getId(),Integer.valueOf(month2));
            Double salary = 0.0;
            for(int j = 0,size = sales.size();j < size;j++){
                salary += sales.get(j).getTotalCost();
            }
            missionPlus.setLastSalary(missionPlus.getEmployee().getBasicSalary()+salary*mission.getBonusPercent());
            missionPlus.setSaleCount((int)saleService.countByEmployeeIdAndMonth(mission.getEmployee().getId(),Integer.valueOf(month2)));
            rows.add(missionPlus);
        }
        controllerResult = ControllerResult.getSuccessResult("查询成功");
        //month = null;
        return "listMissionByMonth";
    }

    public String changeMission(){
        Mission mission1 = missionService.getById(mission.getId());
        mission1.setQuantity(mission.getQuantity());
        mission1.setBonusPercent(mission.getBonusPercent());
        missionService.update(mission1);
        logger.info("修改了id为"+mission1.getId()+"的绩效数据");
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        return "changeMission";
    }

    public String month(){
        month = request.getParameter("month");
        month1 = month;
        return "month";
    }

    /**
     *员工查看自己的业绩的页面
     * @return
     */
    public String missionsByEmplloyeePage(){
        return "missionsByEmplloyeePage";
    }

    /**
     * 员工查看自己的业绩
     * @return
     */
    public String listByEmployee(){
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("employee");
        if(obj == null) {
            return "listByEmployee";
        }
        Employee employee  = (Employee) obj;
        Pager<Mission> missionPager = new Pager<>();
        missionPager.setBeginIndex(offset);
        missionPager.setPageSize(limit);
        missionPager = missionService.listMissionByEmployeeId(missionPager,employee.getId());
        List<Mission> missions  =  new ArrayList<>();
        missions = missionPager.getResults();
        total = missionPager.getTotal();
        rows = new ArrayList<MissionPlus>();
        for (int i=0,max=missions.size();i<max;i++){
            MissionPlus missionPlus = new MissionPlus();
            Mission mission = missions.get(i);
            missionPlus.setEmployee(mission.getEmployee());
            missionPlus.setBonusPercent(mission.getBonusPercent());
            missionPlus.setId(mission.getId());
            missionPlus.setQuantity(mission.getQuantity());
            missionPlus.setMonthes(mission.getMonthes());
            String month2 = mission.getMonthes();
            month2  = month2.substring(month2.length()-1,month2.length());
            List<Sale>  sales = saleService.listByEmployeeIdAndMonth(mission.getEmployee().getId(),Integer.valueOf(month2));
            Double salary = 0.0;
            for(int j = 0,size = sales.size();j < size;j++){
                salary += sales.get(j).getTotalCost();
            }
            missionPlus.setLastSalary(missionPlus.getEmployee().getBasicSalary()+salary*mission.getBonusPercent());
            missionPlus.setSaleCount((int)saleService.countByEmployeeIdAndMonth(mission.getEmployee().getId(),Integer.valueOf(month2)));
            rows.add(missionPlus);
        }
        return "listByEmployee";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
