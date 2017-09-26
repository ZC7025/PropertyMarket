package com.ht.bean;

import java.util.Date;

/**
 * Created by sweet on 2017/8/23.
 */
public class Message {

    private String id;//	varchar(36)	编号,UUID，主键
    private String content;//	text	留言内容
    private String reply;//	text	回复内容
    private Date leaveTime;//	datetime	留言时间
    private Date replyTime;//	datetime	回复时间
    private int status;//	tinyint	状态，激活或冻结

    private Buildings buildings;
    private User user;
    private Agency agency;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Date getLeaveTime() {
        return leaveTime;
    }

    public void setLeaveTime(Date leaveTime) {
        this.leaveTime = leaveTime;
    }

    public Date getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Buildings getBuildings() {
        return buildings;
    }

    public void setBuildings(Buildings buildings) {
        this.buildings = buildings;
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

    @Override
    public String toString() {
        return "Message{" +
                "id='" + id + '\'' +
                ", content='" + content + '\'' +
                ", reply='" + reply + '\'' +
                ", leaveTime=" + leaveTime +
                ", replyTime=" + replyTime +
                ", status=" + status +
                '}';
    }
}
