package com.ht.service.impl;

import com.ht.bean.Employee;
import com.ht.common.bean.Pager;
import com.ht.dao.EmployeeDAO;
import com.ht.service.EmployeeService;

import java.util.List;

/**
 * Created by sweet on 2017/8/25.
 */
public class EmployeeServiceImpl implements EmployeeService {

    private EmployeeDAO employeeDAO;

    public void setEmployeeDAO(EmployeeDAO employeeDAO) {
        this.employeeDAO = employeeDAO;
    }

    @Override
    public Employee getByPhonePwd(String phone, String pwd) {
        return employeeDAO.getByPhonePwd(phone, pwd);
    }

    @Override
    public Employee getByEmailPwd(String email, String pwd) {
        return employeeDAO.getByEmailPwd(email, pwd);
    }

    @Override
    public List<Employee> listByAgeencyId(String agency_id) {
        return employeeDAO.listByAgeencyId(agency_id);
    }

    @Override
    public Pager<Employee> listByAgency(Pager<Employee> pager, String agencyId) {
        return employeeDAO.listByAgency(pager,agencyId);
    }

    @Override
    public List<Employee> listByBuildings(String buildingsId) {
        return employeeDAO.listByBuildings(buildingsId);
    }

    @Override
    public void save(Employee employee) {
        employeeDAO.save(employee);
    }

    @Override
    public void update(Employee employee) {
        employeeDAO.update(employee);
    }

    @Override
    public void updateStatus(Employee employee) {
        employeeDAO.updateStatus(employee);
    }

    @Override
    public void remove(Employee employee) {
        employeeDAO.remove(employee);
    }

    @Override
    public Pager<Employee> listByPager(Pager<Employee> pager) {
        return employeeDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return employeeDAO.count();
    }

    @Override
    public Employee getById(String s) {
        return employeeDAO.getById(s);
    }

    @Override
    public List<Employee> ListAll(String s) {
       return employeeDAO.ListAll(s);
    }
}
