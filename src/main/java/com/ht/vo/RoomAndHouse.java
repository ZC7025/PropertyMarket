package com.ht.vo;

/**
 * Created by 7025 on 2017/9/7.
 */
public class RoomAndHouse {
    private String id;
    private String name;
    private String houseName;
    private int saleStatus;
    private double area;
    private double unitPrice;

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

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public int getSaleStatus() {
        return saleStatus;
    }

    public void setSaleStatus(int saleStatus) {
        this.saleStatus = saleStatus;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Override
    public String toString() {
        return "RoomAndHouse{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", houseName='" + houseName + '\'' +
                ", saleStatus=" + saleStatus +
                ", area=" + area +
                ", unitPrice=" + unitPrice +
                '}';
    }
}
