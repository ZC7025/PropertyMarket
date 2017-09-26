package com.ht.service.impl;

import com.ht.bean.Admin;
import com.ht.common.bean.Pager;
import com.ht.dao.AdminDAO;
import com.ht.service.AdminService;

import java.util.List;

/**
 * Created by sweet on 2017/8/24.
 */
public class AdminServiceImpl implements AdminService {

    private AdminDAO adminDAO;

    public void setAdminDAO(AdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    @Override
    public void save(Admin admin) {

    }

    @Override
    public void update(Admin admin) {
        adminDAO.update(admin);
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
        return adminDAO.getByPhonePwd(phone, pwd);
    }

    @Override
    public Admin getByEmailPwd(String email, String pwd) {
        return adminDAO.getByEmailPwd(email, pwd);
    }

}
