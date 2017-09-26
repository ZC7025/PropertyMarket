package com.ht.dao;

import com.ht.bean.House;
import com.ht.common.bean.Pager;
import com.ht.vo.Search;

import java.util.List;

/**
 * Created by 7025 on 2017/8/29.
 */
public interface HouseDAO extends BaseDAO<String, House> {

    /**
     * 单个楼盘的户型计数
     * @param id
     * @return
     */
    long count(String id);

    /**
     * 单个楼盘的户型
     * @param pager
     * @param id
     * @return
     */
    Pager<House> listHouse(Pager<House> pager, String id);

    /**
     * 单个经销商的户型计数
     * @param id
     * @return
     */
    long countHouse(String id);

    /**
     * 单个经销商的户型
     * @param pager
     * @param id
     * @return
     */
    Pager<House> housePager(Pager<House> pager, String id);

    /**
     * 随机获取数据库户型
     * @param size 户型数
     * @return
     */
    List<House> randomHouse(int size);

    /**
     * 根据楼盘查询所有户型
     * @param buildingsId
     * @return
     */
    List<House> listByBuildings(String buildingsId);

    /**
     * 所有经过审核的户型分页
     * @param pager
     * @return
     */
    Pager<House> housePager(Pager<House> pager);

    /**
     * 所有经过审核的户型
     * @return
     */
    long countChecked();

    List<Search> getSearchList(String searchStr);
}
