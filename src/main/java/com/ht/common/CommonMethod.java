package com.ht.common;

import com.ht.common.bean.Pager;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 * Created by 7025 on 2017/8/28.
 * 现在貌似只能用来分页查找
 */
public class CommonMethod<T> {

    /**
     * 分页的通用方法
     * @param obj     对象名
     * @param session session连接
     * @param pager   pager对象
     * @return 返回查询好的pager对象
     */
    public Pager<T> getPager(String obj, Session session, Pager<T> pager) {
        Query query = session.createQuery("from " + obj + "order by createdTime desc");
        query.setMaxResults(pager.getPageSize());
        query.setFirstResult(pager.getBeginIndex());
        Pager<T> pager1 = new Pager<T>();
        pager1.setResults(query.list());
        pager1.setPage(pager.getPage());
        return pager1;
    }
}