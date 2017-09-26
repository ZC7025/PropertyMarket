package com.ht.dao.impl;

import com.ht.bean.Agency;
import com.ht.common.CommonMethod;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.AgencyDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by 7025 on 2017/8/25.
 */
public class AgencyDAOImpl extends AbstractBaseDAO implements AgencyDAO {
    /**
     * 查找手机号是否唯一
     * @param phone
     * @return
     */
    @Override
    public boolean getPhone(String phone) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Agency where phone=:phone");
        query.setParameter("phone",phone);
        Agency agency = (Agency) query.uniqueResult();
        if(agency != null) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 查找邮箱是否唯一
     * @param email
     * @return
     */
    @Override
    public boolean getEmail(String email) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Agency where email=:email");
        query.setParameter("email",email);
        Agency agency = (Agency) query.uniqueResult();
        if(agency != null) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 查找经销商名称是否唯一
     * @param name
     * @return
     */
    @Override
    public boolean getName(String name) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Agency where name=:name");
        query.setParameter("name",name);
        Agency agency = (Agency) query.uniqueResult();
        if(agency != null) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Agency getByPhonePwd(String phone, String pwd) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Agency where phone=:phone and pwd=:pwd");
        query.setParameter("phone",phone);
        query.setParameter("pwd",pwd);
        return (Agency) query.uniqueResult();
    }

    @Override
    public Agency getByEmailPwd(String email, String pwd) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Agency where email=:email and pwd=:pwd");
        query.setParameter("email",email);
        query.setParameter("pwd",pwd);
        return (Agency) query.uniqueResult();
    }

    @Override
    public Agency getByNamePwd(String name, String pwd) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Agency where name=:name and pwd=:pwd");
        query.setParameter("name",name);
        query.setParameter("pwd",pwd);
        return (Agency) query.uniqueResult();
    }




    @Override
    public void save(Agency agency) {
        getSessionFactory().getCurrentSession().save(agency);
    }

    @Override
    public void update(Agency agency) {
        getSessionFactory().getCurrentSession().update(agency);
    }

    @Override
    public void updateStatus(Agency agency) {
        getSessionFactory().getCurrentSession().update(agency);
    }

    @Override
    public void remove(Agency agency) {

    }

    @Override
    public Pager<Agency> listByPager(Pager<Agency> pager) {
        Session session = getSessionFactory().getCurrentSession();
        return new CommonMethod<Agency>().getPager("Agency", session, pager);
    }

    @Override
    public long count() {
        return (long)getSessionFactory().getCurrentSession().createQuery("select count(id) from Agency").uniqueResult();
    }

    @Override
    public Agency getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Agency where id=:id");
        query.setParameter("id",s);
        return (Agency) query.uniqueResult();
    }

    @Override
    public List<Agency> ListAll(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Agency where id=:id");
        query.setParameter("id",s);
        return query.list();
    }


    @Override
    public Pager<Agency> unCheckedPager(Pager<Agency> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Agency where checked_status=0 order by createdTime desc ");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int)count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public Pager<Agency> checkedPager(Pager<Agency> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Agency where checked_status=1 order by createdTime desc ");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int)count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public long checkCount() {
        return (long)getSessionFactory().getCurrentSession().createQuery("select count(id) from Agency where checked_status=1").uniqueResult();
    }

    @Override
    public long uncheckCount() {
        return (long)getSessionFactory().getCurrentSession().createQuery("select count(id) from Agency where checked_status=0").uniqueResult();
    }

}
