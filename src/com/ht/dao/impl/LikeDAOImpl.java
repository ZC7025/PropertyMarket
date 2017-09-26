package com.ht.dao.impl;

import com.ht.bean.Like;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.LikeDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by 7025 on 2017/9/11.
 */
public class LikeDAOImpl extends AbstractBaseDAO implements LikeDAO {
    @Override
    public long countLike(String userId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Like where user.id=:id");
        query.setParameter("id", userId);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<Like> listLike(Pager<Like> pager, String userId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Like where user.id=:id order by createdTime desc");
        query.setParameter("id", userId);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<Like> pager1 = new Pager<Like>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public Like getLike(String userId, String buildingsId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Like where user.id=:userId and buildings.id=:buildsId");
        query.setParameter("userId",userId);
        query.setParameter("buildsId",buildingsId);
        return (Like) query.uniqueResult();
    }

    @Override
    public void remove(List<Like> likes) {
        Session session = getSessionFactory().getCurrentSession();
        for(int i=0, len = likes.size(); i<len; i++) {
            session.remove(likes.get(i));
            if(i % 50 == 0) {
                session.flush();
                session.clear();
            }
        }
    }

    @Override
    public void save(Like like) {
        getSessionFactory().getCurrentSession().save(like);
    }

    @Override
    public void update(Like like) {

    }

    @Override
    public void updateStatus(Like like) {

    }

    @Override
    public void remove(Like like) {
        getSessionFactory().getCurrentSession().remove(like);
    }

    @Override
    public Pager<Like> listByPager(Pager<Like> pager) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public Like getById(String s) {
        return null;
    }

    @Override
    public List<Like> ListAll(String s) {
        return null;
    }
}
