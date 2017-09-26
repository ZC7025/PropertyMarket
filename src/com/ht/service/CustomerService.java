package ht.service;

import com.ht.bean.Customer;
import com.ht.common.bean.Pager;

import java.util.List;

public interface CustomerService extends BaseService<String,Customer> {

    List<Customer> listByAgencyId(String agencyId);

    List<Customer> lisBuyCustomerByEmployee(String employeeId);

    Pager<Customer> listByPagerAgencyId(Pager<Customer> pager, String agencyId);

    Pager<Customer> listByPagerEmployeeId(Pager<Customer> pager, String employeeId);


}
