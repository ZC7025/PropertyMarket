package com.ht.controller;

import com.ht.bean.*;
import com.ht.common.Constants;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.service.BuildingService;
import com.ht.service.BuildingsService;
import com.ht.service.RoomService;
import com.ht.vo.RoomAndHouse;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by 7025 on 2017/8/29.
 */
public class BuildingController extends ActionSupport implements ServletRequestAware {
    // 无
    private HttpServletRequest request;
    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录

    // get
    private ControllerResult controllerResult;
    private List<Building> rows;
    private int total;
    private List<RoomAndHouse> roomSale;
    private long totalPage;
    private List<Building> buildings;
    private List<Buildings> buildingsList;

    // set
    private BuildingService buildingService;
    private int offset;//第几条开始
    private int limit;//每页几行
    private int status;
    private RoomService roomService;
    private BuildingsService buildingsService;

    // get set
    private Building building;
    private Room room;
    private String buildingsId;
    private int floor;
    private int page = 1;
    private int pageSize = 6;


    public String add() {
        Buildings buildings = new Buildings();
        buildings.setId(buildingsId);
        building.setBuildings(buildings);
        Object obj = request.getSession().getAttribute("agency");
        if(obj == null) {
            controllerResult = ControllerResult.getFailResult("添加失败");
            return "add";
        }
        building.setAgency((Agency)obj );
        building.setCreatedTime(Calendar.getInstance().getTime());
        building.setStatus(Constants.ACTIVATION);
        buildingService.save(building);
        logger.info("经销商添加楼栋");
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        return "add";
    }

    public String addRoom() {
        roomService.removeById(building.getId());
        String[] houseType = new String[building.getFloorRooms()];
        for(int i = 0; i < building.getFloorRooms(); i++) {
            houseType[i] = request.getParameter("houseType"+ i +"");
        }
        List<Room> rooms = new ArrayList<>();
        for(int i = 1; i<=building.getTotalFloor(); i++) { // 层
            for(int j = 1; j<=building.getFloorRooms(); j++) { // 户
                Room room = new Room();
                String tempStr1 = "";
                String tempStr2 = "";
                if(i < 10 && i > 0) {
                    tempStr1 = "100" + i;
                } else if(i < 100 && i >= 10) {
                    tempStr1 = "10" + i;
                } else {
                    tempStr1 = "1" + i;
                }
                if(j < 10 && j > 0) {
                    tempStr2 = "0" + j;
                } else {
                    tempStr2 = "" + j;
                }
                room.setName(tempStr1 + tempStr2);
                room.setFloor(i);
                room.setRoom(j);
                room.setSaleStatus(Constants.ACTIVATION);
                House house = new House();
                house.setId(houseType[j-1]);
                room.setHouse(house);
                room.setBuilding(building);
                rooms.add(room);
            }
        }
        roomService.save(rooms);
        logger.info("经销商生成房号");
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        return "addRoom";
    }

    /**
     * 查看房屋销售状态
     * @return
     */
    public String roomSale() {
        roomSale = roomService.listAll(building.getId());
        building = getBuild();
        controllerResult = ControllerResult.getSuccessResult("房屋销售状态生成");
        logger.info("房屋销售状态生成");
        return "roomSale";
    }

    /**
     * 判断该楼栋是否生成了房号
     * @return
     */
    public String checkRoom() {
        long countRoom = roomService.countRoom(building.getId());
        if(countRoom > 0) {
            controllerResult = ControllerResult.getSuccessResult("有房号");
        } else {
            controllerResult = ControllerResult.getFailResult("无房号");
        }
        return "checkRoom";
    }

    /**
     * 更新房屋销售状态表
     * @return
     */
    public String updateRoom() {
        Room room1 = roomService.getById(room.getId());
        room1.setSaleStatus(room.getSaleStatus());
        roomService.updateStatus(room1);
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        logger.info("修改房屋销售状态");
        return "updateRoom";
    }

