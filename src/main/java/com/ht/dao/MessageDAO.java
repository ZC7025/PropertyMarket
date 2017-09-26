package com.ht.dao;

import com.ht.bean.Message;
import com.ht.common.bean.Pager;

/**
 * Created by 7025 on 2017/9/5.
 */
public interface MessageDAO extends BaseDAO<String, Message> {
    /**
     * 单个楼盘留言计数
     * @param id
     * @return
     */
    long count(String id);

    /**
     * 单个楼盘留言
      * @param pager
     * @param id
     * @return
     */
    Pager<Message> listByPager(Pager<Message> pager, String id);

    /**
     * 单个经销商的所有留言计数
     * @param id
     * @return
     */
    long countMsg(String id);

    /**
     * 单个经销商的所有留言
     * @param pager
     * @param id
     * @return
     */
    Pager<Message> listMsg(Pager<Message> pager, String id);

    /**
     * 单个用户的所有留言计数
     * @param id
     * @return
     */
    long countUserMsg(String id);

    /**
     * 单个用户的所有留言
     * @param pager
     * @param id
     * @return
     */
    Pager<Message> listUserMsg(Pager<Message> pager, String id);

    /**
     * 前台留言显示
     * @return
     */
    long frontCount(String id);

    /**
     * 前台留言显示
     * @param pager
     * @return
     */
    Pager<Message> frontMsg(Pager<Message> pager, String id);
}
