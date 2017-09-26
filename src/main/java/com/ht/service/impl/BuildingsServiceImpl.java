package com.ht.service.impl;

import com.ht.bean.Buildings;
import com.ht.common.bean.Pager;
import com.ht.dao.BuildingsDAO;
import com.ht.service.BuildingsService;
import com.ht.vo.Search;

import java.util.List;

/**
 * Created by 7025 on 2017/8/28.
 */
public class BuildingsServiceImpl implements BuildingsService {

    private BuildingsDAO buildingsDAO;

    public void setBuildingsDAO(BuildingsDAO buildingsDAO) {
        this.buildingsDAO = buildingsDAO;
    }

    @Override
    public void save(Buildings buildings) {
        buildingsDAO.save(buildings);
    }

    @Override
    public void update(Buildings buildings) {
        buildingsDAO.update(buildings);
    }

    @Override
    public void updateStatus(Buildings buildings) {
        buildingsDAO.updateStatus(buildings);
    }

    @Override
    public void remove(Buildings buildings) {
        buildingsDAO.remove(buildings);
    }

    @Override
    public Pager<Buildings> listByPager(Pager<Buildings> pager) {
        return buildingsDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return buildingsDAO.count();
    }

    @Override
    public Buildings getById(String s) {
        return buildingsDAO.getById(s);
    }

    @Override
    public List<Buildings> ListAll(String s) {
        return buildingsDAO.ListAll(s);
    }

    @Override
    public List<Buildings> listByAgeencyId(String agency_id) {
        return buildingsDAO.listByAgeencyId(agency_id);
    }

    @Override
    public long count(String id) {
        return buildingsDAO.count(id);
    }

    @Override
    public Pager<Buildings> listBuildings(Pager<Buildings> pager, String id) {
        return buildingsDAO.listBuildings(pager, id);
    }

    @Override
    public Pager<Buildings> pager(Pager<Buildings> pager) {
        return buildingsDAO.pager(pager);
    }

    @Override
    public List<Buildings> randomBuilds(int size) {
        return buildingsDAO.randomBuilds(size);
    }

    @Override
    public List<Search> getSearchList(String searchStr) {
        return buildingsDAO.getSearchList(searchStr);
    }
}
