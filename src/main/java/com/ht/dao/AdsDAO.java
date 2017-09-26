package com.ht.dao;

import com.ht.bean.Ads;
import com.ht.common.bean.Pager;

import java.util.List;

/**
 * Created by sweet on 2017/9/4.
 */
public interface AdsDAO extends BaseDAO<String, Ads> {

    Pager<Ads> pager(Pager<Ads> pager);

    List<Ads> getAds();

    long checkedStatus(String showOrder);
}
