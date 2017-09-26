package com.ht.service.impl;

import com.ht.bean.Customer;
import com.ht.common.bean.Pager;
import com.ht.dao.CustomerDAO;
import com.ht.service.CustomerService;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {

    private CustomerDAO customerDAO;

    public void setCustomerDAO(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }

    @Override
    public void save(Customer customer) {
        customerDAO.save(customer);
    }

    @Override
    public void update(Customer customer) {
        customerDAO.update(customer);
    }

    @Override
    public void updateStatus(Customer customer) {
        customerDAO.updateStatus(customer);
    }

    @Override
    public void remove(Customer customer) {
        customerDAO.remove(customer);
    }

    @Override
    public Pager<Customer> listByPager(Pager<Customer> pager) {
        return customerDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return customerDAO.count();
    }

    @Override
    public Customer getById(String s) {
        return customerDAO.getById(s);
    }

    @Override
    public List<Customer> ListAll(String s) {
        return customerDAO.ListAll(s);
    }

    @Override
    public List<Customer> listByAgencyId(String agencyId) {
        return customerDAO.listByAgencyId(agencyId);
    }

    @Override
    public List<Customer> lisBuyCustomerByEmployee(String employeeId) {
        return customerDAO.lisBuyCustomerByEmployee(employeeId);
    }

    @Override
    public Pager<Customer> listByPagerAgencyId(Pager<Customer> pager, String agencyId) {
        return customerDAO.listByPagerAgencyId(pager,agencyId);
    }

    @Override
    public Pager<Customer> listByPagerEmployeeId(Pager<Customer> pager, String employeeId) {
        return customerDAO.listByPagerEmployeeId(pager,employeeId);
    }
}
