package com.ht.controller;

import com.ht.bean.Activity;
import com.ht.bean.Agency;
import com.ht.bean.Buildings;
import com.ht.common.Constants;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.common.util.FileUtil;
import com.ht.common.util.SpellUtil;
import com.ht.service.ActivityService;
import com.ht.vo.PrefectActivity;
import com.ht.vo.Search;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by sweet on 2017/8/31.
 */
public class ActivityController extends ActionSupport implements ServletRequestAware {

    private HttpServletRequest request;
    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录

    private ControllerResult controllerResult;//get

    private ActivityService activityService;//set

    private Activity activity;
    private String buildingsId;

    private List<PrefectActivity> rows;//get
    private int total;//get
    private int offset;//第几条开始,set
    private int limit;//每页几行，set

    private File logo;//set
    private String logoFileName;//set
    private String activityTime;

    private List<Activity> activities;//get.set

    private int page = 1;//get,set
    private int pageSize = 6;//get,set
    private long totalPage;//get
    private List<Search> searches;


    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }

    public List<PrefectActivity> getRows() {
        return rows;
    }

    public int getTotal() {
        return total;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    public void setLogo(File logo) {
        this.logo = logo;
    }

    public void setLogoFileName(String logoFileName) {
        this.logoFileName = logoFileName;
    }

    public String getBuildingsId() {
        return buildingsId;
    }

    public void setBuildingsId(String buildingsId) {
        this.buildingsId = buildingsId;
    }

    public void setActivityTime(String activityTime) {
        this.activityTime = activityTime;
    }

    public List<Activity> getActivities() {
        return activities;
    }

    public void setActivities(List<Activity> activities) {
        this.activities = activities;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotalPage() {
        return totalPage;
    }

    public List<Search> getSearches() {
        return searches;
    }

    //跳转到管理员添加平台活动页面
    public String addPage() {
        return "addPage";
    }

    //跳转到管理员添加平台活动分页页面
    public String activityPager() {
        return "activityPager";
    }

    public String search() {
        searches = activityService.getSearchList(request.getParameter("searchStr"));
        controllerResult = ControllerResult.getSuccessResult("搜索成功");
        return "search";
    }

    public String pager() {
        total = (int)activityService.count();
        Pager<Activity> pager = new Pager<Activity>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        pager = activityService.activityPager(pager);//vo的分页
        List<Activity> activities = pager.getResults();
        rows = new ArrayList<>();
        for(Activity activity : activities){
            PrefectActivity prefectActivity = new PrefectActivity();
            prefectActivity.setId(activity.getId());
            prefectActivity.setLogo(activity.getLogo());
            prefectActivity.setStatus(activity.getStatus());
            prefectActivity.setTitle(activity.getTitle());
            prefectActivity.setAddress(activity.getAddress());
            prefectActivity.setContent(activity.getContent());
            prefectActivity.setStartTime(activity.getStartTime());
            prefectActivity.setEndTime(activity.getEndTime());
            if(activity.getBuildings() != null){
                prefectActivity.setAgencyName(activity.getBuildings().getAgency().getName());
                prefectActivity.setBuildingsName(activity.getBuildings().getName());
            }else{
                prefectActivity.setAgencyName("管理员");
            }
            rows.add(prefectActivity);
        }
        return "pager";
    }

    /**
     * 经销商后台查看活动
     * @return
     */
    public String agencyPager() {
        Object obj = request.getSession().getAttribute("agency");
        if(obj == null) {
            controllerResult = ControllerResult.getFailResult("分页失败");
            return "agencyPager";
        }
        Agency agency =(Agency)obj;
        total = (int)activityService.countAct(agency.getId());
        Pager<Activity> pager = new Pager<Activity>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        pager = activityService.activityPager(pager, agency.getId());//vo的分页
        List<Activity> activities = pager.getResults();
        rows = new ArrayList<>();
        for(Activity activity : activities){
            PrefectActivity prefectActivity = new PrefectActivity();
            prefectActivity.setId(activity.getId());
            prefectActivity.setLogo(activity.getLogo());
            prefectActivity.setStatus(activity.getStatus());
            prefectActivity.setTitle(activity.getTitle());
            prefectActivity.setAddress(activity.getAddress());
            prefectActivity.setContent(activity.getContent());
            prefectActivity.setStartTime(activity.getStartTime());
            prefectActivity.setEndTime(activity.getEndTime());
            prefectActivity.setAgencyName(activity.getBuildings().getAgency().getName());
            prefectActivity.setBuildingsName(activity.getBuildings().getName());
            rows.add(prefectActivity);
        }
        return "agencyPager";
    }

    public String agencyAct() {
        return "agencyAct";
    }

    //把状态变为可用的方法
    public String beUsable() {
        Activity activity = new Activity();
        String id = request.getParameter("id");
        activity = activityService.getById(id);
        activity.setStatus(1);
        activityService.update(activity);
        controllerResult = ControllerResult.getSuccessResult("激活");
        return "beUsable";
    }

    //把状态变为不可用的方法
    public String beDisable() {
        Activity activity = new Activity();
        String id = request.getParameter("id");
        activity = activityService.getById(id);
        activity.setStatus(0);
        activityService.update(activity);
        controllerResult = ControllerResult.getSuccessResult("冻结");
        return "beDisable";
    }

    public String addActivity() throws ParseException {
        if(logoFileName != null) {
            try {
                FileUtils.copyFile(logo, new File(FileUtil.uploadPath() + File.separator + logoFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            activity.setLogo(Constants.UPLOADS + "/" + logoFileName);
        }
        if(buildingsId != null && !buildingsId.trim().equals("")) {
            Buildings buildings = new Buildings();
            buildings.setId(buildingsId);
            activity.setBuildings(buildings);
            activity.setAgency((Agency) request.getAttribute("agency"));
        }
        Object obj = request.getSession().getAttribute("agency");
        if(obj != null) {
            Agency agency =(Agency)obj;
            activity.setAgency(agency);
        }
        activity.setSpell(SpellUtil.getSpell(activity.getTitle()));
        String[] tempStr = activityTime.split(" 到 ");
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.DEFAULT_DATE_PATTERN);
        activity.setStartTime(sdf.parse(tempStr[0]));
        activity.setEndTime(sdf.parse(tempStr[1]));
        activity.setStatus(Constants.ACTIVATION);
        activityService.save(activity);
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        return "addActivity";
    }

    public String upActivity() throws ParseException {
        String id = request.getParameter("id");
        Activity activity1 = activityService.getById(id);
        activity1.setTitle(activity.getTitle());
        activity1.setContent(activity.getContent());
        activity1.setAddress(activity.getAddress());
        activityTime = activityTime.replace("T"," ");
        String[] tempStr = activityTime.split("到");
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.DEFAULT_DATE_PATTERN);
        activity.setStartTime(sdf.parse(tempStr[0]));
        activity.setEndTime(sdf.parse(tempStr[1]));
        activity1.setStartTime(activity.getStartTime());
        activity1.setEndTime(activity.getEndTime());
        if(logoFileName != null) {
            try {
                FileUtils.copyFile(logo, new File(FileUtil.uploadPath() + File.separator + logoFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            activity1.setLogo(Constants.UPLOADS + "/" + logoFileName);
        }else{
            activity1.setLogo(activity1.getLogo());
        }

        activityService.update(activity1);
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        return "upActivity";
    }

    //前台分页
    public String listPager() {
        Pager<Activity> pager = new Pager<Activity>();
        total = (int)activityService.count();
        totalPage = total % pageSize == 0 ? total / pageSize : (total / pageSize) + 1;
        if(page <= 1) {
            page = 1;
        }else if(page >= totalPage) {
            page = new Long(totalPage).intValue();
        }
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = activityService.pager(pager);
        activities = pager.getResults();
        return "listPager";
    }

    //活动的详细信息
    public String personInfor() {
        String id = request.getParameter("id");
        activity = activityService.getById(id);
        return "personInfor";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
