package com.ht.dao.impl;

import com.ht.bean.User;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.UserDAO;
import com.ht.vo.charts.HighchartsLine;
import com.ht.vo.charts.UserChartsData;
import com.ht.vo.charts.XAxis;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl extends AbstractBaseDAO implements UserDAO {
    @Override
    public void save(User user) {
        getSessionFactory().getCurrentSession().save(user);
    }

    @Override
    public void update(User user) {
        getSessionFactory().getCurrentSession().update(user);
    }

    @Override
    public void updateStatus(User user) {

    }

    @Override
    public void remove(User user) {
        getSessionFactory().getCurrentSession().delete(user);
    }

    @Override
    public Pager<User> listByPager(Pager<User> pager) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from User");
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setTotal((int)count());
        pager.setResults(query.list());
        return pager;
    }

    @Override
    public long count() {
        Session session = getSessionFactory().getCurrentSession();
        long count = (long)session.createQuery("select count(id) from User").uniqueResult();
        return count;
    }

    @Override
    public User getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        User user = session.get(User.class,s);
        return user;
    }

    @Override
    public List<User> ListAll(String s) {
        return null;
    }

    /**
     * 查询手机号是否被注册
     * @param phone
     * @return
     */
    @Override
    public boolean getPhone(String phone) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from User where phone=:phone ");
        query.setParameter("phone",phone);
        User user = (User) query.uniqueResult();
        if (user!=null){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 查询邮箱是否被注册
     * @param email
     * @return
     */
    @Override
    public boolean getEmail(String email) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from User where email=:email ");
        query.setParameter("email",email);
        User user = (User) query.uniqueResult();
        if (user!=null){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public User getByPhonePwd(String phone, String pwd) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from User where phone = :phone and pwd =:pwd");
        query.setParameter("phone",phone);
        query.setParameter("pwd",pwd);
        User user = (User) query.uniqueResult();
        return user;
    }

    @Override
    public User getByEmailPwd(String email, String pwd) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from User where email = :email and pwd =:pwd");
        query.setParameter("email",email);
        query.setParameter("pwd",pwd);
        User user = (User) query.uniqueResult();
        return user;
    }

    @Override
    public UserChartsData getChartsData() {
        Session session = getSessionFactory().getCurrentSession();
        UserChartsData userChartsData = new UserChartsData();
        int[] tempData = new int[7];
        String[] tempStr = new String[7];
        List<HighchartsLine<Integer>> highchartsLines = new ArrayList<>();
            HighchartsLine<Integer> highchartsLine = new HighchartsLine<>();
            List<Integer> data = new ArrayList<>();
            for(int i = 0; i < 7; i++) {
                Query query = session.createQuery("select count(id) from User where week(createdTime) = week(curdate())-"+i);
                Long temp =(long) query.uniqueResult();
                data.add(temp.intValue());
                tempStr[i] = (i+1) + "周前";
            if(i == 6) {
                session.flush();
                session.clear();
            }
        }
        highchartsLine.setName("用户");
        highchartsLine.setData(data);
        highchartsLines.add(highchartsLine);
        userChartsData.setSeries(highchartsLines);
        XAxis xAxis = new XAxis();
        xAxis.setCategories(tempStr);
        userChartsData.setxAxis(xAxis);
        return userChartsData;
    }
}
