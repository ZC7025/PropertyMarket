package com.ht.service.impl;

import com.ht.bean.Agency;
import com.ht.common.bean.Pager;
import com.ht.dao.AgencyDAO;
import com.ht.service.AgencyService;

import java.util.List;

/**
 * Created by 7025 on 2017/8/25.
 */
public class AgencyServiceImpl implements AgencyService {

    private AgencyDAO agencyDAO;

    public void setAgencyDAO(AgencyDAO agencyDAO) {
        this.agencyDAO = agencyDAO;
    }

    @Override
    public boolean getPhone(String phone) {
        return agencyDAO.getPhone(phone);
    }

    @Override
    public boolean getEmail(String email) {
        return agencyDAO.getEmail(email);
    }

    @Override
    public boolean getName(String name) {
        return agencyDAO.getName(name);
    }

    @Override
    public Agency getByPhonePwd(String phone, String pwd) {
        return agencyDAO.getByPhonePwd(phone, pwd);
    }

    @Override
    public Agency getByEmailPwd(String email, String pwd) {
        return agencyDAO.getByEmailPwd(email, pwd);
    }

    @Override
    public Agency getByNamePwd(String name, String pwd) {
        return agencyDAO.getByNamePwd(name, pwd);
    }

    @Override
    public Pager<Agency> unCheckedPager(Pager<Agency> pager) {
        return agencyDAO.unCheckedPager(pager);
    }

    @Override
    public Pager<Agency> checkedPager(Pager<Agency> pager) {
        return agencyDAO.checkedPager(pager);
    }

    @Override
    public long checkCount() {
        return agencyDAO.checkCount();
    }

    @Override
    public long uncheckCount() {
        return agencyDAO.uncheckCount();
    }

    @Override
    public long count() {
        return agencyDAO.count();
    }

    @Override
    public void save(Agency agency) {
        agencyDAO.save(agency);
    }

    @Override
    public void update(Agency agency) {
        agencyDAO.update(agency);
    }

    @Override
    public void updateStatus(Agency agency) {
        agencyDAO.update(agency);
    }

    @Override
    public void remove(Agency agency) {
//        agencyDAO.remove(agency);
    }

    @Override
    public Pager<Agency> listByPager(Pager pager) {
        return agencyDAO.listByPager(pager);
    }

    @Override
    public Agency getById(String s) {
        return agencyDAO.getById(s);
    }

    @Override
    public List<Agency> ListAll(String s) {
        return agencyDAO.ListAll(s);
    }
}
