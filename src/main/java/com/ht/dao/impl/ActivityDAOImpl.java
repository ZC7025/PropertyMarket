package com.ht.dao.impl;

import com.ht.bean.Activity;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.ActivityDAO;
import com.ht.vo.Search;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by sweet on 2017/8/31.
 */
public class ActivityDAOImpl extends AbstractBaseDAO implements ActivityDAO {
    @Override
    public void save(Activity activity) {
        getSessionFactory().getCurrentSession().save(activity);
    }

    @Override
    public void update(Activity activity) {
        getSessionFactory().getCurrentSession().update(activity);
    }

    @Override
    public void updateStatus(Activity activity) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("update Activity set status=:status where id=:id");
        query.setParameter("status", activity.getStatus());
        query.setParameter("id", activity.getId());
        query.executeUpdate();
    }

    @Override
    public void remove(Activity activity) {
        getSessionFactory().getCurrentSession().delete(activity);
    }

    @Override
    public Pager<Activity> listByPager(Pager<Activity> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Activity order by startTime desc");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int)count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public long count() {
        return (long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Activity where status=1").uniqueResult();
    }

    @Override
    public Activity getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Activity where id=:id");
        query.setParameter("id", s);
        Activity activity = (Activity) query.uniqueResult();
        return activity;
    }

    @Override
    public List<Activity> ListAll(String s) {
        return null;
    }

    @Override
    public Pager<Activity> activityPager(Pager<Activity> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Activity");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int)count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public Pager<Activity> pager(Pager<Activity> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Activity where status =1");
        query.setFirstResult(pager.startIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int) count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public List<Activity> randomAct(int size) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Activity where status=1 order by rand()");
        query.setFirstResult(0);
        query.setMaxResults(size);
        return query.list();
    }

    @Override
    public long countAct(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Activity where agency.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<Activity> activityPager(Pager<Activity> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Activity where agency.id=:id order by startTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<Activity> pager1 = new Pager<Activity>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public List<Search> getSearchList(String searchStr) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select a.title,a.spell,a.id from Activity a where a.title like :searchStr or a.spell like :searchSpell and status=1");
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
