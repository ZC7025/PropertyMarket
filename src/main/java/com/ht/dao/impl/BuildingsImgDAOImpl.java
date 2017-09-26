package com.ht.dao.impl;

import com.ht.bean.BuildingsImg;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.BuildingsImgDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by 7025 on 2017/9/2.
 */
public class BuildingsImgDAOImpl extends AbstractBaseDAO implements BuildingsImgDAO {
    @Override
    public void save(BuildingsImg buildingsImg) {
        getSessionFactory().getCurrentSession().save(buildingsImg);
    }

    @Override
    public void update(BuildingsImg buildingsImg) {

    }

    @Override
    public void updateStatus(BuildingsImg buildingsImg) {

    }

    @Override
    public void remove(BuildingsImg buildingsImg) {
        getSessionFactory().getCurrentSession().remove(buildingsImg);
    }

    @Override
    public Pager<BuildingsImg> listByPager(Pager<BuildingsImg> pager) {
        return null;
    }

    @Override
    public long count() {
        return (long) getSessionFactory().getCurrentSession().createQuery("select count(id) from BuildingsImg where buildings.id=:id").uniqueResult();
    }

    @Override
    public BuildingsImg getById(String s) {
        return null;
    }

    @Override
    public List<BuildingsImg> ListAll(String s) {
        return null;
    }

    @Override
    public Pager<BuildingsImg> listByPager(Pager<BuildingsImg> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from BuildingsImg where buildings.id=:id order by createdTime desc");
        query.setParameter("id", id);
        query.setFirstResult(pager.startIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int) count(id));
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public long count(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from BuildingsImg where buildings.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }
}
