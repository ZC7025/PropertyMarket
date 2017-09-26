package com.ht.dao.impl;

import com.ht.bean.ArticleType;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.ArticleTypeDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by sweet on 2017/8/31.
 */
public class ArticleTypeDAOImpl extends AbstractBaseDAO implements ArticleTypeDAO {

    @Override
    public void save(ArticleType articleType) {
        getSessionFactory().getCurrentSession().save(articleType);
    }

    @Override
    public void update(ArticleType articleType) {
        getSessionFactory().getCurrentSession().update(articleType);
    }

    @Override
    public void updateStatus(ArticleType articleType) {

    }

    @Override
    public void remove(ArticleType articleType) {
        getSessionFactory().getCurrentSession().delete(articleType);
    }

    @Override
    public Pager<ArticleType> listByPager(Pager<ArticleType> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from ArticleType");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int) count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public long count() {
        return (long) getSessionFactory().getCurrentSession().createQuery("select count(id) from ArticleType").uniqueResult();
    }

    @Override
    public ArticleType getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from ArticleType where id=:id");
        query.setParameter("id",s);
        return (ArticleType) query.uniqueResult();
    }

    @Override
    public List<ArticleType> ListAll(String s) {
        return null;
    }

    @Override
    public List<ArticleType> all() {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from ArticleType");
        List<ArticleType> articleTypes = query.list();
        return articleTypes;
    }
}
