package com.ht.controller;

import com.ht.bean.Room;
import com.ht.service.RoomService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class RoomController extends ActionSupport implements ServletRequestAware {

    private final static Logger logger = Logger.getLogger(AdminController.class);
    private HttpServletRequest request;

    private RoomService roomService;

    private List<Room> rooms;//get

    private Double totalCost;

    public void setRoomService(RoomService roomService) {
        this.roomService = roomService;
    }

    public List<Room> getRooms() {
        return rooms;
    }

    public Double getTotalCost() {
        return totalCost;
    }

    /**
     * 通过楼栋查询所有房屋
     * @return
     */
    public String listByBuild(){
        String buildId  = request.getParameter("id");
        String floor = request.getParameter("floor");
        rooms = roomService.listByBuildFloor(buildId,Integer.valueOf(floor));
        return "listByBuild";
    }

    /**
     * 计算销售总价
     * @return
     */
    public String countTotalCost(){
        String roomId = request.getParameter("id");
        String discount = request.getParameter("discount");
        Double discount1  =Double.valueOf(discount);
        Room room = roomService.getById(roomId);
        totalCost = room.getHouse().getUnitPrice()*room.getHouse().getArea()*discount1;
        return "countTotalCost";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
