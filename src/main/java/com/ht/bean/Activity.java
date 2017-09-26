package com.ht.bean;

import java.util.Date;

/**
 * Created by sweet on 2017/8/23.
 */
public class Activity {

    private String id;//	varchar(36)	编号,UUID，主键
    private String title;//	varchar(50)	活动标题,not null
    private Date startTime;//	datetime	开始时间
    private Date endTime;	//datetime	结束时间
    private String address;//	varchar(100)	活动地址
    private String content;//	text	活动内容
    private String logo;//	varchar(500)	活动图片
    private String spell;//	varchar(100)	处理搜索的拼音
    private int status;

    private Agency agency;
    private Buildings buildings;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getSpell() {
        return spell;
    }

    public void setSpell(String spell) {
        this.spell = spell;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

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

    @Override
    public String toString() {
        return "Activity{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", address='" + address + '\'' +
                ", content='" + content + '\'' +
                ", logo='" + logo + '\'' +
                ", spell='" + spell + '\'' +
                '}';
    }
}
