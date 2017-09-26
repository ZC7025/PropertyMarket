package com.ht.dao.impl;

import com.ht.bean.Comment;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.CommentDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by 7025 on 2017/9/8.
 */
public class CommentDAOImpl extends AbstractBaseDAO implements CommentDAO {
    @Override
    public void save(Comment comment) {
        getSessionFactory().getCurrentSession().save(comment);
    }

    @Override
    public void update(Comment comment) {
        getSessionFactory().getCurrentSession().update(comment);
    }

    @Override
    public void updateStatus(Comment comment) {

    }

    @Override
    public void remove(Comment comment) {
        getSessionFactory().getCurrentSession().remove(comment);
    }

    @Override
    public Pager<Comment> listByPager(Pager<Comment> pager) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public Comment getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Comment where id=:id");
        query.setParameter("id",s);
        return (Comment) query.uniqueResult();
    }

    @Override
    public List<Comment> ListAll(String s) {
        return null;
    }

    @Override
    public long count(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Comment where buildings.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<Comment> listByPager(Pager<Comment> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Comment where buildings.id=:id order by commentTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<Comment> pager1 = new Pager<Comment>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public long countComm(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Comment where buildings.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<Comment> listComm(Pager<Comment> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Comment where agency.id=:id order by commentTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<Comment> pager1 = new Pager<Comment>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public long countUserComm(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Comment where user.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<Comment> listUserComm(Pager<Comment> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Comment where user.id=:id order by commentTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<Comment> pager1 = new Pager<Comment>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public long frontCount(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Comment where buildings.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<Comment> frontComm(Pager<Comment> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Comment where buildings.id=:id order by commentTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.startIndex());
        Pager<Comment> pager1 = new Pager<Comment>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }
}
