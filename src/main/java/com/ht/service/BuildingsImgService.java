package com.ht.service;

import com.ht.bean.BuildingsImg;
import com.ht.common.bean.Pager;

/**
 * Created by 7025 on 2017/9/2.
 */
public interface BuildingsImgService extends BaseService<String, BuildingsImg> {
    /**
     * 单个楼盘图片
     * @param pager
     * @param id
     * @return
     */
    Pager<BuildingsImg> listByPager(Pager<BuildingsImg> pager, String id);

    /**
     * 单个楼盘图片计数
     * @param id
     * @return
     */
    long count(String id);
}
