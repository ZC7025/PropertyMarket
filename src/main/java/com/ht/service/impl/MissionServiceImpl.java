package com.ht.service.impl;

import com.ht.bean.Mission;
import com.ht.common.bean.Pager;
import com.ht.dao.MissionDAO;
import com.ht.service.MissionService;

import java.util.List;

public class MissionServiceImpl implements MissionService {

    private MissionDAO missionDAO;

    public void setMissionDAO(MissionDAO missionDAO) {
        this.missionDAO = missionDAO;
    }

    @Override
    public void save(Mission mission) {
        missionDAO.save(mission);
    }

    @Override
    public void update(Mission mission) {
        missionDAO.update(mission);
    }

    @Override
    public void updateStatus(Mission mission) {

    }

    @Override
    public void remove(Mission mission) {
        missionDAO.remove(mission);
    }

    @Override
    public Pager<Mission> listByPager(Pager<Mission> pager) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public Mission getById(String s) {
        return missionDAO.getById(s);
    }

    @Override
    public List<Mission> ListAll(String s) {
        return null;
    }


    @Override
    public Pager<Mission> listMissionByMonth(Pager<Mission> pager,String month) {
        return missionDAO.listMissionByMonth(pager,month);
    }

    @Override
    public Pager<Mission> listMissionByEmployeeId(Pager<Mission> pager, String employeeId) {
        return missionDAO.listMissionByEmployeeId(pager,employeeId);
    }
}
