package com.ht.controller;

import com.ht.bean.Activity;
import com.ht.bean.Ads;
import com.ht.bean.Buildings;
import com.ht.bean.House;
import com.ht.common.bean.ControllerResult;
import com.ht.service.ActivityService;
import com.ht.service.AdsService;
import com.ht.service.BuildingsService;
import com.ht.service.HouseService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by sweet on 2017/9/6.
 */
public class HomeController extends ActionSupport implements ServletRequestAware {

    // 无
    private HttpServletRequest request;
    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录

    // get
    private ControllerResult controllerResult;
    private List<Buildings> buildings;
    private List<Activity> activities;
    private List<House> houses;
    private List<Ads> ads;

    // set
    private BuildingsService buildingsService;
    private ActivityService activityService;
    private HouseService houseService;
    private AdsService adsService;

    // get set


    public String homePager() {
        buildings = buildingsService.randomBuilds(3);
        activities = activityService.randomAct(14);
        houses = houseService.randomHouse(11);
        ads = adsService.getAds();
        return "homePager";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public void setBuildingsService(BuildingsService buildingsService) {
        this.buildingsService = buildingsService;
    }

    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }

    public void setHouseService(HouseService houseService) {
        this.houseService = houseService;
    }

    public List<Buildings> getBuildings() {
        return buildings;
    }

    public List<Activity> getActivities() {
        return activities;
    }

    public List<House> getHouses() {
        return houses;
    }

    public List<Ads> getAds() {
        return ads;
    }

    public void setAdsService(AdsService adsService) {
        this.adsService = adsService;
    }
}
