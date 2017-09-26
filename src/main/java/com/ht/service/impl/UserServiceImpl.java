package com.ht.service.impl;

import com.ht.bean.User;
import com.ht.common.bean.Pager;
import com.ht.dao.UserDAO;
import com.ht.service.UserService;
import com.ht.vo.charts.UserChartsData;

import java.util.List;

public class UserServiceImpl implements UserService {

    private UserDAO userDAO ;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public boolean getPhone(String phone) {
        return userDAO.getPhone(phone);
    }

    @Override
    public boolean getEmail(String email) {
        return userDAO.getEmail(email);
    }

    @Override
    public User getByPhonePwd(String phone, String pwd) {
        return userDAO.getByPhonePwd(phone,pwd);
    }

    @Override
    public User getByEmailPwd(String email, String pwd) {
        return userDAO.getByEmailPwd(email,pwd);
    }

    @Override
    public UserChartsData getChartsData() {
        return userDAO.getChartsData();
    }

    @Override
    public void save(User user) {
        userDAO.save(user);
    }

    @Override
    public void update(User user) {
        userDAO.update(user);
    }

    @Override
    public void updateStatus(User user) {
        userDAO.updateStatus(user);
    }

    @Override
    public void remove(User user) {
        userDAO.update(user);
    }

    @Override
    public Pager<User> listByPager(Pager<User> pager) {
        return userDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return userDAO.count();
    }

    @Override
    public User getById(String s) {
        return userDAO.getById(s);
    }

    @Override
    public List<User> ListAll(String s) {
        return null;
    }
}
