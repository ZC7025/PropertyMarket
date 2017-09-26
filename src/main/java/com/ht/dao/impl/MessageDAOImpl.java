package com.ht.dao.impl;

import com.ht.bean.Message;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.MessageDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by 7025 on 2017/9/5.
 */
public class MessageDAOImpl extends AbstractBaseDAO implements MessageDAO {
    @Override
    public void save(Message message) {
        getSessionFactory().getCurrentSession().save(message);
    }

    @Override
    public void update(Message message) {
        getSessionFactory().getCurrentSession().update(message);
    }

    @Override
    public void updateStatus(Message message) {
        getSessionFactory().getCurrentSession().update(message);
    }

    @Override
    public void remove(Message message) {
        getSessionFactory().getCurrentSession().remove(message);
    }

    @Override
    public Pager<Message> listByPager(Pager<Message> pager) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public Message getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Message where id=:id");
        query.setParameter("id",s);
        return (Message) query.uniqueResult();
    }

    @Override
    public List<Message> ListAll(String s) {
        return null;
    }

    @Override
    public long count(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Message where buildings.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<Message> listByPager(Pager<Message> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Message where buildings.id=:id order by leaveTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<Message> pager1 = new Pager<Message>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public long countMsg(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Message where agency.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<Message> listMsg(Pager<Message> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Message where agency.id=:id order by leaveTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<Message> pager1 = new Pager<Message>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public long countUserMsg(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Message where user.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<Message> listUserMsg(Pager<Message> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Message where user.id=:id order by leaveTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<Message> pager1 = new Pager<Message>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public long frontCount(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Message where buildings.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<Message> frontMsg(Pager<Message> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Message where buildings.id=:id order by leaveTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.startIndex());
        Pager<Message> pager1 = new Pager<Message>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }
}
