package ht.controller;

import com.ht.bean.Ads;
import com.ht.common.Constants;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.common.util.FileUtil;
import com.ht.service.AdsService;
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
 * Created by sweet on 2017/9/4.
 */
public class AdsController extends ActionSupport implements ServletRequestAware {

    private HttpServletRequest request;
    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录

    private AdsService adsService;//set
    private ControllerResult controllerResult;//get

    private List<Ads> rows;//get
    private int total;//get
    private int offset;//第几条开始,set
    private int limit;//每页几行，set

    private Ads ads;//get,set

    private File logo;//set
    private String logoFileName;//set

    public void setAdsService(AdsService adsService) {
        this.adsService = adsService;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public List<Ads> getRows() {
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

    public Ads getAds() {
        return ads;
    }

    public void setAds(Ads ads) {
        this.ads = ads;
    }

    public void setLogo(File logo) {
        this.logo = logo;
    }

    public void setLogoFileName(String logoFileName) {
        this.logoFileName = logoFileName;
    }

    //跳转到添加广告页面
    public String addPage() {
        return "addPage";
    }

    //跳转到后台广告分页页面
    public String adsPager() {
        return "adsPager";
    }

    public String pager() {
        rows = new ArrayList<Ads>();
        total = (int)adsService.count();
        Pager<Ads> pager = new Pager<Ads>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        pager = adsService.listByPager(pager);
        rows = pager.getResults();
        return "pager";
    }

    //把状态变为可用的方法
    public String beUsable() {
        Ads ads = new Ads();
        String id = request.getParameter("id");
        String showOrder = request.getParameter("showOrder");
        long orders = adsService.checkedStatus(showOrder);
        if(orders > 0) {
            controllerResult = ControllerResult.getFailResult("已有广告显示");
            return "beUsable";
        }
        ads = adsService.getById(id);
        ads.setShowStatus(1);
        adsService.update(ads);
        controllerResult = ControllerResult.getSuccessResult("显示");
        return "beUsable";
    }

    //把状态变为不可用的方法
    public String beDisable() {
        Ads ads = new Ads();
        String id = request.getParameter("id");
        ads = adsService.getById(id);
        ads.setShowStatus(0);
        adsService.update(ads);
        controllerResult = ControllerResult.getSuccessResult("隐藏");
        return "beDisable";
    }

    //更新
    public String upAds() {
        Ads ads1 = new Ads();
        String id = request.getParameter("id");
        ads1 = adsService.getById(id);
        ads1.setTitle(ads.getTitle());
        ads1.setContent(ads.getContent());
        ads1.setAdUrl(ads.getAdUrl());
        ads1.setShowOrder(ads.getShowOrder());
        ads1.setCreatedTime(ads1.getCreatedTime());
        if(logo != null) {
            try {
                FileUtils.copyFile(logo, new File(FileUtil.uploadPath() + File.separator + logoFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            ads1.setLogo(Constants.UPLOADS + "/" + logoFileName);
        }else{
            ads1.setLogo(ads1.getLogo());
        }
        ads1.setShowStatus(0);
        adsService.update(ads1);
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        return "upAds";
    }

    public String addAds() throws IOException {
        Ads ads1 = new Ads();
        ads1.setTitle(ads.getTitle());
        ads1.setContent(ads.getContent());
        ads1.setCreatedTime(Calendar.getInstance().getTime());
        ads1.setAdUrl(ads.getAdUrl());
        ads1.setShowOrder(ads.getShowOrder());
        if(logoFileName != null){
            FileUtils.copyFile(logo, new File(FileUtil.uploadPath() + File.separator + logoFileName));
            ads1.setLogo(Constants.UPLOADS + "/" + logoFileName);
        }else{
            ads1.setLogo(null);
        }

        ads1.setStatus(1);
        ads1.setShowStatus(0);
        adsService.save(ads1);
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        return "addAds";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
