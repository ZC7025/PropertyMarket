package com.ht.controller;

import com.ht.bean.*;
import com.ht.common.Constants;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.common.util.FileUtil;
import com.ht.common.util.SpellUtil;
import com.ht.service.*;
import com.ht.vo.Search;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by 7025 on 2017/8/28.
 */
public class BuildingsController extends ActionSupport implements ServletRequestAware {

    // 无
    private HttpServletRequest request;
    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录

    // get
    private ControllerResult controllerResult;
    private List<Buildings> rows;
    private int total;
    private List<Activity> activities;
    private List<Search> searches;

    // set
    private BuildingsService buildingsService;
    private BuildingsImgService buildingsImgService;
    private HistoryService historyService;
    private LikeService likeService;
    private ActivityService activityService;
    private AppointmentService appointmentService;
    private String buildingType; // 建筑类型
    private String houseType; // 房源类型
    private String jwd; // 接收经纬度
    private File upload; // 与form表单中file的name一致，temp文件， ROOT/upload_cc3fa222_9f87_4066_af9b_8b7f07e77389_00000000.tmp
    private String uploadFileName; // 此变量的名称固定为file的name + "FileName"
    private int offset;//第几条开始
    private int limit;//每页几行
    private int status;


    // get set
    private Buildings buildings;
    private String district; // 县
    private String buildingsId;
    private BuildingsImg buildingsImg;
    private List<Buildings> buildingss;

    private int page = 1;//get,set
    private int pageSize = 6;//get,set
    private long totalPage;//get

    public String addPage() {
        return "addPage";
    }

    public String search() {
        searches = buildingsService.getSearchList(request.getParameter("searchStr"));
        controllerResult = ControllerResult.getSuccessResult("搜索成功");
        return "search";
    }

