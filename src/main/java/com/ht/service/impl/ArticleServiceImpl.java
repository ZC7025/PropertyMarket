package com.ht.service.impl;

import com.ht.bean.Article;
import com.ht.common.bean.Pager;
import com.ht.dao.ArticleDAO;
import com.ht.service.ArticleService;
import com.ht.vo.Search;

import java.util.List;

/**
 * Created by sweet on 2017/8/31.
 */
public class ArticleServiceImpl implements ArticleService {

    private ArticleDAO articleDAO;

    public void setArticleDAO(ArticleDAO articleDAO) {
        this.articleDAO = articleDAO;
    }

    @Override
    public void save(Article article) {
        articleDAO.save(article);
    }

    @Override
    public void update(Article article) {
        articleDAO.update(article);
    }

    @Override
    public void updateStatus(Article article) {

    }

    @Override
    public void remove(Article article) {
        articleDAO.remove(article);
    }

    @Override
    public Pager<Article> listByPager(Pager<Article> pager) {
        return articleDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return articleDAO.count();
    }

    @Override
    public Article getById(String s) {
        return articleDAO.getById(s);
    }

    @Override
    public List<Article> ListAll(String s) {
        return null;
    }

    @Override
    public Pager<Article> pager(Pager<Article> pager) {
        return articleDAO.pager(pager);
    }

    @Override
    public List<Search> getSearchList(String searchStr) {
        return articleDAO.getSearchList(searchStr);
    }
}
