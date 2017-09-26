package com.ht.service;

import com.ht.bean.Admin;

/**
 * Created by sweet on 2017/8/24.
 */
public interface AdminService extends BaseService<String, Admin> {

    Admin getByPhonePwd(String phone, String pwd);

    Admin getByEmailPwd(String email, String pwd);

}
