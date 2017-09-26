package com.ht.service.impl;

import com.ht.bean.Like;
import com.ht.common.bean.Pager;
import com.ht.dao.LikeDAO;
import com.ht.service.LikeService;

import java.util.List;

/**
 * Created by 7025 on 2017/9/11.
 */
public class LikeServiceImpl implements LikeService {

    private LikeDAO likeDAO;

    public void setLikeDAO(LikeDAO likeDAO) {
        this.likeDAO = likeDAO;
    }

    @Override
    public void save(Like like) {
        likeDAO.save(like);
    }

    @Override
    public void update(Like like) {

    }

    @Override
    public void updateStatus(Like like) {

    }

    @Override
    public void remove(Like like) {
        likeDAO.remove(like);
    }

    @Override
    public Pager<Like> listByPager(Pager<Like> pager) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public Like getById(String s) {
        return null;
    }

    @Override
    public List<Like> ListAll(String s) {
        return null;
    }


    public long countLike(String userId) {
        return likeDAO.countLike(userId);
    }


    public Pager<Like> listLike(Pager<Like> pager, String userId) {
        return likeDAO.listLike(pager, userId);
    }


    public Like getLike(String userId, String buildingsId) {
        return likeDAO.getLike(userId, buildingsId);
    }


    public void remove(List<Like> likes) {
        likeDAO.remove(likes);
    }
}
