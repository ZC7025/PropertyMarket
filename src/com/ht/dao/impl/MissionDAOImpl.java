package ht.dao.impl;

import com.ht.bean.Mission;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.MissionDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class MissionDAOImpl extends AbstractBaseDAO implements MissionDAO{
    @Override
    public void save(Mission mission) {
        getSessionFactory().getCurrentSession().save(mission);
    }

    @Override
    public void update(Mission mission) {
        getSessionFactory().getCurrentSession().update(mission);
    }

    @Override
    public void updateStatus(Mission mission) {

    }

    @Override
    public void remove(Mission mission) {
        getSessionFactory().getCurrentSession().delete(mission);
    }

    @Override
    public Pager<Mission> listByPager(Pager<Mission> pager) {
        return null;
    }

    @Override
    public long count() {
        Session session = getSessionFactory().getCurrentSession();
        long count = (long)session.createQuery("select count(id) from Mission").uniqueResult();
        return count;
    }

    @Override
    public Mission getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Mission where id=:id");
        query.setParameter("id",s);
        Mission mission =(Mission) query.uniqueResult();
        return mission;
    }

    @Override
    public List<Mission> ListAll(String s) {
        return null;
    }


    @Override
    public Pager<Mission> listMissionByMonth(Pager<Mission> pager,String month) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Mission where monthes=:month");
        query.setParameter("month",month);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        pager.setTotal((int)countByMonth(month));
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public Pager<Mission> listMissionByEmployeeId(Pager<Mission> pager,String employeeId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Mission where emp_id=:emp_id");
        query.setParameter("emp_id",employeeId);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResults(query.list());
        pager.setTotal((int) countByEmployeeId(employeeId));
        return pager;
    }




    public long countByMonth(String month){
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Mission where monthes=:month");
        query.setParameter("month",month);
        long count = (long) query.uniqueResult();
        return count;
    }

    public long countByEmployeeId(String employeeId){
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Mission where emp_id=:emp_id");
        query.setParameter("emp_id",employeeId);
        long count = (long) query.uniqueResult();
        return count;
    }
}
