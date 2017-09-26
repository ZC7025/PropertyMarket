package com.ht.dao.impl;

import com.ht.bean.Customer;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.CustomerDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class CustomerDAOImpl extends AbstractBaseDAO implements CustomerDAO {
    @Override
    public void save(Customer customer) {
        getSessionFactory().getCurrentSession().save(customer);
    }

    @Override
    public void update(Customer customer) {
        getSessionFactory().getCurrentSession().update(customer);
    }

    @Override
    public void updateStatus(Customer customer) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("update Customer set status =:status where id=:id");
        query.setParameter("id",customer.getId());
        query.setParameter("status",customer.getStatus());
        query.executeUpdate();
    }

    @Override
    public void remove(Customer customer) {
        getSessionFactory().getCurrentSession().delete(customer);
    }

    @Override
    public Pager<Customer> listByPager(Pager<Customer> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Customer");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int)count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public long count() {
        Session session = getSessionFactory().getCurrentSession();
        long count = (long)session.createQuery("select count(id) from Customer").uniqueResult();
        return count;
    }

    public long countByEmployeeId(String employeeId){
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Customer where emp_id=:emp_id");
        query.setParameter("emp_id",employeeId);
        long count =(long) query.uniqueResult();
        return count;
    }

    @Override
    public Customer getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Customer where id=:id");
        query.setParameter("id",s);
        Customer customer = (Customer) query.uniqueResult();
        return customer;
    }

    @Override
    public List<Customer> ListAll(String s) {
        return null;
    }

    @Override
    public List<Customer> listByAgencyId(String agencyId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Customer where agency_id=:agency_id");
        query.setParameter("agency_id",agencyId);
        List<Customer> customers = query.list();
        return customers;
    }

    @Override
    public List<Customer> lisBuyCustomerByEmployee(String employeeId) {
        Session session  = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Customer where emp_id=:employeeId and customerType='购房客户'");
        query.setParameter("employeeId",employeeId);
        List<Customer> customers = query.list();
        return customers;
    }

    @Override
    public Pager<Customer> listByPagerAgencyId(Pager<Customer> pager, String agencyId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Customer where agency_id=:agency_id order by createdTime desc");
        query.setParameter("agency_id",agencyId);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int)count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public Pager<Customer> listByPagerEmployeeId(Pager<Customer> pager, String employeeId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Customer where emp_id=:emp_id order by createdTime desc");
        query.setParameter("emp_id",employeeId);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int)countByEmployeeId(employeeId));
        pager.setResults(query.list());
        return pager;
    }
}
