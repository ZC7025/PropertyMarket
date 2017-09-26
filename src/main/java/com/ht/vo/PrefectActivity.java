package com.ht.vo;

import java.util.Date;

/**
 * Created by sweet on 2017/9/5.
 */
public class PrefectActivity {

    private String id;//	varchar(36)	编号,UUID，主键
    private String title;//	varchar(50)	活动标题,not null
    private Date startTime;//	datetime	开始时间
    private Date endTime;	//datetime	结束时间
    private String address;//	varchar(100)	活动地址
    private String content;//	text	活动内容
    private String logo;//	varchar(500)	活动图片
    private String agencyName;
    private String buildingsName;
    private int status;

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

    public String getAgencyName() {
        return agencyName;
    }

    public void setAgencyName(String agencyName) {
        this.agencyName = agencyName;
    }

    public String getBuildingsName() {
        return buildingsName;
    }

    public void setBuildingsName(String buildingsName) {
        this.buildingsName = buildingsName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
