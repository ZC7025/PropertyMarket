package com.ht.service.impl;

import com.ht.bean.Sale;
import com.ht.common.bean.Pager;
import com.ht.dao.SaleDAO;
import com.ht.service.SaleService;
import com.ht.vo.charts.EmpSaleCount;
import com.ht.vo.charts.SaleCountCharts;
import com.ht.vo.charts.SaleMoneyCharts;

import java.util.List;

public class SaleServiceImpl implements SaleService {

    private SaleDAO saleDAO;

    public SaleDAO getSaleDAO() {
        return saleDAO;
    }

    public void setSaleDAO(SaleDAO saleDAO) {
        this.saleDAO = saleDAO;
    }

    @Override
    public void save(Sale sale) {
        saleDAO.save(sale);
    }

    @Override
    public void update(Sale sale) {

    }

    @Override
    public void updateStatus(Sale sale) {
        saleDAO.updateStatus(sale);
    }

    @Override
    public void remove(Sale sale) {

    }

    @Override
    public Pager<Sale> listByPager(Pager<Sale> pager) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public Sale getById(String s) {
        return saleDAO.getById(s);
    }

    @Override
    public List<Sale> ListAll(String s) {
        return null;
    }

    @Override
    public Pager<Sale> listByEmployeeId(Pager<Sale> pager, String employeeId) {
        return saleDAO.listByEmployeeId(pager,employeeId);
    }

    @Override
    public long countByEmployeeId(String employeeId) {
        return saleDAO.countByEmployeeId(employeeId);
    }

    @Override
    public long countByEmployeeIdAndMonth(String employeeId, int month) {
        return saleDAO.countByEmployeeIdAndMonth(employeeId,month);
    }

    @Override
    public List<Sale> listAllByEmployeeId(String employeeId) {
        return saleDAO.listAllByEmployeeId(employeeId);
    }

    @Override
    public List<Sale> listByEmployeeIdAndMonth(String employeeId, int month) {
        return saleDAO.listByEmployeeIdAndMonth(employeeId,month);
    }

    @Override
    public SaleCountCharts getSaleCount(String buildsId, int week) {
        return saleDAO.getSaleCount(buildsId, week);
    }

    @Override
    public SaleMoneyCharts getSaleMoney(String buildsId, int week) {
        return saleDAO.getSaleMoney(buildsId, week);
    }

    @Override
    public EmpSaleCount getEmpSale(String empId, int week) {
        return saleDAO.getEmpSale(empId, week);
    }

    @Override
    public Sale getCustomerByRoomId(String roomId) {
        return saleDAO.getCustomerByRoomId(roomId);
    }
}
