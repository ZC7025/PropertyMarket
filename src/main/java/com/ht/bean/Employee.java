package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

import java.util.Date;
import java.util.Set;

/**
 * Created by sweet on 2017/8/23.
 */
public class Employee {

    private String id;//	varchar(36)	员工编号,UUID，主键
    private String name;//	varchar(50)	员工名称
    private String email;//	varchar(50)	邮箱，unique
    private String pwd;//	varchar(50)	密码,自动生成，使用默认密码not null
    private String phone;//	varchar(11)	手机号,用于登录账号，unique，not null
    private String qq;//	varchar(20)	qq号
    private String wechat;//	varchar(50)	微信号
    private String gender;//	varchar(2)	性别
    private String exp;//	varchar(50)	工作经验描述
    private String des;//	varchar(100)	最多50个字的个人说明
    private String address;//	varchar(100)	地址
    private Double basicSalary;//	double	基本工资，not null
    private String headicon; //	varchar(500)	头像，default
    private String intro;//	varchar(500)	简介
    private Date createdTime;//	datetime	创建时间
    private int status;//	tinyint	状态，激活或冻结

    private Agency agency;
    private Buildings buildings;
    private Set<Customer> customers;
    private Set<Sale> sales;
    private Set<Mission> missions;
    private Set<Appointment> appointments;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getExp() {
        return exp;
    }

    public void setExp(String exp) {
        this.exp = exp;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(Double basicSalary) {
        this.basicSalary = basicSalary;
    }

    public String getHeadicon() {
        return headicon;
    }

    public void setHeadicon(String headicon) {
        this.headicon = headicon;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @JSON(serialize=false)
    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }


    public Buildings getBuildings() {
        return buildings;
    }

    public void setBuildings(Buildings buildings) {
        this.buildings = buildings;
    }

    public Set<Customer> getCustomers() {
        return customers;
    }

    public void setCustomers(Set<Customer> customers) {
        this.customers = customers;
    }

    public Set<Sale> getSales() {
        return sales;
    }

    public void setSales(Set<Sale> sales) {
        this.sales = sales;
    }

    public Set<Mission> getMissions() {
        return missions;
    }

    public void setMissions(Set<Mission> missions) {
        this.missions = missions;
    }

    @JSON(serialize=false)
    public Set<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(Set<Appointment> appointments) {
        this.appointments = appointments;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", pwd='" + pwd + '\'' +
                ", phone='" + phone + '\'' +
                ", qq='" + qq + '\'' +
                ", wechat='" + wechat + '\'' +
                ", gender='" + gender + '\'' +
                ", exp='" + exp + '\'' +
                ", des='" + des + '\'' +
                ", address='" + address + '\'' +
                ", basicSalary=" + basicSalary +
                ", headicon='" + headicon + '\'' +
                ", intro='" + intro + '\'' +
                ", createdTime=" + createdTime +
                ", status=" + status +
                '}';
    }
}
