package ht.dao.impl;

import com.ht.bean.Buildings;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.BuildingsDAO;
import com.ht.vo.Search;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 7025 on 2017/8/28.
 */
public class BuildingsDAOImpl extends AbstractBaseDAO implements BuildingsDAO {
    @Override
    public void save(Buildings buildings) {
        getSessionFactory().getCurrentSession().save(buildings);
    }

    @Override
    public void update(Buildings buildings) {
        getSessionFactory().getCurrentSession().update(buildings);
    }

    @Override
    public void updateStatus(Buildings buildings) {
        getSessionFactory().getCurrentSession().update(buildings);
    }

    @Override
    public void remove(Buildings buildings) {
        getSessionFactory().getCurrentSession().remove(buildings);
    }

    @Override
    public Pager<Buildings> listByPager(Pager<Buildings> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Buildings");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int) count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public long count() {
       return (long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Buildings where status=1").uniqueResult();
    }

    @Override
    public Buildings getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Buildings where id=:id");
        query.setParameter("id",s);
        return (Buildings) query.uniqueResult();
    }

    @Override
    public List<Buildings> ListAll(String s) {
        return null;
    }

    @Override
    public List<Buildings> listByAgeencyId(String agency_id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Buildings where agency.id =:agency_id");
        query.setParameter("agency_id",agency_id);
        List<Buildings>  buildings = query.list();
        return buildings;
    }

    @Override
    public long count(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Buildings where agency.id=:id");
        query.setParameter("id", id);
        return (long)query.uniqueResult();
    }

    @Override
    public Pager<Buildings> listBuildings(Pager<Buildings> pager, String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Buildings where agency.id=:id order by createdTime desc");
        query.setParameter("id", id);
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<Buildings> pager1 = new Pager<Buildings>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }

    @Override
    public Pager<Buildings> pager(Pager<Buildings> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Buildings where status=1");
        query.setFirstResult(pager.startIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int) count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public List<Buildings> randomBuilds(int size) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Buildings where status=1 order by rand()");
        query.setFirstResult(0);
        query.setMaxResults(size);
        return query.list();
    }

    @Override
    public List<Search> getSearchList(String searchStr) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select b.name,b.spell,b.id from Buildings b where b.name like :searchStr or b.spell like :searchSpell and status=1");
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
