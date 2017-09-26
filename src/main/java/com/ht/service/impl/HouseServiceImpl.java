package com.ht.service.impl;

import com.ht.bean.House;
import com.ht.common.bean.Pager;
import com.ht.dao.HouseDAO;
import com.ht.service.HouseService;
import com.ht.vo.Search;

import java.util.List;

/**
 * Created by 7025 on 2017/8/29.
 */
public class HouseServiceImpl implements HouseService {

    private HouseDAO houseDAO;

    public void setHouseDAO(HouseDAO houseDAO) {
        this.houseDAO = houseDAO;
    }

    @Override
    public void save(House house) {
        houseDAO.save(house);
    }

    @Override
    public void update(House house) {
        houseDAO.update(house);
    }

    @Override
    public void updateStatus(House house) {
        houseDAO.updateStatus(house);
    }

    @Override
    public void remove(House house) {
        houseDAO.remove(house);
    }

    @Override
    public Pager<House> listByPager(Pager<House> pager) {
        return houseDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return houseDAO.count();
    }

    @Override
    public House getById(String s) {
        return houseDAO.getById(s);
    }

    @Override
    public List<House> ListAll(String s) {
        return houseDAO.ListAll(s);
    }

    @Override
    public long count(String id) {
        return houseDAO.count(id);
    }

    @Override
    public Pager<House> listHouse(Pager<House> pager, String id) {
        return houseDAO.listHouse(pager, id);
    }

    @Override
    public long countHouse(String id) {
        return houseDAO.countHouse(id);
    }

    @Override
    public Pager<House> housePager(Pager<House> pager, String id) {
        return houseDAO.housePager(pager, id);
    }

    @Override
    public List<House> randomHouse(int size) {
        return houseDAO.randomHouse(size);
    }

    @Override
    public Pager<House> housePager(Pager<House> pager) {
        return houseDAO.housePager(pager);
    }

    @Override
    public long countChecked() {
        return houseDAO.countChecked();
    }

    @Override
    public List<House> listByBuildings(String buildingsId) {
        return houseDAO.listByBuildings(buildingsId);
    }

    @Override
    public List<Search> getSearchList(String searchStr) {
        return houseDAO.getSearchList(searchStr);
    }
}
