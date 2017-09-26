package com.ht.bean;

import java.util.Date;

/**
 * Created by sweet on 2017/8/23.
 */
public class Appointment {

    private String id;//	varchar(36)	编号,UUID，主键
    private Date appArriveTime;//	datetime	预约看房时间
    private Date arriveTime;//	datetime	真实看房时间
    private String appStatus;//	varchar(20)	预约状态
    private Date createdTime; //	datetime	创建时间
    private int status;//	tinyint	状态，激活或冻结
    private String appPhone;//预约客户的电话

    private Employee employee;
    private User user;
    private Agency agency;
    private House house;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getAppArriveTime() {
        return appArriveTime;
    }

    public void setAppArriveTime(Date appArriveTime) {
        this.appArriveTime = appArriveTime;
    }

    public Date getArriveTime() {
        return arriveTime;
    }

    public void setArriveTime(Date arriveTime) {
        this.arriveTime = arriveTime;
    }

    public String getAppStatus() {
        return appStatus;
    }

    public void setAppStatus(String appStatus) {
        this.appStatus = appStatus;
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

    public String getAppPhone() {
        return appPhone;
    }

    public void setAppPhone(String appPhone) {
        this.appPhone = appPhone;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }


    @Override
    public String toString() {
        return "Appointment{" +
                "id='" + id + '\'' +
                ", appArriveTime=" + appArriveTime +
                ", arriveTime=" + arriveTime +
                ", appStatus='" + appStatus + '\'' +
                ", createdTime=" + createdTime +
                ", status=" + status +
                ", appPhone='" + appPhone + '\'' +
                '}';
    }
}
