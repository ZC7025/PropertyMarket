package ht.controller;

import com.ht.bean.Buildings;
import com.ht.bean.Like;
import com.ht.bean.User;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.service.LikeService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by 7025 on 2017/9/11.
 */
public class LikeController extends ActionSupport implements ServletRequestAware {
    // 无
    private HttpServletRequest request;
    private final static Logger logger = Logger.getLogger(LikeController.class);//日志记录

    // get
    private ControllerResult controllerResult;
    private List<Like> rows;
    private int total;

    // set
    private LikeService likeService;
    private int offset;//第几条开始
    private int limit;//每页几行

    // get set
    private Like like;

    public String list() {
        Object obj = request.getSession().getAttribute("user");
        if(obj == null) {
            return "list";
        }
        User user =(User)obj;
        total = (int)likeService.countLike(user.getId());
        Pager<Like> pager = new Pager<Like>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        pager = likeService.listLike(pager, user.getId());
        rows = pager.getResults();
        return "list";
    }

    public String remove() {
        String tempStr = request.getParameter("tempStr");
        String[] ids = tempStr.split(",");
        List<Like> likes1 = new ArrayList<>();
        for(String id : ids) {
            Like like1 = new Like();
            like1.setId(id);
            likes1.add(like1);
        }
        likeService.remove(likes1);
        logger.info("用户批量删除点赞记录");
        controllerResult = ControllerResult.getSuccessResult("删除成功");
        return "remove";
    }

    /**
     * 点赞记录的添加或删除
     * @return
     */
    public String addOrDel() {
        Object obj = request.getSession().getAttribute("user");
        if(obj == null) {
            controllerResult = ControllerResult.getFailResult("失败");
            return "addOrDel";
        }
        User user = (User)obj;
        String buildsId = request.getParameter("buildsId");
        Like like1 = likeService.getLike(user.getId(),buildsId);
        if(like1 != null) {
            likeService.remove(like1);
            logger.info("用户取消点赞");
            controllerResult = ControllerResult.getSuccessResult("取消成功");
        } else {
            like1 = new Like();
            like1.setUser(user);
            Buildings buildings = new Buildings();
            buildings.setId(buildsId);
            like1.setBuildings(buildings);
            like1.setCreatedTime(Calendar.getInstance().getTime());
            likeService.save(like1);
            logger.info("用户点赞");
            controllerResult = ControllerResult.getSuccessResult("点赞成功");
        }
        return "addOrDel";
    }

    public String listPage() {
        return "listPage";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    public void setLikeService(LikeService likeService) {
        this.likeService = likeService;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public Like getLike() {
        return like;
    }

    public void setLike(Like like) {
        this.like = like;
    }

    public List<Like> getRows() {
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
}
