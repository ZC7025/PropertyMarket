package com.ht.dao.impl;

import com.ht.bean.Ads;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.AdsDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by sweet on 2017/9/4.
 */
public class AdsDAOImpl extends AbstractBaseDAO implements AdsDAO {

    @Override
    public void save(Ads ads) {
        getSessionFactory().getCurrentSession().save(ads);
    }

    @Override
    public void update(Ads ads) {
        getSessionFactory().getCurrentSession().update(ads);
    }

    @Override
    public void updateStatus(Ads ads) {

    }

    @Override
    public void remove(Ads ads) {
        getSessionFactory().getCurrentSession().delete(ads);
    }

    @Override
    public Pager<Ads> listByPager(Pager<Ads> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Ads order by createdTime desc");
        query.setFirstResult(pager.startIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int)count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public long count() {
        return (long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Ads").uniqueResult();
    }

    @Override
    public Ads getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Ads where id=:id");
        query.setParameter("id", s);
        Ads ads = (Ads)query.uniqueResult();
        return ads;
    }

    @Override
    public List<Ads> ListAll(String s) {
        return null;
    }

    @Override
    public Pager<Ads> pager(Pager<Ads> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Ads");
        query.setFirstResult(pager.startIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int) count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public List<Ads> getAds() {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Ads where showStatus=1 and showOrder in (1,2) and status=1 order by createdTime desc");
        query.setFirstResult(0);
        query.setMaxResults(2);
        return query.list();
    }

    @Override
    public long checkedStatus(String showOrder) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Ads where showOrder=:showOrder and showStatus=1");
        query.setParameter("showOrder", Integer.valueOf(showOrder));
        return (long)query.uniqueResult();
    }
}
