package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

import java.util.Date;
import java.util.Set;

/**
 * Created by sweet on 2017/8/23.
 */
public class User {

    private String id;//	varchar(36)	编号,UUID，主键
    private String email;//	varchar(50)	用户邮箱,not null
    private String phone;//	datetime	手机号,unique,not null
    private String pwd;//	datetime	密码,md5加密，not null
    private String qq;//	varchar(20)	qq号
    private String wechat;//	varchar(50)	微信号
    private String gender;//	varchar(2)	性别
    private Date birthday;//	datetime	生日
    private String nickname;//varchar(50)	昵称
    private String name;//	varchar(20)	真实姓名
    private String headicon;//	varchar(500)	用户头像，default
    private int status;
    private Date createdTime;

    private Set<Message> messages;
    private Set<Comment> comments;

    private Set<Appointment> appointments;
    private Set<History> histories;
    private Set<Like> likes;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHeadicon() {
        return headicon;
    }

    public void setHeadicon(String headicon) {
        this.headicon = headicon;
    }

    public int getStatus()  {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @JSON(serialize = false)
    public Set<Message> getMessages() {
        return messages;
    }

    public void setMessages(Set<Message> messages) {
        this.messages = messages;
    }

    @JSON(serialize = false)
    public Set<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(Set<Appointment> appointments) {
        this.appointments = appointments;
    }

    @JSON(serialize = false)
    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    @JSON(serialize = false)
    public Set<History> getHistories() {
        return histories;
    }

    public void setHistories(Set<History> histories) {
        this.histories = histories;
    }

    @JSON(serialize = false)
    public Set<Like> getLikes() {
        return likes;
    }

    public void setLikes(Set<Like> likes) {
        this.likes = likes;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", pwd='" + pwd + '\'' +
                ", qq='" + qq + '\'' +
                ", wechat='" + wechat + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday=" + birthday +
                ", nickname='" + nickname + '\'' +
                ", name='" + name + '\'' +
                ", headicon='" + headicon + '\'' +
                ", status=" + status +
                ", createdTime=" + createdTime +
                '}';
    }
}
