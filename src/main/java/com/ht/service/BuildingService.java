package com.ht.service;

import com.ht.bean.Building;
import com.ht.common.bean.Pager;

import java.util.List;

/**
 * Created by 7025 on 2017/8/28.
 */
public interface BuildingService extends BaseService<String, Building> {

    /**
     * 单个楼盘的楼栋数
     * @param id
     * @return
     */
    long count(String id);

    /**
     * 查看单个楼盘的楼栋
     * @param pager
     * @param id
     * @return
     */
    Pager<Building> listBuilding(Pager<Building> pager, String id);

    /**
     * 查看单个经销商的所有楼栋
     * @param pager
     * @param id
     * @return
     */
    Pager<Building> listByPager(Pager<Building> pager, String id);

    /**
     * 单个经销商所有楼栋计数
     * @param id
     * @return
     */
    long countBuild(String id);

    /**
     * 通过与员工查询所有楼栋
     * @param employeeId
     * @return
     */
    List<Building> listByEmployeeId(String employeeId);

    /**
     * 查询有多少层
     * @param buildId
     * @return
     */
    int countFloor(String buildId);

    /**
     * 前台楼栋分页
     * @return
     */
    Pager<Building> frontBuild(Pager<Building> pager);

    /**
     * 前台楼栋计数
     * @return
     */
    long frontCount();
}
