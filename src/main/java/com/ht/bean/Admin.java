package com.ht.bean;

/**
 * Created by sweet on 2017/8/23.
 */
public class Admin {

    private String id;//	varchar(36)	编号,UUID，主键
    private String name;//	varchar(36)	角色名称,not null
    private String pwd;//	varchar(50)	密码,md5加密，not null
    private String phone;//	varchar(11)	手机号，not null,unique
    private String email;//	varchar(50)	邮箱,not null

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
