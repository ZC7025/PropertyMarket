package com.ht.dao;

import com.ht.bean.Admin;

/**
 * Created by sweet on 2017/8/24.
 */
public interface AdminDAO extends BaseDAO<String, Admin> {

    Admin getByPhonePwd(String phone, String pwd);

    Admin getByEmailPwd(String email, String pwd);

}
