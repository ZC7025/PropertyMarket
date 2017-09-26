package com.ht.dao.impl;

import com.ht.bean.Employee;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.EmployeeDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by sweet on 2017/8/25.
 */
public class EmployeeDAOImpl extends AbstractBaseDAO implements EmployeeDAO {
    @Override
    public Employee getByPhonePwd(String phone, String pwd) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Employee where phone =:phone and pwd =:pwd");
        query.setParameter("phone", phone);
        query.setParameter("pwd", pwd);
        Employee employee = (Employee) query.uniqueResult();
        return employee;
    }

    @Override
    public Employee getByEmailPwd(String email, String pwd) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Employee where email =:email and pwd =:pwd");
        query.setParameter("email", email);
        query.setParameter("pwd", pwd);
        Employee employee = (Employee) query.uniqueResult();
        return employee;
    }

    @Override
    public List<Employee> listByAgeencyId(String agency_id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Employee where agency.id =:agency_id order by createdTime desc");
        query.setParameter("agency_id",agency_id);
        List<Employee>  employees = query.list();
        return employees;
    }

    @Override
    public Pager<Employee> listByAgency(Pager<Employee> pager, String agencyId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Employee where agency.id=:agencyId order by createdTime desc");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        query.setParameter("agencyId",agencyId);
        pager.setResults(query.list());
        pager.setTotal((int)countByAgency(agencyId));
        return pager;
    }

    @Override
    public List<Employee> listByBuildings(String buildingsId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Employee where buildings.id =:buildingsId order by createdTime desc");
        query.setParameter("buildingsId",buildingsId);
        List<Employee> employees = query.list();
        return employees;
    }

    @Override
    public void save(Employee employee) {
        getSessionFactory().getCurrentSession().save(employee);
    }

    @Override
    public void update(Employee employee) {
        getSessionFactory().getCurrentSession().update(employee);
    }

    @Override
    public void updateStatus(Employee employee) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("update Employee set status =:status where id=:id");
        query.setParameter("status",employee.getStatus());
        query.setParameter("id",employee.getId());
        query.executeUpdate();
    }

    @Override
    public void remove(Employee employee) {
        getSessionFactory().getCurrentSession().remove(employee);
    }

    @Override
    public Pager<Employee> listByPager(Pager<Employee> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Employee");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int)count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public long count() {
        Session session = getSessionFactory().getCurrentSession();
        long count = (long)session.createQuery("select count(id) from Employee").uniqueResult();
        return count;
    }

    @Override
    public Employee getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Employee employee = session.get(Employee.class, s);
        return employee;
    }

    @Override
    public List<Employee> ListAll(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query =session.createQuery("from Employee");
        List<Employee> employees = query.list();
        return employees;
    }

    public long countByAgency(String agencyId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Employee where agency.id=:agencyId");
        query.setParameter("agencyId",agencyId);
        long count  = (long)query.uniqueResult();
        return count;
    }
}
