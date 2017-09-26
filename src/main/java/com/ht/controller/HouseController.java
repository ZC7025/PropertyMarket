package com.ht.controller;

import com.ht.bean.Admin;
import com.ht.bean.Agency;
import com.ht.bean.Buildings;
import com.ht.bean.House;
import com.ht.common.Constants;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.common.util.FileUtil;
import com.ht.service.BuildingsService;
import com.ht.service.HouseService;
import com.ht.vo.Search;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by 7025 on 2017/8/29.
 */
public class HouseController extends ActionSupport implements ServletRequestAware {
    // 无
    private HttpServletRequest request;
    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录

    // get
    private ControllerResult controllerResult;
    private List<House> rows;
    private int total;
    private long totalPage;
    private List<Buildings> buildings;
    private List<Search> searches;

    // set
    private HouseService houseService;
    private BuildingsService buildingsService;
    private File upload; // 与form表单中file的name一致，temp文件， ROOT/upload_cc3fa222_9f87_4066_af9b_8b7f07e77389_00000000.tmp
    private String uploadFileName;
    private int offset;//第几条开始
    private int limit;//每页几行
    private int status;

    // get set
    private House house;
    private String buildingsId;
    private int page = 1;
    private int pageSize = 6;

    private List<House> houses;

    public String search() {
        searches = houseService.getSearchList(request.getParameter("searchStr"));
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
            house.setLogo(Constants.UPLOADS + "/" + uploadFileName);
        }
        Buildings buildings = new Buildings();
        buildings.setId(buildingsId);
        house.setBuildings(buildings);
        Object obj = request.getSession().getAttribute("agency");
        if(obj != null) {
            house.setAgency((Agency)obj);
        }
        house.setCreatedTime(Calendar.getInstance().getTime());
        house.setStatus(Constants.ACTIVATION);
        houseService.save(house);
        logger.info("经销商添加楼栋");
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        return "add";
    }

    public String houseList() {
        Pager<House> pager = new Pager<House>();
        total = (int)houseService.countChecked();
        totalPage = total % pageSize == 0 ? total / pageSize : (total / pageSize) + 1;
        if(page <= 1) {
            page = 1;
        }else if(page >= totalPage) {
            page = new Long(totalPage).intValue();
        }
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = houseService.housePager(pager);
        houses = pager.getResults();
        buildings = buildingsService.randomBuilds(4);
        return "houseList";
    }

    public String list() {
        rows = new ArrayList<House>();
        Pager<House> pager = new Pager<House>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        if(buildingsId != null) {
            // 单个楼栋的户型
            Buildings buildings = new Buildings();
            buildings.setId(buildingsId);
            total = (int)houseService.count(buildings.getId());
            pager = houseService.listHouse(pager, buildings.getId());
            buildingsId = null;
        } else {
            // 单个经销商的所有户型
            Object obj = request.getSession().getAttribute("agency");
            if(obj != null) {
                Agency agency = (Agency)obj;
                total = (int)houseService.countHouse(agency.getId());
                pager = houseService.housePager(pager, agency.getId());
            }
            buildingsId = null;
        }
        rows = pager.getResults();
        return "list";
    }

    public String allHouse() {
        if(buildingsId != null) {
            houses = houseService.ListAll(buildingsId);
        }
        return "allHouse";
    }

    public String update() {
        House house1 = queryHouse();
        if(uploadFileName != null) {
            try {
                FileUtils.copyFile(upload, new File(FileUtil.uploadPath() + File.separator + uploadFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            house1.setLogo(Constants.UPLOADS + "/" + uploadFileName);
        }
        if(house.getName() == null || house.getName().trim().equals("")) {
            controllerResult = ControllerResult.getFailResult("名字不能为空");
            return "update";
        }
        house1.setName(house.getName());
        if(house.getArea() == 0) {
            controllerResult = ControllerResult.getFailResult("面积不能为空");
            return "update";
        }
        house1.setArea(house.getArea());
        if(house.getUnitPrice() == 0) {
            controllerResult = ControllerResult.getFailResult("单价不能为空");
            return "update";
        }
        house1.setUnitPrice(house.getUnitPrice());
        house1.setIntro(house.getIntro());
        houseService.update(house1);
        logger.info("户型修改");
        controllerResult = ControllerResult.getSuccessResult("更改成功");
        return "update";
    }

    public String updateStatus() {
        House house1 = queryHouse();
        house1.setStatus(status);
        houseService.updateStatus(house1);
        logger.info("修改户型状态");
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        return "updateStatus";
    }

    /**
     * 根据楼盘查询所有户型
     * @return
     */
    public String listByBuilds(){
        String buildsId = request.getParameter("buildsId");
        houses = houseService.listByBuildings(buildsId);
        return "listByBuilds";
    }
    public String addPage() {
        return "addPage";
    }

    public String listPage() {
        Object obj = request.getSession().getAttribute("admin");
        if(obj != null) {
            Admin admin = (Admin)obj;
            if(admin != null) {
                request.setAttribute("admins","admins");
            } else {
                request.setAttribute("agencys","agencys");
            }
        }
        return "listPage";
    }

    public String detail() {
        house = queryHouse();
        return "detail";
    }

    //前台户型图片分页
    public String moreHouseLogo() {
        String id = request.getParameter("buildingsId");
        Pager<House> pager = new Pager<House>();
        total = (int)houseService.count(id);
        totalPage = total % pageSize == 0 ? total / pageSize : (total / pageSize) + 1;
        if(page <= 1) {
            page = 1;
        }else if(page >= totalPage) {
            page = new Long(totalPage).intValue();
        }
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = houseService.listHouse(pager, id);
        houses = pager.getResults();
        request.setAttribute("buildingsId",id);
        return "moreHouseLogo";
    }

    private House queryHouse() {
        return houseService.getById(house.getId());
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }

    public void setHouseService(HouseService houseService) {
        this.houseService = houseService;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public List<House> getRows() {
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

    public List<House> getHouses() {
        return houses;
    }

    public long getTotalPage() {
        return totalPage;
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

    public void setHouses(List<House> houses) {
        this.houses = houses;
    }

    public List<Buildings> getBuildings() {
        return buildings;
    }

    public void setBuildingsService(BuildingsService buildingsService) {
        this.buildingsService = buildingsService;
    }

    public List<Search> getSearches() {
        return searches;
    }
}
