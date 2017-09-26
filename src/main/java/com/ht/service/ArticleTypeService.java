package com.ht.service;

import com.ht.bean.ArticleType;

import java.util.List;

/**
 * Created by sweet on 2017/8/31.
 */
public interface ArticleTypeService extends BaseService<String, ArticleType> {

    List<ArticleType> all();

}
