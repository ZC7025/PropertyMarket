package com.ht.dao;

import com.ht.bean.ArticleType;

import java.util.List;

/**
 * Created by sweet on 2017/8/31.
 */
public interface ArticleTypeDAO extends BaseDAO<String, ArticleType> {

    List<ArticleType> all();

}
