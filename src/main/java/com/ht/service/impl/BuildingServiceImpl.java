package com.ht.service.impl;

import com.ht.bean.Building;
import com.ht.common.bean.Pager;
import com.ht.dao.BuildingDAO;
import com.ht.service.BuildingService;

import java.util.List;

/**
 * Created by 7025 on 2017/8/28.
 */
public class BuildingServiceImpl implements BuildingService {

    private BuildingDAO buildingDAO;

    public void setBuildingDAO(BuildingDAO buildingDAO) {
        this.buildingDAO = buildingDAO;
    }

    @Override
    public void save(Building building) {
        buildingDAO.save(building);
    }

    @Override
    public void update(Building building) {
        buildingDAO.update(building);
    }

    @Override
    public void updateStatus(Building building) {
        buildingDAO.updateStatus(building);
    }

    @Override
    public void remove(Building building) {
        buildingDAO.remove(building);
    }

    @Override
    public Pager<Building> listByPager(Pager<Building> pager) {
        return buildingDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return buildingDAO.count();
    }

    @Override
    public Building getById(String s) {
        return buildingDAO.getById(s);
    }

    @Override
    public List<Building> ListAll(String s) {
        return buildingDAO.ListAll(s);
    }

    @Override
    public long count(String id) {
        return buildingDAO.count(id);
    }

    @Override
    public Pager<Building> listBuilding(Pager<Building> pager, String id) {
        return buildingDAO.listBuilding(pager, id);
    }

    @Override
    public Pager<Building> listByPager(Pager<Building> pager, String id) {
        return buildingDAO.listByPager(pager, id);
    }

    @Override
    public long countBuild(String id) {
        return buildingDAO.countBuild(id);
    }

    @Override
    public List<Building> listByEmployeeId(String employeeId) {
        return buildingDAO.listByEmployeeId(employeeId);
    }

    @Override
    public int countFloor(String buildId) {
        return buildingDAO.countFloor(buildId);
    }

    @Override
    public Pager<Building> frontBuild(Pager<Building> pager) {
        return buildingDAO.frontBuild(pager);
    }

    @Override
    public long frontCount() {
        return buildingDAO.frontCount();
    }
}
