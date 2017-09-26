package com.ht.service;

import com.ht.bean.Ads;
import com.ht.common.bean.Pager;

import java.util.List;

/**
 * Created by sweet on 2017/9/4.
 */
public interface AdsService extends BaseService<String, Ads> {

    Pager<Ads> pager(Pager<Ads> pager);

    List<Ads> getAds();

    long checkedStatus(String showOrder);
}
