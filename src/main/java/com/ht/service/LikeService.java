package com.ht.service;

import com.ht.bean.Like;
import com.ht.common.bean.Pager;

import java.util.List;

/**
 * Created by sweet on 2017/9/12.
 */
public interface LikeService extends BaseService<String, Like> {

    long countLike(String userId);

    Pager<Like> listLike(Pager<Like> pager, String userId);

    Like getLike(String userId, String buildingsId);

    /**
     * 批量或单个删除
     * @param likes
     */
    void remove(List<Like> likes);
}
