package com.ht.dao;

import com.ht.bean.Sale;
import com.ht.common.bean.Pager;
import com.ht.vo.charts.EmpSaleCount;
import com.ht.vo.charts.SaleCountCharts;
import com.ht.vo.charts.SaleMoneyCharts;

import java.util.List;


public interface SaleDAO extends BaseDAO<String,Sale> {

    Pager<Sale> listByEmployeeId(Pager<Sale> pager, String employeeId);

    long countByEmployeeId(String employeeId);

    long countByEmployeeIdAndMonth(String employeeId, int month);

    List<Sale> listAllByEmployeeId(String employeeId);

    List<Sale> listByEmployeeIdAndMonth(String employeeId, int month);

    /**
     * 单个楼盘销售量统计图表
     * @param buildsId id
     * @param week 周数
     * @return
     */
    SaleCountCharts getSaleCount(String buildsId, int week);

    /**
     * 单个楼盘销售价格统计图表
     * @param buildsId id
     * @param week 周数
     * @return
     */
    SaleMoneyCharts getSaleMoney(String buildsId, int week);

    /**
     * 单个员工销售记录统计图表
     * @param empId
     * @param week
     * @return
     */
    EmpSaleCount getEmpSale(String empId, int week);

    /**
     * 通过roomID查找客户信息
     * @param roomId
     * @return
     */
    Sale getCustomerByRoomId(String roomId);
}
