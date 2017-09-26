package ht.dao;

import com.ht.bean.Activity;
import com.ht.common.bean.Pager;
import com.ht.vo.Search;

import java.util.List;

/**
 * Created by sweet on 2017/8/31.
 */
public interface ActivityDAO extends BaseDAO<String, Activity> {

    Pager<Activity> activityPager(Pager<Activity> pager);

    Pager<Activity> pager(Pager<Activity> pager);

    /**
     * 随机获取活动
     * @param size 活动数
     * @return
     */
    List<Activity> randomAct(int size);

    long countAct(String id);

    Pager<Activity> activityPager(Pager<Activity> pager, String id);

    List<Search> getSearchList(String searchStr);
}
