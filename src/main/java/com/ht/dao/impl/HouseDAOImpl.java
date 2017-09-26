package com.ht.dao.impl;

import com.ht.bean.House;
import com.ht.common.CommonMethod;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.HouseDAO;
import com.ht.vo.Search;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 7025 on 2017/8/29.
 */
public class HouseDAOImpl extends AbstractBaseDAO implements HouseDAO {
    @Override
    public void save(House house) {
        getSessionFactory().getCurrentSession().save(house);
    }

    @Override
    public void update(House house) {
        getSessionFactory().getCurrentSession().update(house);
    }

    @Override
    public void updateStatus(House house) {
        getSessionFactory().getCurrentSession().update(house);
    }

    @Override
    public void remove(House house) {
        getSessionFactory().getCurrentSession().remove(house);
    }

    @Override
    public Pager<House> listByPager(Pager<House> pager) {
        Session session = getSessionFactory().getCurrentSession();
        return new CommonMethod<House>().getPager("House", session, pager);
    }

    @Override
    public long count() {
        return (long)getSessionFactory().getCurrentSession().createQuery("select count(id) from House").uniqueResult();
    }

    @Override
    public House getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from House where id=:id");
        query.setParameter("id",s);
        return (House) query.uniqueResult();
    }

    @Override
    public List<House> ListAll(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from House where buildings.id=:id order by createdTime desc");
        query.setParameter("id", s);
        return query.list();
    }

    @Override
    public long count(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from House where buildings.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<House> listHouse(Pager<House> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from House where buildings.id=:id order by createdTime desc");
        query.setParameter("id", id);
        query.setFirstResult(pager.startIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int) count(id));
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public long countHouse(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from House where agency.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<House> housePager(Pager<House> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from House where agency.id=:id order by createdTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<House> pager1 = new Pager<House>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public List<House> randomHouse(int size) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from House where status=1 order by rand()");
        query.setFirstResult(0);
        query.setMaxResults(size);
        return query.list();
    }

    @Override
    public Pager<House> housePager(Pager<House> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from House where status=1 order by createdTime desc");
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<House> pager1 = new Pager<House>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public long countChecked() {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from House where status=1");
        return (long)query.uniqueResult();
    }

    @Override
    public List<House> listByBuildings(String buildingsId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query  = session.createQuery("from House where buildings.id =:buildingsId");
        query.setParameter("buildingsId",buildingsId);
        List<House> houses = query.list();
        return houses;
    }

    @Override
    public List<Search> getSearchList(String searchStr) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select h.name,h.id from House h where h.name like :searchStr and status=1");
        query.setParameter("searchStr","%"+searchStr+"%");
        query.setFirstResult(0);
        query.setMaxResults(10);
        List<Object[]> objects = query.list();
        List<Search> searches = new ArrayList<>();
        for(Object[] obj : objects) {
            Search search = new Search();
            search.setName((String)obj[0]);
            search.setSpell("");
            search.setId((String)obj[1]);
            searches.add(search);
        }
        return searches;
    }
}
