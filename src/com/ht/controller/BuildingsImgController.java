package ht.controller;

import com.ht.bean.BuildingsImg;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.service.BuildingsImgService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.json.annotations.JSON;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by sweet on 2017/9/14.
 */
public class BuildingsImgController extends ActionSupport implements ServletRequestAware {

    // 无
    private HttpServletRequest request;
    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录

    private BuildingsImgService buildingsImgService;//set

    // get
    private ControllerResult controllerResult;

    private BuildingsImg buildingsImg;//get,set

    private List<BuildingsImg> buildingsImgs;//get,set
    private int page = 1;//get,set
    private int pageSize = 6;//get,set
    private long totalPage;//get
    private int total;//get

    public ControllerResult getControllerResult() {
        return controllerResult;
    }


    @JSON(serialize=false)
    public BuildingsImg getBuildingsImg() {
        return buildingsImg;
    }

    public void setBuildingsImg(BuildingsImg buildingsImg) {
        this.buildingsImg = buildingsImg;
    }

    public void setBuildingsImgService(BuildingsImgService buildingsImgService) {
        this.buildingsImgService = buildingsImgService;
    }
    @JSON(serialize=false)
    public List<BuildingsImg> getBuildingsImgs() {
        return buildingsImgs;
    }

    public void setBuildingsImgs(List<BuildingsImg> buildingsImgs) {
        this.buildingsImgs = buildingsImgs;
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

    public int getTotal() {
        return total;
    }

    //跳转到后台楼盘图片分页页面
    public String viewImg() {
        String id = request.getParameter("buildingsId");
        Pager<BuildingsImg> pager = new Pager<BuildingsImg>();
        total = (int)buildingsImgService.count(id);
        totalPage = total % pageSize == 0 ? total / pageSize : (total / pageSize) + 1;
        if(page <= 1) {
            page = 1;
        }else if(page >= totalPage) {
            page = new Long(totalPage).intValue();
        }
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = buildingsImgService.listByPager(pager, id);
        buildingsImgs = pager.getResults();
        request.setAttribute("buildingsId",id);
        return "viewImg";
    }

    /**
     * 删除楼盘的照片
     * @return
     */
    public String delImg(){
        String imgId = request.getParameter("imgId");
        BuildingsImg buildingsImg = new BuildingsImg();
        buildingsImg.setId(imgId);
        buildingsImgService.remove(buildingsImg);
        controllerResult = ControllerResult.getSuccessResult("删除成功");
        logger.info("删除了一张楼盘照片");
        return "delImg";
    }
    //跳转到前台楼盘图片分页页面
    public String moreImg() {
        String id = request.getParameter("buildingsId");
        Pager<BuildingsImg> pager = new Pager<BuildingsImg>();
        total = (int)buildingsImgService.count(id);
        totalPage = total % pageSize == 0 ? total / pageSize : (total / pageSize) + 1;
        if(page <= 1) {
            page = 1;
        }else if(page >= totalPage) {
            page = new Long(totalPage).intValue();
        }
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = buildingsImgService.listByPager(pager, id);
        buildingsImgs = pager.getResults();
        request.setAttribute("buildingsId",id);
        return "moreImg";
    }


    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
