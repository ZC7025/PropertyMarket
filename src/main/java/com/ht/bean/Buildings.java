package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

import java.util.Date;
import java.util.Set;

/**
 * Created by sweet on 2017/8/23.
 */
public class Buildings {

    private String id; //	varchar(36)	编号,UUID，主键
    private String name; //	varchar(50)	楼盘名称
    private String area; //	varchar(50)	所属区域
    private String address; //	varchar(100)	地址
    private Double floorArea; //	double	占地面积
    private Double buildingArea;//	double	建筑面积
    private String houseType;//	varchar(20）	房源类型，如商业，住宅
    private String buildingType;	//varchar(20)	建筑类型，如塔楼，板楼
    private Double longitude;	//double	经度，not null
    private Double latitude;//	double	纬度,not null
    private Double avgPrice;//	double	楼盘均价，not null
    private String company;//	varchar(100)	开发公司
    private Date openDate;//	datetime	开盘时间
    private Integer totalRooms;//	int	总套数
    private String receptionAddress; //varchar(100)	接待地址, not null
    private String tel;//	varchar(11)	楼盘售楼电话,not null
    private Double greenRatio;//	double	绿化率
    private Double plotRatio;//	double	容积率
    private String propertyCompany;//	varchar(100)	物业公司
    private Double propertyFee;//	double	物业费
    private Integer carStation;//	int	车位数
    private String traffic;//	text	交通状况
    private String equipments;//	text	周边配套
    private String logo;//	varchar(500)	楼盘封面，default
    private String intro;//	varchar(500)	简介
    private Date createdTime;//	datetime	创建时间
    private Integer status;	//tinyint	状态，激活或冻结
    private String spell;//	varchar(100)	处理搜索的拼音

    private Set<Employee> employees;

    private Agency agency;
    // 楼栋
    private Set<Building> building;
    // 户型
    private Set<House> houses;
    // 楼盘图片
    private Set<BuildingsImg> buildingsImgs;

    private Set<Message> messages;
    private Set<Comment> comments;
    private Set<History> histories;
    private Set<Like> likes;

    private Set<Activity> activities;

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

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getFloorArea() {
        return floorArea;
    }

    public void setFloorArea(Double floorArea) {
        this.floorArea = floorArea;
    }

    public Double getBuildingArea() {
        return buildingArea;
    }

    public void setBuildingArea(Double buildingArea) {
        this.buildingArea = buildingArea;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public String getBuildingType() {
        return buildingType;
    }

    public void setBuildingType(String buildingType) {
        this.buildingType = buildingType;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getAvgPrice() {
        return avgPrice;
    }

    public void setAvgPrice(Double avgPrice) {
        this.avgPrice = avgPrice;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Date getOpenDate() {
        return openDate;
    }

    public void setOpenDate(Date openDate) {
        this.openDate = openDate;
    }

    public Integer getTotalRooms() {
        return totalRooms;
    }

    public void setTotalRooms(Integer totalRooms) {
        this.totalRooms = totalRooms;
    }

    public String getReceptionAddress() {
        return receptionAddress;
    }

    public void setReceptionAddress(String receptionAddress) {
        this.receptionAddress = receptionAddress;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Double getGreenRatio() {
        return greenRatio;
    }

    public void setGreenRatio(Double greenRatio) {
        this.greenRatio = greenRatio;
    }

    public Double getPlotRatio() {
        return plotRatio;
    }

    public void setPlotRatio(Double plotRatio) {
        this.plotRatio = plotRatio;
    }

    public String getPropertyCompany() {
        return propertyCompany;
    }

    public void setPropertyCompany(String propertyCompany) {
        this.propertyCompany = propertyCompany;
    }

    public Double getPropertyFee() {
        return propertyFee;
    }

    public void setPropertyFee(Double propertyFee) {
        this.propertyFee = propertyFee;
    }

    public Integer getCarStation() {
        return carStation;
    }

    public void setCarStation(Integer carStation) {
        this.carStation = carStation;
    }

    public String getTraffic() {
        return traffic;
    }

    public void setTraffic(String traffic) {
        this.traffic = traffic;
    }

    public String getEquipments() {
        return equipments;
    }

    public void setEquipments(String equipments) {
        this.equipments = equipments;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
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

    public String getSpell() {
        return spell;
    }

    public void setSpell(String spell) {
        this.spell = spell;
    }

    @JSON(serialize=false)
    public Set<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }

    public void setActivities(Set<Activity> activities) {
        this.activities = activities;
    }

    @JSON(serialize = false)
    public Set<Activity> getActivities() {
        return activities;
    }

    /*@JSON(serialize = false)*/
    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    @JSON(serialize = false)
    public Set<Building> getBuilding() {
        return building;
    }

    public void setBuilding(Set<Building> building) {
        this.building = building;
    }

    @JSON(serialize = false)
    public Set<House> getHouses() {
        return houses;
    }

    public void setHouses(Set<House> houses) {
        this.houses = houses;
    }

    @JSON(serialize = false)
    public Set<BuildingsImg> getBuildingsImgs() {
        return buildingsImgs;
    }

    public void setBuildingsImgs(Set<BuildingsImg> buildingsImgs) {
        this.buildingsImgs = buildingsImgs;
    }

    @JSON(serialize = false)
    public Set<Message> getMessages() {
        return messages;
    }

    public void setMessages(Set<Message> messages) {
        this.messages = messages;
    }

    @JSON(serialize = false)
    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    @JSON(serialize = false)
    public Set<History> getHistories() {
        return histories;
    }

    public void setHistories(Set<History> histories) {
        this.histories = histories;
    }

    @JSON(serialize = false)
    public Set<Like> getLikes() {
        return likes;
    }

    public void setLikes(Set<Like> likes) {
        this.likes = likes;
    }

    @Override
    public String toString() {
        return "Buildings{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", area='" + area + '\'' +
                ", address='" + address + '\'' +
                ", floorArea=" + floorArea +
                ", buildingArea=" + buildingArea +
                ", houseType='" + houseType + '\'' +
                ", buildingType='" + buildingType + '\'' +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                ", avgPrice=" + avgPrice +
                ", company='" + company + '\'' +
                ", openDate=" + openDate +
                ", totalRooms=" + totalRooms +
                ", receptionAddress='" + receptionAddress + '\'' +
                ", tel='" + tel + '\'' +
                ", greenRatio=" + greenRatio +
                ", plotRatio=" + plotRatio +
                ", propertyCompany='" + propertyCompany + '\'' +
                ", propertyFee=" + propertyFee +
                ", carStation=" + carStation +
                ", traffic='" + traffic + '\'' +
                ", equipments='" + equipments + '\'' +
                ", logo='" + logo + '\'' +
                ", intro='" + intro + '\'' +
                ", createdTime=" + createdTime +
                ", status=" + status +
                ", spell='" + spell + '\'' +
                '}';
    }
}
