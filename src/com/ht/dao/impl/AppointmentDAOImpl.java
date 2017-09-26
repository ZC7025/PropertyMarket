package ht.dao.impl;

import com.ht.bean.Appointment;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.AppointmentDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class AppointmentDAOImpl extends AbstractBaseDAO implements AppointmentDAO{
    @Override
    public void save(Appointment appointment) {
        getSessionFactory().getCurrentSession().save(appointment);
    }

    @Override
    public void update(Appointment appointment) {
        getSessionFactory().getCurrentSession().update(appointment);
    }

    @Override
    public void updateStatus(Appointment appointment) {

    }

    @Override
    public void remove(Appointment appointment) {
        getSessionFactory().getCurrentSession().delete(appointment);
    }

    @Override
    public Pager<Appointment> listByPager(Pager<Appointment> pager) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public Appointment getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Appointment where id =:id");
        query.setParameter("id",s);
        Appointment appointment =(Appointment) query.uniqueResult();
        return appointment;
    }

    @Override
    public List<Appointment> ListAll(String s) {
        return null;
    }

    @Override
    public Pager listByEmployeeId(Pager<Appointment> pager, String employeeId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Appointment where employee.id=:emp_id  ORDER BY createdTime desc");
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        query.setParameter("emp_id",employeeId);
        pager.setResults(query.list());
        pager.setTotal((int)countByEmployeeId(employeeId));
        return pager;
    }

    @Override
    public Pager listByAgencyId(Pager<Appointment> pager, String agencyId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Appointment where agency.id=:agency_id  ORDER BY createdTime desc");
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        query.setParameter("agency_id",agencyId);
        pager.setResults(query.list());
        pager.setTotal((int)countByAgencyId(agencyId));
        return pager;
    }

    @Override
    public Appointment getByUserAndBuildings(String userId, String buildingsId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select a from Buildings b,Appointment a,Employee e where a.user.id =:userId and" +
                " a.employee.id = e.id and e.buildings.id = b.id and b.id =:buildingsId");
        query.setParameter("userId",userId);
        query.setParameter("buildingsId",buildingsId);
        Appointment appointment = (Appointment) query.uniqueResult();
        return appointment;
    }

    @Override
    public Appointment getByUserAndEmployee(String userId, String employeeId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Appointment where user.id=:userId and employee.id =:employeeId");
        query.setParameter("userId",userId);
        query.setParameter("employeeId",employeeId);
        Appointment appointment = (Appointment) query.uniqueResult();
        return appointment;
    }

    @Override
    public void removeByUserEmployee(String userId, String employeeId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("delete from Appointment where user.id =:userId and employee.id=:employeeId");
        query.setParameter("userId",userId);
        query.setParameter("employeeId",employeeId);
        query.executeUpdate();
    }

    @Override
    public Pager<Appointment> listByUser(Pager<Appointment> pager, String userId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Appointment where user.id=:userId  ORDER BY createdTime desc");
        query.setParameter("userId",userId);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        pager.setResults(query.list());
        pager.setTotal((int)countByUserId(userId));
        return pager;
    }


    public long countByAgencyId(String agencyId){
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count (id) from Appointment where agency.id=:agency_id ");
        query.setParameter("agency_id",agencyId);
        long count = (long) query.uniqueResult();
        return count;
    }

    public long countByEmployeeId(String employeeId){
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count (id) from Appointment where employee.id=:emp_id ");
        query.setParameter("emp_id",employeeId);
        long count = (long) query.uniqueResult();
        return count;
    }

    public long countByUserId(String userId){
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count (id) from Appointment where user.id=:userId ");
        query.setParameter("userId",userId);
        long count = (long) query.uniqueResult();
        return count;
    }
}
