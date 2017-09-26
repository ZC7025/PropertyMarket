package com.ht.controller;

import com.ht.bean.Agency;
import com.ht.bean.Customer;
import com.ht.bean.Employee;
import com.ht.common.Constants;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.common.util.FileUtil;
import com.ht.service.CustomerService;
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

public class CustomerController extends ActionSupport implements ServletRequestAware {

    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录
    private HttpServletRequest request;

    private CustomerService customerService;//set
    private EmployeeService employeeService;

    private Customer customer;
    private ControllerResult controllerResult;

    private List<Customer> rows;//get
    private int total;//get

    private int limit;//set
    private int offset;//set

    private File contract;//set
    private String contractFileName;//set

    private File archives;//set
    private String archivesFileName;//set

    public void setContract(File contract) {
        this.contract = contract;
    }

    public void setContractFileName(String contractFileName) {
        this.contractFileName = contractFileName;
    }

    public void setArchives(File archives) {
        this.archives = archives;
    }

    public void setArchivesFileName(String archivesFileName) {
        this.archivesFileName = archivesFileName;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public List<Customer> getRows() {
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

    public String addPage(){
        return "addPage";
    }

    /**
     * 经销商添加客户
     * @return
     */
    public String add(){
        customer.setCreatedTime(Calendar.getInstance().getTime());
        customer.setStatus(Constants.ACTIVATION);
        customerService.save(customer);
        logger.info("添加了一个姓名为"+customer.getName()+"客户");
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        return "add";
    }

    /**
     * 通过经销商查询所有的客户
     * @return
     */
    public String listByAgencyId(){
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("agency");
        if(obj != null) {
            Agency agency  = (Agency) obj;
            Pager<Customer> pager = new Pager<Customer>();
            pager.setBeginIndex(offset);
            pager.setPageSize(limit);
            pager = customerService.listByPagerAgencyId(pager,agency.getId());
            rows = pager.getResults();
            total = pager.getTotal();
        }
        return "listByAgencyId";
    }

    /**
     * 经销商查看所有客户页面
     * @return
     */
    public String allCustomerByAgency(){
        return "allCustomerByAgency";
    }

    public String changeStatus(){
        Customer customer = new Customer();
        customer.setId(request.getParameter("id"));
        customer.setStatus(Integer.valueOf(request.getParameter("status")));
        customerService.updateStatus(customer);
        logger.info("修改了id为"+customer.getId()+"的客户的状态");
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        return "changeStatus";
    }

    /**
     * 修改客户信息
     * @return
     */
    public String changeMessage(){
        String id = request.getParameter("id");
        Customer customer1 = customerService.getById(id);
        customer1.setAddress(customer.getAddress());
        customer1.setCustomerType(customer.getCustomerType());
        customerService.update(customer1);
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        logger.info("修改了id为"+customer.getId()+"信息");
        return "changeMessage";
    }

    /**
     * 通过员工添加客户
     * @return
     */
    public String addByEmployee(){
        Employee employee = employeeService.getById(customer.getEmployee().getId());
        Agency agency = employee.getAgency();
        customer.setAgency(agency);
        customer.setCreatedTime(Calendar.getInstance().getTime());
        customer.setStatus(1);
        customerService.save(customer);
        logger.info("id为"+employee.getId()+"员工添加了一个客户");
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        return "addByEmployee";
    }

    public String listByEmployeeId(){
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("employee");
        if(obj != null) {
            Employee employee  = (Employee) obj;
            Pager<Customer> pager = new Pager<Customer>();
            pager.setBeginIndex(offset);
            pager.setPageSize(limit);
            pager = customerService.listByPagerEmployeeId(pager,employee.getId());
            rows = pager.getResults();
            total = pager.getTotal();
        }
        return "listByEmployeeId";
    }

    public String addPageByEmployee(){
        return "addPageByEmployee";
    }

    public String allCustomerByEmployee(){
        return "allCustomerByEmployee";
    }

    public String input(){
        return "input";
    }

    /**
     * 通过员工查询已购房客户
     * @return
     */
    public String listBuyCustomerByEmployee(){
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("employee");
        if(obj != null) {
            Employee employee  = (Employee) obj;
            rows = customerService.lisBuyCustomerByEmployee(employee.getId());
        }
        return "listBuyCustomerByEmployee";
    }

    //上传购房合同
    public String uploading() {
        String id = request.getParameter("id");
        customer = customerService.getById(id);
        if (contractFileName != null ) {
            try {
                FileUtils.copyFile(contract, new File(FileUtil.uploadPath() + File.separator + contractFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            customer.setContract(Constants.UPLOADS + "/" + contractFileName);
        }
        if(archivesFileName != null) {
            try {
                FileUtils.copyFile(archives, new File(FileUtil.uploadPath() + File.separator + archivesFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            customer.setArchives(Constants.UPLOADS + "/" + archivesFileName);
        }
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        customerService.update(customer);
        return "uploading";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
