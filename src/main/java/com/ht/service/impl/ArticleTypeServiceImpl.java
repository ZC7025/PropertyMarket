package com.ht.service.impl;

import com.ht.bean.ArticleType;
import com.ht.common.bean.Pager;
import com.ht.dao.ArticleTypeDAO;
import com.ht.service.ArticleTypeService;

import java.util.List;

/**
 * Created by sweet on 2017/8/31.
 */
public class ArticleTypeServiceImpl implements ArticleTypeService {

    private ArticleTypeDAO articleTypeDAO;

    public void setArticleTypeDAO(ArticleTypeDAO articleTypeDAO) {
        this.articleTypeDAO = articleTypeDAO;
    }

    @Override
    public void save(ArticleType articleType) {
        articleTypeDAO.save(articleType);
    }

    @Override
    public void update(ArticleType articleType) {
        articleTypeDAO.update(articleType);
    }

    @Override
    public void updateStatus(ArticleType articleType) {
        articleTypeDAO.updateStatus(articleType);
    }

    @Override
    public void remove(ArticleType articleType) {
        articleTypeDAO.remove(articleType);
    }

    @Override
    public Pager<ArticleType> listByPager(Pager<ArticleType> pager) {
        return articleTypeDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return articleTypeDAO.count();
    }

    @Override
    public ArticleType getById(String s) {
        return articleTypeDAO.getById(s);
    }

    @Override
    public List<ArticleType> ListAll(String s) {
        return null;
    }

    @Override
    public List<ArticleType> all() {
        return articleTypeDAO.all();
    }
}