    public String listBuild() {
        rows = new ArrayList<Building>();
        Pager<Building> pager = new Pager<Building>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        if(buildingsId != null) {
            // 单个楼盘内的楼栋
            Buildings buildings = new Buildings();
            buildings.setId(buildingsId);
            total = (int) buildingService.count(buildings.getId());
            pager = buildingService.listBuilding(pager, buildings.getId());
            buildingsId = null;
        } else {
            // 单个经销商的所有楼栋
            Object obj = request.getSession().getAttribute("agency");
            if(obj != null) {
                Agency agency = (Agency)obj;
                total = (int) buildingService.countBuild(agency.getId());
                pager = buildingService.listByPager(pager, agency.getId());
            }
            buildingsId = null;
        }
        rows = pager.getResults();
        return "listBuild";
    }

    public String update() {
        Building building1 = getBuild();
        if(building.getName() == null || building.getName().trim().equals("")) {
            controllerResult = ControllerResult.getFailResult("名字不能为空");
            return "update";
        }
        building1.setName(building.getName());
        if(building.getFloorRooms() == 0) {
            controllerResult = ControllerResult.getFailResult("每层户数不能为空");
            return "update";
        }
        building1.setFloorRooms(building.getFloorRooms());
        if(building.getTotalFloor() == 0) {
            controllerResult = ControllerResult.getFailResult("楼层数不能为空");
            return "update";
        }
        building1.setTotalFloor(building.getTotalFloor());
        if(building.getTotalLift() == 0) {
            controllerResult = ControllerResult.getFailResult("电梯数不能为空");
            return "update";
        }
        building1.setTotalLift(building.getTotalLift());
        if(building.getTotalRoom() == 0) {
            controllerResult = ControllerResult.getFailResult("总户数不能为空");
            return "update";
        }
        building1.setTotalRoom(building.getTotalRoom());
        buildingService.update(building1);
        roomService.removeById(building.getId());
        logger.info("更改楼栋信息");
        controllerResult = ControllerResult.getSuccessResult("更新成功");
        return "update";
    }

    public String updateStatus() {
        Building building1 = getBuild();
        building1.setStatus(status);
        buildingService.updateStatus(building1);
        logger.info("修改楼栋状态");
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        return "updateStatus";
    }

    /**
     * 通过员工查询所有楼栋
     * @return
     */
    public String listBuildingByEmployee(){
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("employee");
        Employee employee  = (Employee) obj;
        rows = buildingService.listByEmployeeId(employee.getBuildings().getId());
        return "listBuildingByEmployee";
    }

    public String countFloor(){
        String buildId  = request.getParameter("id");
        floor  = buildingService.countFloor(buildId);
        return "countFloor";
    }

    private Building getBuild() {
        return buildingService.getById(building.getId());
    }

    public String addPage() {
        return "addPage";
    }

    public String listPage() {
        return "listPage";
    }

    public String roomPage() {
        return "roomPage";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    public Building getBuilding() {
        return building;
    }

    public void setBuilding(Building building) {
        this.building = building;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public void setBuildingService(BuildingService buildingService) {
        this.buildingService = buildingService;
    }

    public List<Building> getRows() {
        return rows;
    }

    public int getTotal() {
        return total;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getBuildingsId() {
        return buildingsId;
    }

    public void setBuildingsId(String buildingsId) {
        this.buildingsId = buildingsId;
    }

    public void setRoomService(RoomService roomService) {
        this.roomService = roomService;
    }

    public List<RoomAndHouse> getRoomSale() {
        return roomSale;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public int getFloor() {
        return floor;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotalPage() {
        return totalPage;
    }

    public List<Building> getBuildings() {
        return buildings;
    }

    public List<Buildings> getBuildingsList() {
        return buildingsList;
    }

    public void setBuildingsService(BuildingsService buildingsService) {
        this.buildingsService = buildingsService;
    }
}
