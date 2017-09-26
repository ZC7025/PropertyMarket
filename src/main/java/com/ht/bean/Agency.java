package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

import java.util.Date;
import java.util.Set;

/**
 * Created by sweet on 2017/8/23.
 */
public class Agency {

    private String id; //编号,UUID，主键
    private String name; //经销商名称，unique
    private String email; //邮箱，作为登录账号，unique, not null
    private String pwd; //密码,md5加密，not null
    private String leader; //负责人姓名
    private String phone;	//varchar(11)	手机号,unique，not null
    private String tel; //varchar(11)	固定电话
    private String address; //varchar(100)	地址
    private String logo;  //varchar(500)	商标图片，default
    private String intro; //varchar(500)	简介
    private Date createdTime;//datetime	创建时间
    private int checkedStatus;	//varchar(2)	审核状态，默认为0
    private int status; //tinyint	状态，激活或冻结（0冻结，1激活）
    private String spell;//varchar(100)	处理搜索的拼音

    private Set<Employee> employees;
    private Set<Customer> customers;

    private Set<Buildings> buildings;
    private Set<Building> buildingSet;
    private Set<House> houses;
    private Set<Message> messages;
    private Set<Comment> comments;

    private Set<Sale> sales;

    private Set<Activity> activities;

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

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
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

    public int getCheckedStatus() {
        return checkedStatus;
    }

    public void setCheckedStatus(int checkedStatus) {
        this.checkedStatus = checkedStatus;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getSpell() {
        return spell;
    }

    public void setSpell(String spell) {
        this.spell = spell;
    }

    @JSON(serialize = false)
    public Set<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }

    @JSON(serialize = false)
    public Set<Customer> getCustomers() {
        return customers;
    }

    public void setCustomers(Set<Customer> customers) {
        this.customers = customers;
    }

    @JSON(serialize = false)
    public Set<Buildings> getBuildings() {
        return buildings;
    }

    public void setBuildings(Set<Buildings> buildings) {
        this.buildings = buildings;
    }

    @JSON(serialize = false)
    public Set<Building> getBuildingSet() {
        return buildingSet;
    }

    public void setBuildingSet(Set<Building> buildingSet) {
        this.buildingSet = buildingSet;
    }

    @JSON(serialize = false)
    public Set<House> getHouses() {
        return houses;
    }

    public void setHouses(Set<House> houses) {
        this.houses = houses;
    }

    @JSON(serialize = false)
    public Set<Activity> getActivities() {
        return activities;
    }

    public void setActivities(Set<Activity> activities) {
        this.activities = activities;
    }

    @JSON(serialize = false)
    public Set<Sale> getSales() {
        return sales;
    }

    public void setSales(Set<Sale> sales) {
        this.sales = sales;
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

    @Override
    public String toString() {
        return "Agency{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", pwd='" + pwd + '\'' +
                ", leader='" + leader + '\'' +
                ", phone='" + phone + '\'' +
                ", tel='" + tel + '\'' +
                ", address='" + address + '\'' +
                ", logo='" + logo + '\'' +
                ", intro='" + intro + '\'' +
                ", createdTime=" + createdTime +
                ", checkedStatus=" + checkedStatus +
                ", status=" + status +
                ", spell='" + spell + '\'' +
                '}';
    }
}
