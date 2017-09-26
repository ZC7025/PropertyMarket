package com.ht.service.impl;

import com.ht.bean.BuildingsImg;
import com.ht.common.bean.Pager;
import com.ht.dao.BuildingsImgDAO;
import com.ht.service.BuildingsImgService;

import java.util.List;

/**
 * Created by 7025 on 2017/9/2.
 */
public class BuildingsImgServiceImpl implements BuildingsImgService {

    private BuildingsImgDAO buildingsImgDAO;

    public void setBuildingsImgDAO(BuildingsImgDAO buildingsImgDAO) {
        this.buildingsImgDAO = buildingsImgDAO;
    }

    @Override
    public void save(BuildingsImg buildingsImg) {
        buildingsImgDAO.save(buildingsImg);
    }

    @Override
    public void update(BuildingsImg buildingsImg) {

    }

    @Override
    public void updateStatus(BuildingsImg buildingsImg) {

    }

    @Override
    public void remove(BuildingsImg buildingsImg) {
        buildingsImgDAO.remove(buildingsImg);
    }

    @Override
    public Pager<BuildingsImg> listByPager(Pager<BuildingsImg> pager) {
        return null;
    }

    @Override
    public long count() {
        return buildingsImgDAO.count();
    }

    @Override
    public BuildingsImg getById(String s) {
        return null;
    }

    @Override
    public List<BuildingsImg> ListAll(String s) {
        return null;
    }

    @Override
    public Pager<BuildingsImg> listByPager(Pager<BuildingsImg> pager, String id) {
        return buildingsImgDAO.listByPager(pager, id);
    }

    @Override
    public long count(String id) {
        return buildingsImgDAO.count(id);
    }
}
