package com.ht.bean;

import java.util.Date;
import java.util.Set;

/**
 * Created by sweet on 2017/8/23.
 */
public class Customer {

    private String id;//	varchar(36)	编号,UUID，主键
    private String name;//	varchar(36)	姓名
    private String gender;//	varchar(2)	性别
    private Date birthday; //	date	生日
    private String identityId;//	varchar(18)	身份证号
    private String email;//	varchar(50)	邮箱,not null
    private String phone;//	varchar(11)	手机号，not null,unique
    private String address;//	varchar(100)	联系地址,not null
    private String customerType;//	varchar(20)	客户类型，如预约客户，预定客户，购房客户
    private String together;//	varchar(100)	共同购房人姓名，多个姓名用英文逗号隔开
    private String contract;//varchar(500)	电子版购房合同路径
    private String archives;//varchar(500)	zip版电子档案路径
    private Date createdTime;//	datetime	创建时间
    private Integer status;//	tinyint	状态，激活或冻结

    private Employee employee;
    private Agency agency;
    private Set<Sale> sales;

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

    public String getIdentityId() {
        return identityId;
    }

    public void setIdentityId(String identityId) {
        this.identityId = identityId;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    public String getTogether() {
        return together;
    }

    public void setTogether(String together) {
        this.together = together;
    }

    public String getContract() {
        return contract;
    }

    public void setContract(String contract) {
        this.contract = contract;
    }

    public String getArchives() {
        return archives;
    }

    public void setArchives(String archives) {
        this.archives = archives;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    public Set<Sale> getSales() {
        return sales;
    }

    public void setSales(Set<Sale> sales) {
        this.sales = sales;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday=" + birthday +
                ", identityId='" + identityId + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", customerType='" + customerType + '\'' +
                ", together='" + together + '\'' +
                ", contract='" + contract + '\'' +
                ", archives='" + archives + '\'' +
                ", createdTime=" + createdTime +
                ", status=" + status +
                '}';
    }
}
