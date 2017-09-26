package com.ht.dao;

import com.ht.bean.Comment;
import com.ht.common.bean.Pager;

/**
 * Created by 7025 on 2017/9/8.
 */
public interface CommentDAO extends BaseDAO<String, Comment>{
    /**
     * 单个楼盘评价计数
     * @param id
     * @return
     */
    long count(String id);

    /**
     * 单个楼盘评价
     * @param pager
     * @param id
     * @return
     */
    Pager<Comment> listByPager(Pager<Comment> pager, String id);

    /**
     * 单个经销商的所有评价计数
     * @param id
     * @return
     */
    long countComm(String id);

    /**
     * 单个经销商的所有评价
     * @param pager
     * @param id
     * @return
     */
    Pager<Comment> listComm(Pager<Comment> pager, String id);

    /**
     * 单个用户的所有评价计数
     * @param id
     * @return
     */
    long countUserComm(String id);

    /**
     * 单个用户的所有评价
     * @param pager
     * @param id
     * @return
     */
    Pager<Comment> listUserComm(Pager<Comment> pager, String id);

    /**
     * 前台评价显示
     * @return
     */
    long frontCount(String id);

    /**
     * 前台评价显示
     * @param pager
     * @return
     */
    Pager<Comment> frontComm(Pager<Comment> pager, String id);
}
