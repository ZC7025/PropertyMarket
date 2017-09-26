package com.ht.dao.impl;

import com.ht.bean.Building;
import com.ht.common.CommonMethod;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.BuildingDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by 7025 on 2017/8/29.
 */
public class BuildingDAOImpl extends AbstractBaseDAO implements BuildingDAO {
    @Override
    public void save(Building building) {
        getSessionFactory().getCurrentSession().save(building);
    }

    @Override
    public void update(Building building) {
        getSessionFactory().getCurrentSession().update(building);
    }

    @Override
    public void updateStatus(Building building) {
        getSessionFactory().getCurrentSession().update(building);
    }

    @Override
    public void remove(Building building) {
        getSessionFactory().getCurrentSession().remove(building);
    }

    @Override
    public Pager<Building> listByPager(Pager<Building> pager) {
        Session session = getSessionFactory().getCurrentSession();
        return new CommonMethod<Building>().getPager("Building", session, pager);
    }

    @Override
    public long count() {
        return (long)getSessionFactory().getCurrentSession().createQuery("select count(id) from Building").uniqueResult();
    }

    @Override
    public Building getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Building where id=:id");
        query.setParameter("id",s);
        return (Building) query.uniqueResult();
    }

    @Override
    public List<Building> ListAll(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Building where id=:id");
        query.setParameter("id",s);
        return query.list();
    }

    @Override
    public long count(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Building where buildings.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<Building> listBuilding(Pager<Building> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Building where buildings.id=:id order by createdTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<Building> pager1 = new Pager<Building>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public Pager<Building> listByPager(Pager<Building> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Building where agency.id=:id order by createdTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<Building> pager1 = new Pager<Building>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public long countBuild(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Building where agency.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public List<Building> listByEmployeeId(String employeeId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Building where buildings.id=:id");
        query.setParameter("id",employeeId);
        List<Building> buildings = query.list();
        return buildings;
    }

    @Override
    public int countFloor(String buildId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select totalFloor from Building  where id=:id");
        query.setParameter("id",buildId);
        int floor =(int) query.uniqueResult();
        return floor;
    }

    @Override
    public Pager<Building> frontBuild(Pager<Building> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Building where status = 1 order by createdTime desc");
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.startIndex());
        Pager<Building> pager1 = new Pager<Building>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public long frontCount() {
        return (long)getSessionFactory().getCurrentSession().createQuery("select count(id) from Building where status = 1").uniqueResult();
    }
}
