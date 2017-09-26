package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

import java.util.Date;
import java.util.Set;

/**
 * Created by sweet on 2017/8/23.
 */
public class Building {

    private String id;//	varchar(36)	编号,UUID，主键
    private String name;//varchar(50)	楼栋名称
    private int totalFloor;//	int	总层数,not null
    private int totalLift;//	int	电梯数,not null
    private int floorRooms;//	int	每层多少户,not null
    private int totalRoom;//	int	总户数,not null
    private Date createdTime;//	datetime	创建时间
    private int status;//	tinyint	状态，激活或冻结


    private Buildings buildings;
    private Agency agency;
    private Set<Room> rooms;

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

    public int getTotalFloor() {
        return totalFloor;
    }

    public void setTotalFloor(int totalFloor) {
        this.totalFloor = totalFloor;
    }

    public int getTotalLift() {
        return totalLift;
    }

    public void setTotalLift(int totalLift) {
        this.totalLift = totalLift;
    }

    public int getFloorRooms() {
        return floorRooms;
    }

    public void setFloorRooms(int floorRooms) {
        this.floorRooms = floorRooms;
    }

    public int getTotalRoom() {
        return totalRoom;
    }

    public void setTotalRoom(int totalRoom) {
        this.totalRoom = totalRoom;
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

    public Buildings getBuildings() {
        return buildings;
    }

    public void setBuildings(Buildings buildings) {
        this.buildings = buildings;
    }

    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    @JSON(serialize = false)
    public Set<Room> getRooms() {
        return rooms;
    }

    public void setRooms(Set<Room> rooms) {
        this.rooms = rooms;
    }

    @Override
    public String toString() {
        return "Building{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", totalFloor=" + totalFloor +
                ", totalLift=" + totalLift +
                ", floorRooms=" + floorRooms +
                ", totalRoom=" + totalRoom +
                ", createdTime=" + createdTime +
                ", status=" + status +
                '}';
    }
}
