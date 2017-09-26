package com.ht.dao.impl;

import com.ht.bean.Admin;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.AdminDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by sweet on 2017/8/24.
 */
public class AdminDAOImpl extends AbstractBaseDAO implements AdminDAO {

    @Override
    public void save(Admin admin) {

    }

    @Override
    public void update(Admin admin) {
        getSessionFactory().getCurrentSession().update(admin);
    }

    @Override
    public void updateStatus(Admin admin) {

    }

    @Override
    public void remove(Admin admin) {

    }

    @Override
    public Pager<Admin> listByPager(Pager<Admin> pager) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public Admin getById(String s) {
        return null;
    }

    @Override
    public List<Admin> ListAll(String s) {
        return null;
    }

    @Override
    public Admin getByPhonePwd(String phone, String pwd) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Admin where phone =:phone and pwd =:pwd");
        query.setParameter("phone", phone);
        query.setParameter("pwd", pwd);
        Admin admin = (Admin)query.uniqueResult();
        return admin;
    }

    @Override
    public Admin getByEmailPwd(String email, String pwd) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Admin where email =:eamil and pwd =:pwd");
        query.setParameter("email", email);
        query.setParameter("pwd", pwd);
        Admin admin = (Admin)query.uniqueResult();
        return admin;
    }
}
