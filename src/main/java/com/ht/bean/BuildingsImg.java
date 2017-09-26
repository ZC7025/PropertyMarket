package com.ht.bean;

import java.util.Date;

/**
 * Created by sweet on 2017/8/23.
 */
public class BuildingsImg {

    private String id; //varchar(36)	编号,UUID，主键
    private String imgPath; //	varchar(500)	图片路径，not null
    private String imgDes; //varchar(50)	图片简单描述
    private Date createdTime; //datetime	创建时间

    private Buildings buildings;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getImgDes() {
        return imgDes;
    }

    public void setImgDes(String imgDes) {
        this.imgDes = imgDes;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Buildings getBuildings() {
        return buildings;
    }

    public void setBuildings(Buildings buildings) {
        this.buildings = buildings;
    }

    @Override
    public String toString() {
        return "BuildingsImg{" +
                "id='" + id + '\'' +
                ", imgPath='" + imgPath + '\'' +
                ", imgDes='" + imgDes + '\'' +
                ", createdTime=" + createdTime +
                '}';
    }
}