    public String add() {
        if(uploadFileName != null) {
            try {
                FileUtils.copyFile(upload, new File(FileUtil.uploadPath() + File.separator + uploadFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            buildings.setLogo(Constants.UPLOADS + "/" + uploadFileName);
        }
        String[] tmpStr = jwd.split(",");
        buildings.setLongitude(Double.valueOf(tmpStr[0]));
        buildings.setLatitude(Double.valueOf(tmpStr[1]));
        buildings.setArea("江西省赣州市" + district);
        buildings.setHouseType(houseType);
        buildings.setBuildingType(buildingType);
        Object obj = request.getSession().getAttribute("agency");
        if(obj == null) {
            controllerResult = ControllerResult.getFailResult("添加失败");
            return "add";
        }
        buildings.setAgency((Agency)obj);
        buildings.setSpell(SpellUtil.getSpell(buildings.getName()));
        buildings.setCreatedTime(Calendar.getInstance().getTime());
        buildings.setStatus(Constants.ACTIVATION);
        buildingsService.save(buildings);
        logger.info("楼盘添加");
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        return "add";
    }

    public String list() {
        Object obj = request.getSession().getAttribute("agency");
        if(obj != null) {
            Agency agency = (Agency)obj;
            rows = new ArrayList<Buildings>();
            total = (int)buildingsService.count(agency.getId());
            Pager<Buildings> pager = new Pager<Buildings>();
            pager.setBeginIndex(offset);
            pager.setPageSize(limit);
            pager = buildingsService.listBuildings(pager, agency.getId());
            rows = pager.getResults();
        }
        return "list";
    }

    public String updateStatus() {
        Buildings buildings1 = getBuilds();
        buildings1.setStatus(status);
        buildingsService.updateStatus(buildings1);
        logger.info("修改户型状态");
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        return "updateStatus";
    }

    public String update() {
        Buildings buildings1 = getBuildings();
        if(uploadFileName != null) {
            try {
                FileUtils.copyFile(upload, new File(FileUtil.uploadPath() + File.separator + uploadFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            buildings1.setLogo(Constants.UPLOADS + "/" + uploadFileName);
        }
        String[] tmpStr = jwd.split(",");
        buildings1.setLongitude(Double.valueOf(tmpStr[0]));
        buildings1.setLatitude(Double.valueOf(tmpStr[1]));
        buildings1.setName(buildings.getName());
        buildings1.setSpell(SpellUtil.getSpell(buildings.getName()));
        buildings1.setAddress(buildings.getAddress());
        buildings1.setBuildingType(houseType);
        buildings1.setHouseType(houseType);
        buildings1.setArea("江西省赣州市" + district);
        buildings1.setAvgPrice(buildings.getAvgPrice());
        buildings1.setBuildingArea(buildings.getBuildingArea());
        buildings1.setCarStation(buildings.getCarStation());
        buildings1.setCompany(buildings.getCompany());
        buildings1.setEquipments(buildings.getEquipments());
        buildings1.setFloorArea(buildings.getFloorArea());
        buildings1.setGreenRatio(buildings.getGreenRatio());
        buildings1.setIntro(buildings.getIntro());
        buildings1.setOpenDate(buildings.getOpenDate());
        buildings1.setPlotRatio(buildings.getPlotRatio());
        buildings1.setPropertyCompany(buildings.getPropertyCompany());
        buildings1.setPropertyFee(buildings.getPropertyFee());
        buildings1.setReceptionAddress(buildings.getReceptionAddress());
        buildings1.setTel(buildings.getTel());
        buildings1.setTotalRooms(buildings.getTotalRooms());
        buildings1.setTraffic(buildings.getTraffic());
        buildingsService.update(buildings1);
        logger.info("楼盘更新");
        controllerResult = ControllerResult.getSuccessResult("更新成功");
        return "update";
    }

    public String addImg() {
        if(uploadFileName != null) {
            try {
                FileUtils.copyFile(upload, new File(FileUtil.uploadPath() + File.separator + uploadFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            buildingsImg.setImgPath(Constants.UPLOADS + "/" + uploadFileName);
        } else {
            controllerResult = ControllerResult.getFailResult("添加失败");
            return "addImg";
        }
        buildingsImg.setCreatedTime(Calendar.getInstance().getTime());
        Buildings buildings1 = new Buildings();
        buildings1.setId(buildingsId);
        buildingsImg.setBuildings(buildings1);
        buildingsImgService.save(buildingsImg);
        logger.info("楼盘添加图片");
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        return "addImg";
    }

    public String addImgPage() {
        return "addImgPage";
    }

    public String listPage() {
        return "listPage";
    }

    public String updatePage() {
        buildings = getBuilds();
        district = buildings.getArea().split("市")[1];
        return "updatePage";
    }

    /**
     * 通过经销商查询所有楼盘
     * @return
     */
    public String listByAgencyID(){
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("agency");
        if(obj != null) {
            Agency agency  = (Agency) obj;
            buildingss = buildingsService.listByAgeencyId(agency.getId());
        }
        return "listByAgencyID";
    }

    //跳转到后台分页页面
    public String buildingsPager(){
        return "buildingsPager";
    }

    public String pager() {
        rows = new ArrayList<Buildings>();
        total = (int)buildingsService.count();
        Pager<Buildings> pager = new Pager<Buildings>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        pager = buildingsService.listByPager(pager);
        rows = pager.getResults();
        return "pager";
    }

    //跳到前台楼盘列表
    public String listPager() {
        Pager<Buildings> pager = new Pager<Buildings>();
        total = (int)buildingsService.count();
        totalPage = total % pageSize == 0 ? total / pageSize : (total / pageSize) + 1;
        if(page <= 1) {
            page = 1;
        }else if(page >= totalPage) {
            page = new Long(totalPage).intValue();
        }
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = buildingsService.pager(pager);
        buildingss = pager.getResults();
        activities = activityService.randomAct(4);
        return "listPager";
    }

    /**
     * 前台楼盘详情
     * @return
     */
    public String personInfo() {
        String id = request.getParameter("id");
        buildings = buildingsService.getById(id);
        request.setAttribute("buildingsId", buildings.getId());
        Object obj = request.getSession().getAttribute("user");
        if(obj == null) {
            return "personInfo";
        }
        User user =(User)obj;
        History history = historyService.getById(user.getId(), buildings.getId()); // 查询历史记录
        request.setAttribute("like", likeService.getLike(user.getId(), buildings.getId())); // 查询点赞记录
        request.setAttribute("appointment",appointmentService.getByUserAndBuildings(user.getId(),buildings.getId()));
        request.setAttribute("userId",user.getId());
        if(history != null) {
            history.setCreatedTime(Calendar.getInstance().getTime());
            historyService.update(history);
            logger.info("更新浏览记录");
        } else {
            history = new History();
            history.setUser(user);
            history.setBuildings(buildings);
            history.setCreatedTime(Calendar.getInstance().getTime());
            historyService.save(history);
            logger.info("生成浏览记录");
        }
        return "personInfo";
    }

    private Buildings getBuilds() {
        return buildingsService.getById(buildings.getId());
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public Buildings getBuildings() {
        return buildings;
    }

    public void setBuildings(Buildings buildings) {
        this.buildings = buildings;
    }

    public void setBuildingsService(BuildingsService buildingsService) {
        this.buildingsService = buildingsService;
    }

    public void setBuildingsImgService(BuildingsImgService buildingsImgService) {
        this.buildingsImgService = buildingsImgService;
    }

    public void setHistoryService(HistoryService historyService) {
        this.historyService = historyService;
    }

    public void setLikeService(LikeService likeService) {
        this.likeService = likeService;
    }

    public void setAppointmentService(AppointmentService appointmentService) {
        this.appointmentService = appointmentService;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getDistrict() {
        return district;
    }

    public void setJwd(String jwd) {
        this.jwd = jwd;
    }

    public List<Buildings> getBuildingss() {
        return buildingss;
    }

    public void setBuildingss(List<Buildings> buildingss) {
        this.buildingss = buildingss;
    }

    public void setBuildingType(String buildingType) {
        this.buildingType = buildingType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public List<Buildings> getRows() {
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

    public void setStatus(int status) {
        this.status = status;
    }

    public String getBuildingsId() {
        return buildingsId;
    }

    public void setBuildingsId(String buildingsId) {
        this.buildingsId = buildingsId;
    }

    public BuildingsImg getBuildingsImg() {
        return buildingsImg;
    }

    public void setBuildingsImg(BuildingsImg buildingsImg) {
        this.buildingsImg = buildingsImg;
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

    public List<Activity> getActivities() {
        return activities;
    }

    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }

    public List<Search> getSearches() {
        return searches;
    }
}
