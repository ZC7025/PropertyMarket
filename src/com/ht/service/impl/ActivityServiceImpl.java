package ht.service.impl;

import com.ht.bean.Activity;
import com.ht.common.bean.Pager;
import com.ht.dao.ActivityDAO;
import com.ht.service.ActivityService;
import com.ht.vo.Search;

import java.util.List;

/**
 * Created by sweet on 2017/8/31.
 */
public class ActivityServiceImpl implements ActivityService {

    private ActivityDAO activityDAO;

    public void setActivityDAO(ActivityDAO activityDAO) {
        this.activityDAO = activityDAO;
    }

    @Override
    public void save(Activity activity) {
        activityDAO.save(activity);
    }

    @Override
    public void update(Activity activity) {
        activityDAO.update(activity);
    }

    @Override
    public void updateStatus(Activity activity) {
        activityDAO.updateStatus(activity);
    }

    @Override
    public void remove(Activity activity) {
        activityDAO.remove(activity);
    }

    @Override
    public Pager<Activity> listByPager(Pager<Activity> pager) {
        return activityDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return activityDAO.count();
    }

    @Override
    public Activity getById(String s) {
        return activityDAO.getById(s);
    }

    @Override
    public List<Activity> ListAll(String s) {
        return null;
    }

    @Override
    public Pager<Activity> activityPager(Pager<Activity> pager) {
        return activityDAO.activityPager(pager);
    }

    @Override
    public Pager<Activity> pager(Pager<Activity> pager) {
        return activityDAO.pager(pager);
    }

    @Override
    public List<Activity> randomAct(int size) {
        return activityDAO.randomAct(size);
    }

    @Override
    public long countAct(String id) {
        return activityDAO.countAct(id);
    }

    @Override
    public Pager<Activity> activityPager(Pager<Activity> pager, String id) {
        return activityDAO.activityPager(pager, id);
    }

    @Override
    public List<Search> getSearchList(String searchStr) {
        return activityDAO.getSearchList(searchStr);
    }
}
