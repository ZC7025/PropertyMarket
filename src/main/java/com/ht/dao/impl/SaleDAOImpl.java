package com.ht.dao.impl;

import com.ht.bean.Sale;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.SaleDAO;
import com.ht.vo.charts.*;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class SaleDAOImpl extends AbstractBaseDAO implements SaleDAO {
    @Override
    public void save(Sale sale) {
        getSessionFactory().getCurrentSession().save(sale);
    }

    @Override
    public void update(Sale sale) {

    }

    @Override
    public void updateStatus(Sale sale) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("update Sale set status =:status where id=:id");
        query.setParameter("status",sale.getStatus());
        query.setParameter("id",sale.getId());
        query.executeUpdate();
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
        Session session =getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Sale where id=:id");
        query.setParameter("id",s);
        Sale sale = (Sale) query.uniqueResult();
        return sale;
    }

    @Override
    public List<Sale> ListAll(String s) {
        return null;
    }


    @Override
    public Pager<Sale> listByEmployeeId(Pager<Sale> pager,String employeeId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Sale where emp_id =:emp_id order by createdTime desc");
        query.setParameter("emp_id",employeeId);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int)countByEmployeeId(employeeId));
        pager.setResults(query.list());
        return pager;
    }


    public long countByEmployeeId(String employeeId){
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select  count(id) from Sale where emp_id=:emp_id");
        query.setParameter("emp_id",employeeId);
        long count =(long) query.uniqueResult();
        return count;
    }

    @Override
    public long countByEmployeeIdAndMonth(String employeeId, int month) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select  count(id) from Sale where  emp_id=:emp_id and month(sale_time) =:month");
        query.setParameter("emp_id",employeeId);
        query.setParameter("month",month);
        long count =(long) query.uniqueResult();
        return count;
    }

    @Override
    public List<Sale> listAllByEmployeeId(String employeeId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Sale where emp_id =:emp_id");
        query.setParameter("emp_id",employeeId);
        List<Sale> sales = query.list();
        return sales;
    }

    @Override
    public List<Sale> listByEmployeeIdAndMonth(String employeeId, int month) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Sale where month(sale_time) =:month and emp_id =:emp_id");
        query.setParameter("emp_id",employeeId);
        query.setParameter("month",month);
        List<Sale> sales = query.list();
        return sales;
    }

    @Override
    public SaleCountCharts getSaleCount(String buildsId, int week) {
        Session session = getSessionFactory().getCurrentSession();
        SaleCountCharts saleCountCharts = new SaleCountCharts();
        int[] tempData = new int[week];
        String[] tempStr = new String[week];
        List<HighchartsLine<Integer>> highchartsLines = new ArrayList<>();
        HighchartsLine<Integer> highchartsLine = new HighchartsLine<>();
        List<Integer> data = new ArrayList<>();
        for(int i = 0; i < week; i++) {
            Query query = session.createQuery("select count(id) from Sale where employee.id in (select id from Employee where buildings.id =:buildsId) and week(createdTime) = week(curdate())-"+i);
            query.setParameter("buildsId", buildsId);
            Long temp =(long) query.uniqueResult();
            data.add(temp.intValue());
            tempStr[i] = (i+1) + "周前";
            if(i == week-1) {
                session.flush();
                session.clear();
            }
        }
        highchartsLine.setName("销售量");
        highchartsLine.setData(data);
        highchartsLines.add(highchartsLine);
        saleCountCharts.setSeries(highchartsLines);
        XAxis xAxis = new XAxis();
        xAxis.setCategories(tempStr);
        saleCountCharts.setxAxis(xAxis);
        return saleCountCharts;
    }

    @Override
    public SaleMoneyCharts getSaleMoney(String buildsId, int week) {
        Session session = getSessionFactory().getCurrentSession();
        SaleMoneyCharts saleMoneyCharts = new SaleMoneyCharts();
        int[] tempData = new int[week];
        String[] tempStr = new String[week];
        List<HighchartsLine<Double>> highchartsLines = new ArrayList<>();
        HighchartsLine<Double> highchartsLine = new HighchartsLine<>();
        List<Double> data = new ArrayList<>();
        for(int i = 0; i < week; i++) {
            Query query = session.createQuery("select sum(totalCost) from Sale where employee.id in (select id from Employee where buildings.id =:buildsId) and week(createdTime) = week(curdate())-"+i);
            query.setParameter("buildsId", buildsId);
            if(query.uniqueResult() != null) {
                data.add((double)query.uniqueResult());
            } else {
                data.add(0.0);
            }
            tempStr[i] = (i+1) + "周前";
            if(i == week-1) {
                session.flush();
                session.clear();
            }
        }
        highchartsLine.setName("销售价");
        highchartsLine.setData(data);
        highchartsLines.add(highchartsLine);
        saleMoneyCharts.setSeries(highchartsLines);
        XAxis xAxis = new XAxis();
        xAxis.setCategories(tempStr);
        saleMoneyCharts.setxAxis(xAxis);
        return saleMoneyCharts;
    }

    @Override
    public EmpSaleCount getEmpSale(String empId, int week) {
        Session session = getSessionFactory().getCurrentSession();
        EmpSaleCount empSaleCount = new EmpSaleCount();
        int[] tempData = new int[week];
        String[] tempStr = new String[week];
        List<HighchartsLine<Integer>> highchartsLines = new ArrayList<>();
        HighchartsLine<Integer> highchartsLine = new HighchartsLine<>();
        List<Integer> data = new ArrayList<>();
        for(int i = 0; i < week; i++) {
            Query query = session.createQuery("select count(id) from Sale where employee.id=:empId and week(createdTime) = week(curdate())-"+i);
            query.setParameter("empId", empId);
            Long temp =(long) query.uniqueResult();
            data.add(temp.intValue());
            tempStr[i] = (i+1) + "周前";
            if(i == week-1) {
                session.flush();
                session.clear();
            }
        }
        highchartsLine.setName("销售量");
        highchartsLine.setData(data);
        highchartsLines.add(highchartsLine);
        empSaleCount.setSeries(highchartsLines);
        XAxis xAxis = new XAxis();
        xAxis.setCategories(tempStr);
        empSaleCount.setxAxis(xAxis);
        return empSaleCount;
    }

    @Override
    public Sale getCustomerByRoomId(String roomId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Sale where id=(select sale.id from Room where id=:roomId)");
        query.setParameter("roomId", roomId);
        return (Sale)query.uniqueResult();
    }
}
