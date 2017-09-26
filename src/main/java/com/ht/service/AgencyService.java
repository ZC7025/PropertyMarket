package com.ht.service;

import com.ht.bean.Agency;
import com.ht.common.bean.Pager;

/**
 * Created by 7025 on 2017/8/25.
 */
public interface AgencyService extends BaseService<String, Agency> {

    boolean getPhone(String phone);

    boolean getEmail(String email);

    boolean getName(String name);

    Agency getByPhonePwd(String phone, String pwd);

    Agency getByEmailPwd(String email, String pwd);

    Agency getByNamePwd(String name, String pwd);

    Pager<Agency> unCheckedPager(Pager<Agency> pager);

    Pager<Agency> checkedPager(Pager<Agency> pager);

    long checkCount();

    long uncheckCount();

}
