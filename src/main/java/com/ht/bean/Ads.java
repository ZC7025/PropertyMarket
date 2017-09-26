package com.ht.bean;

import java.util.Date;

/**
 * Created by sweet on 2017/8/23.
 */
public class Ads {

    private String id;//	varchar(36)	编号,UUID，主键
    private String title;//	varchar(50)	广告标题,not null
    private String content;//	varchar(50)	广告描述,not null
    private String logo;//	varchar(500)	广告图片路径
    private String adUrl;//	varchar(500)	广告URL路径，可链接到单独的广告页面
    private int showStatus;//	varchar(2)	是否显示，Y或N
    private int showOrder;//	int	显示顺序，按照主页，详情页的从左到右，从上到下的顺序规定广告位置
    private Date createdTime;//	datetime	创建时间
    private int status;//	tinyint	状态，激活或冻结

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

    public String getAdUrl() {
        return adUrl;
    }

    public void setAdUrl(String adUrl) {
        this.adUrl = adUrl;
    }

    public int getShowStatus() {
        return showStatus;
    }

    public void setShowStatus(int showStatus) {
        this.showStatus = showStatus;
    }

    public int getShowOrder() {
        return showOrder;
    }

    public void setShowOrder(int showOrder) {
        this.showOrder = showOrder;
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

    @Override
    public String toString() {
        return "Ads{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", logo='" + logo + '\'' +
                ", adUrl='" + adUrl + '\'' +
                ", showStatus='" + showStatus + '\'' +
                ", showOrder=" + showOrder +
                ", createdTime=" + createdTime +
                ", status=" + status +
                '}';
    }
}
