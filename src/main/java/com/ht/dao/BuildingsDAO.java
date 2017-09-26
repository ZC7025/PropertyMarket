package com.ht.dao;

import com.ht.bean.Buildings;
import com.ht.common.bean.Pager;
import com.ht.vo.Search;

import java.util.List;

/**
 * Created by 7025 on 2017/8/28.
 */
public interface BuildingsDAO extends BaseDAO<String, Buildings> {

    List<Buildings> listByAgeencyId(String agency_id);

    long count(String id);

    Pager<Buildings> listBuildings(Pager<Buildings> pager, String id);

    Pager<Buildings> pager(Pager<Buildings> pager);

    /**
     * 从数据库随机抽取数据
     * @param size 抽取多少条数据
     * @return
     */
    List<Buildings> randomBuilds(int size);

    List<Search> getSearchList(String searchStr);
}
