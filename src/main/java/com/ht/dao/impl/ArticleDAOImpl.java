package com.ht.dao.impl;

import com.ht.bean.Article;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.ArticleDAO;
import com.ht.vo.Search;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by sweet on 2017/8/31.
 */
public class ArticleDAOImpl extends AbstractBaseDAO implements ArticleDAO {

    @Override
    public void save(Article article) {
        getSessionFactory().getCurrentSession().save(article);
    }

    @Override
    public void update(Article article) {
        getSessionFactory().getCurrentSession().update(article);
    }

    @Override
    public void updateStatus(Article article) {

    }

    @Override
    public void remove(Article article) {
        getSessionFactory().getCurrentSession().remove(article);
    }

    @Override
    public Pager<Article> listByPager(Pager<Article> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Article order by createdTime desc");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int) count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public long count() {
        return (long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Article where status =1").uniqueResult();
    }

    @Override
    public Article getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Article where id=:id");
        query.setParameter("id", s);
        Article article = (Article) query.uniqueResult();
        return article;
    }

    @Override
    public List<Article> ListAll(String s) {
        return null;
    }

    @Override
    public Pager<Article> pager(Pager<Article> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Article where status =1");
        query.setFirstResult(pager.startIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int) count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public List<Search> getSearchList(String searchStr) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select a.title,a.spell,a.id from Article a where a.title like :searchStr or a.spell like :searchSpell and status=1");
        query.setParameter("searchStr","%"+searchStr+"%");
        query.setParameter("searchSpell","%"+searchStr+"%");
        query.setFirstResult(0);
        query.setMaxResults(10);
        List<Object[]> objects = query.list();
        List<Search> searches = new ArrayList<>();
        for(Object[] obj : objects) {
            Search search = new Search();
            search.setName((String)obj[0]);
            search.setSpell((String)obj[1]);
            search.setId((String)obj[2]);
            searches.add(search);
        }
        return searches;
    }
}
