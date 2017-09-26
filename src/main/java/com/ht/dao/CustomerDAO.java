package com.ht.dao;

import com.ht.bean.Customer;
import com.ht.common.bean.Pager;

import java.util.List;

public interface CustomerDAO extends BaseDAO<String,Customer>{

    List<Customer> listByAgencyId(String agencyId);

    List<Customer> lisBuyCustomerByEmployee(String employeeId);

    Pager<Customer> listByPagerAgencyId(Pager<Customer> pager, String agencyId);

    Pager<Customer> listByPagerEmployeeId(Pager<Customer> pager, String employeeId);
}
