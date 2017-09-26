package ht.controller;

import com.ht.bean.Employee;
import com.ht.bean.Room;
import com.ht.bean.Sale;
import com.ht.common.Constants;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.service.EmployeeService;
import com.ht.service.RoomService;
import com.ht.service.SaleService;
import com.ht.vo.SalePlus;
import com.ht.vo.charts.EmpSaleCount;
import com.ht.vo.charts.SaleCountCharts;
import com.ht.vo.charts.SaleMoneyCharts;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class SaleController extends ActionSupport implements ServletRequestAware {

    private final static Logger logger = Logger.getLogger(AdminController.class);
    private HttpServletRequest request;


    private EmployeeService employeeService;
    private SaleService saleService;
    private RoomService roomService;

    private Sale sale;
    private ControllerResult controllerResult;

    private List<SalePlus> rows;//get
    private int total;//get
    private SaleCountCharts saleCountCharts;
    private SaleMoneyCharts saleMoneyCharts;
    private EmpSaleCount empSaleCount;

    private int limit;//set
    private int offset;//set

    private String buildingsId;// get set

    /**
     * 查看售价统计
     * @return
     */
    public String saleMoney() {
        saleMoneyCharts = saleService.getSaleMoney(buildingsId, 7);
        return "saleMoney";
    }

    /**
     * 查看销售统计
     * @return
     */
    public String saleCount() {
        saleCountCharts = saleService.getSaleCount(buildingsId, 7);
        return "saleCount";
    }

    public String empCharts() {
        String empId = request.getParameter("id");
        empSaleCount = saleService.getEmpSale(empId, 7);
        return "empCharts";
    }

    public String getCustomer() {
        sale = saleService.getCustomerByRoomId(request.getParameter("roomId"));
        controllerResult = ControllerResult.getSuccessResult("查找成功");
        logger.info("查找客户信息");
        return "getCustomer";
    }

    /**
     * 添加销售记录
     * @return
     */
    public String add(){
        String roomId = request.getParameter("roomId");
        Employee employee = employeeService.getById(sale.getEmployee().getId());
        Room room = roomService.getById(roomId);
        sale.setUnitPrice(room.getHouse().getUnitPrice());
        sale.setAgency(employee.getAgency());
        sale.setCreatedTime(Calendar.getInstance().getTime());
        sale.setStatus(1);
        Set<Room> rooms = new HashSet<>();
        room.setSale(sale);
        rooms.add(room);
        sale.setRooms(rooms);
        saleService.save(sale);
        room.setSaleStatus(Constants.SOLD);
        roomService.updateStatus(room);
        logger.info("添加了客户id为"+sale.getCustomer().getId()+"销售记录");
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        return "add";
    }

    public String listByEmployeeId(){
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("employee");
        if(obj == null) {
            return "listByEmployeeId";
        }
        Employee employee =(Employee) obj;
        Pager<Sale> pager = new Pager<Sale>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        pager = saleService.listByEmployeeId(pager,employee.getId());
        List<Sale> sales = pager.getResults();
        rows = new ArrayList<>();
        for(int i = 0,size = sales.size();i < size;i++){
            Sale sale = sales.get(i);
            SalePlus salePlus = new SalePlus();
            for(Room room:(sale.getRooms())) {
                salePlus.setRoomName(room.getName());
            }
            salePlus.setId(sale.getId());
            salePlus.setSaleTime(sale.getSaleTime());
            salePlus.setUnitPrice(sale.getUnitPrice());
            salePlus.setDiscount(sale.getDiscount());
            salePlus.setTotalCost(sale.getTotalCost());
            salePlus.setCreatedTime(sale.getCreatedTime());
            salePlus.setStatus(sale.getStatus());
            salePlus.setCustomer(sale.getCustomer());
            rows.add(salePlus);
        }
        total = pager.getTotal();
        return "listByEmployeeId";
    }

    public String allSalePage(){
        return "allSalePage";
    }

    public String changeStatus(){
        Sale sale = new Sale();
        sale.setId(request.getParameter("id"));
        sale.setStatus(Integer.valueOf(request.getParameter("status")));
        saleService.updateStatus(sale);
        logger.info("修改了id为"+sale.getId()+"的销售记录的状态");
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        return "changeStatus";
    }

    /**
     * 修改销售几录
     * @return
     */
    public String changeSale(){
        String saleId = request.getParameter("id");
        String saleTime = request.getParameter("saleTime");
        String discount = request.getParameter("discount");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = sdf.parse(saleTime);
            Double discount1 = Double.valueOf(discount);

            Sale sale1 = saleService.getById(saleId);
            Room room = roomService.getBySale(saleId);
            sale1.setSaleTime(date);
            sale1.setDiscount(discount1);
            sale1.setTotalCost(discount1*room.getHouse().getArea()*room.getHouse().getUnitPrice());
            saleService.update(sale1);
            controllerResult = ControllerResult.getSuccessResult("修改成功");
            logger.info("修改了id为"+sale1.getId()+"的销售记录");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "changeSale";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }

    public String addSalePage(){
        return "addSalePage";
    }

    public String saleCountPage() {
        return "saleCountPage";
    }

    public String saleMoneyPage() {
        return "saleMoneyPage";
    }

    public String empChartsPage() {
        Object obj = request.getSession().getAttribute("employee");
        if(obj != null) {
            Employee employee =(Employee)obj;
            request.setAttribute("empId", employee.getId());
        }else {
            request.setAttribute("seeType", "unhidden");
            request.setAttribute("empId", request.getParameter("empId"));
        }
        return "empChartsPage";
    }

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public void setSaleService(SaleService saleService) {
        this.saleService = saleService;
    }

    public void setRoomService(RoomService roomService) {
        this.roomService = roomService;
    }

    public Sale getSale() {
        return sale;
    }

    public void setSale(Sale sale) {
        this.sale = sale;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public List<SalePlus> getRows() {
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

    public String getBuildingsId() {
        return buildingsId;
    }

    public void setBuildingsId(String buildingsId) {
        this.buildingsId = buildingsId;
    }

    public SaleCountCharts getSaleCountCharts() {
        return saleCountCharts;
    }

    public SaleMoneyCharts getSaleMoneyCharts() {
        return saleMoneyCharts;
    }

    public EmpSaleCount getEmpSaleCount() {
        return empSaleCount;
    }
}
