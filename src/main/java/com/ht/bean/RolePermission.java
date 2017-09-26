package com.ht.bean;

/**
 * Created by sweet on 2017/8/23.
 */
public class RolePermission {

    private String id;//	varchar(36)	编号,UUID，主键
    private String createdTime	;//datetime	创建时间

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }

    @Override
    public String toString() {
        return "RolePermission{" +
                "id='" + id + '\'' +
                ", createdTime='" + createdTime + '\'' +
                '}';
    }
}
