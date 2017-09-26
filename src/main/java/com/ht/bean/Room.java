package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

/**
 * Created by sweet on 2017/8/23.
 */
public class Room {

    private String id;//	varchar(36)	编号,UUID，主键
    private String name;//	varchar(50)	房号名称
    private Integer saleStatus;//	tinyint	销售状态，not null，默认为待售中
    
    private Integer floor;
    private Integer room;

    private Sale sale;
    private House house;
    private Building building;

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

    public Integer getSaleStatus() {
        return saleStatus;
    }

    public void setSaleStatus(Integer saleStatus) {
        this.saleStatus = saleStatus;
    }

    public void setSale(Sale sale) {
        this.sale = sale;
    }

    @JSON(serialize = false)
    public Sale getSale() {
        return sale;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }

    public Building getBuilding() {
        return building;
    }

    public void setBuilding(Building building) {
        this.building = building;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Integer getRoom() {
        return room;
    }

    public void setRoom(Integer room) {
        this.room = room;
    }

    @Override
    public String toString() {
        return "Room{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", saleStatus=" + saleStatus +
                ", floor=" + floor +
                ", room=" + room +
                ", sale=" + sale +
                ", house=" + house +
                ", building=" + building +
                '}';
    }
}
