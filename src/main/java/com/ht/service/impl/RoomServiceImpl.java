package com.ht.service.impl;

import com.ht.bean.Room;
import com.ht.common.bean.Pager;
import com.ht.dao.RoomDAO;
import com.ht.service.RoomService;
import com.ht.vo.RoomAndHouse;

import java.util.List;

/**
 * Created by 7025 on 2017/9/4.
 */
public class RoomServiceImpl implements RoomService {

    private RoomDAO roomDAO;

    public void setRoomDAO(RoomDAO roomDAO) {
        this.roomDAO = roomDAO;
    }

    @Override
    public void save(Room room) {
        roomDAO.save(room);
    }

    @Override
    public void update(Room room) {
        roomDAO.update(room);
    }

    @Override
    public void updateStatus(Room room) {
        roomDAO.updateStatus(room);
    }

    @Override
    public void remove(Room room) {
        roomDAO.remove(room);
    }

    @Override
    public Pager<Room> listByPager(Pager<Room> pager) {
        return roomDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return roomDAO.count();
    }

    @Override
    public Room getById(String s) {
        return roomDAO.getById(s);
    }

    @Override
    public List<Room> ListAll(String s) {
        return roomDAO.ListAll(s);
    }

    @Override
    public void save(List<Room> rooms) {
        roomDAO.save(rooms);
    }

    @Override
    public List<RoomAndHouse> listAll(String id) {
        return roomDAO.listAll(id);
    }

    @Override
    public List<Room> listByBuild(String buildId) {
        return roomDAO.listByBuild(buildId);
    }

    @Override
    public List<Room> listByBuildFloor(String buildId, int floor) {
        return roomDAO.listByBuildFloor(buildId,floor);
    }

    @Override
    public Room getBySale(String saleId) {
        return roomDAO.getBySale(saleId);
    }

    @Override
    public void removeById(String id) {
        roomDAO.removeById(id);
    }

    @Override
    public long countRoom(String buildId) {
        return roomDAO.countRoom(buildId);
    }
}
