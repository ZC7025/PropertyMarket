package com.ht.service;

import com.ht.bean.History;
import com.ht.common.bean.Pager;

import java.util.List;

/**
 * Created by 7025 on 2017/9/11.
 */
public interface HistoryService extends BaseService<String, History> {

    /**
     * 用户历史记录计数
     * @param id
     * @return
     */
    long countHistory(String id);

    /**
     * 用户历史记录
     * @param pager
     * @param id
     * @return
     */
    Pager<History> listByPager(Pager<History> pager, String id);

    /**
     * 通过userID和buildingsID来判断历史记录有无重复，有则更新时间，无则添加
     * @param userId
     * @param buildingsId
     * @return
     */
    History getById(String userId, String buildingsId);

    /**
     * 批量或单个删除
     * @param histories
     */
    void remove(List<History> histories);
}
