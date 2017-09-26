package com.ht.dao.impl;

import com.ht.bean.History;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.HistoryDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by 7025 on 2017/9/11.
 */
public class HistoryDAOImpl extends AbstractBaseDAO implements HistoryDAO {
    @Override
    public void save(History history) {
        getSessionFactory().getCurrentSession().save(history);
    }

    @Override
    public void update(History history) {
        getSessionFactory().getCurrentSession().update(history);
    }

    @Override
    public void updateStatus(History history) {

    }

    @Override
    public void remove(History history) {
        getSessionFactory().getCurrentSession().remove(history);
    }

    @Override
    public Pager<History> listByPager(Pager<History> pager) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public History getById(String s) {
        return null;
    }

    @Override
    public List<History> ListAll(String s) {
        return null;
    }

    @Override
    public long countHistory(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from History where user.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<History> listByPager(Pager<History> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from History where user.id=:id order by createdTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<History> pager1 = new Pager<History>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public History getById(String userId, String buildingsId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from History where user.id=:userId and buildings.id=:buildsId");
        query.setParameter("userId",userId);
        query.setParameter("buildsId",buildingsId);
        return (History) query.uniqueResult();
    }

    @Override
    public void remove(List<History> histories) {
        Session session = getSessionFactory().getCurrentSession();
        for(int i=0; i<histories.size(); i++) {
            session.remove(histories.get(i));
            if(i % 50 == 0) {
                session.flush();
                session.clear();
            }
        }
    }
}
