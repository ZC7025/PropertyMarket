package com.ht.service.impl;

import com.ht.bean.Ads;
import com.ht.common.bean.Pager;
import com.ht.dao.AdsDAO;
import com.ht.service.AdsService;

import java.util.List;

/**
 * Created by sweet on 2017/9/4.
 */
public class AdsServiceImpl implements AdsService {

    private AdsDAO adsDAO;

    public void setAdsDAO(AdsDAO adsDAO) {
        this.adsDAO = adsDAO;
    }

    @Override
    public void save(Ads ads) {
        adsDAO.save(ads);
    }

    @Override
    public void update(Ads ads) {
        adsDAO.update(ads);
    }

    @Override
    public void updateStatus(Ads ads) {
        adsDAO.update(ads);
    }

    @Override
    public void remove(Ads ads) {
        adsDAO.remove(ads);
    }

    @Override
    public Pager<Ads> listByPager(Pager<Ads> pager) {
        return adsDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return adsDAO.count();
    }

    @Override
    public Ads getById(String s) {
        return adsDAO.getById(s);
    }

    @Override
    public List<Ads> ListAll(String s) {
        return null;
    }

    @Override
    public Pager<Ads> pager(Pager<Ads> pager) {
        return adsDAO.pager(pager);
    }

    @Override
    public List<Ads> getAds() {
        return adsDAO.getAds();
    }

    @Override
    public long checkedStatus(String showOrder) {
        return adsDAO.checkedStatus(showOrder);
    }
}
