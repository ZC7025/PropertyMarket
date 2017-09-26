package com.ht.service;

import com.ht.bean.Article;
import com.ht.common.bean.Pager;
import com.ht.vo.Search;

import java.util.List;

/**
 * Created by sweet on 2017/8/31.
 */
public interface ArticleService extends BaseService<String, Article> {

    Pager<Article> pager(Pager<Article> pager);

    List<Search> getSearchList(String searchStr);

}
