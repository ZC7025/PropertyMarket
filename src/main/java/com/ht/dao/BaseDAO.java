package com.ht.dao;

import com.ht.common.bean.Pager;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 7025 on 2017/8/22.
 */
public interface BaseDAO<PK extends Serializable, T> {

    void save(T t);

    void update(T t);

    void updateStatus(T t);

    void remove(T t);

    Pager<T> listByPager(Pager<T> pager);

    long count();

    T getById(PK pk);

    List<T> ListAll(PK pk);
}
