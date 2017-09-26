package com.ht.controller;

import com.ht.bean.Agency;
import com.ht.bean.Buildings;
import com.ht.bean.Comment;
import com.ht.bean.User;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.service.CommentService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by 7025 on 2017/9/5.
 */
public class CommentController extends ActionSupport implements ServletRequestAware {

    // 无
    private HttpServletRequest request;
    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录

    // set
    private CommentService commentService;
    private int offset;//第几条开始
    private int limit;//每页几行

    // get
    private ControllerResult controllerResult;
    private List<Comment> rows;
    private int total;
    private long totalPage;

    //get set
    private Comment comment;
    private String buildingsId;
    private List<Comment> comments;
    private int page = 1;
    private int pageSize = 6;

    public String add() {
        Object obj = request.getSession().getAttribute("user");
        if(obj == null) {
            controllerResult = ControllerResult.getFailResult("添加失败");
            return "add";
        }
        comment.setUser((User)obj);
        Agency agency = new Agency();
        agency.setId(request.getParameter("agencyId"));
        comment.setAgency(agency);
        Buildings buildings = new Buildings();
        buildings.setId(buildingsId);
        comment.setBuildings(buildings);
        comment.setCommentTime(Calendar.getInstance().getTime());
        commentService.save(comment);
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        logger.info("用户添加评价");
        return "add";
    }


    /**
     * 前台留言显示
     * @return
     */
    public String frontList() {
        Pager<Comment> pager = new Pager<Comment>();
        total = (int)commentService.frontCount(buildingsId);
        totalPage = total % pageSize == 0 ? total / pageSize : (total / pageSize) + 1;
        if(page <= 1) {
            page = 1;
        }else if(page >= totalPage) {
            page = new Long(totalPage).intValue();
        }
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = commentService.frontComm(pager, buildingsId);
        comments = pager.getResults();
        controllerResult = ControllerResult.getSuccessResult("评论列表");
        return "frontList";
    }

    public String list() {
        rows = new ArrayList<Comment>();
        Pager<Comment> pager = new Pager<Comment>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        if(buildingsId != null) {
            // 单个楼盘内的评价
            total = (int) commentService.count(buildingsId);
            pager = commentService.listByPager(pager, buildingsId);
            buildingsId = null;
        } else {
            // 单个经销商内的评价
            Object obj = request.getSession().getAttribute("agency");
            if(obj != null) {
                Agency agency = (Agency)obj;
                total = (int) commentService.countComm(agency.getId());
                pager = commentService.listComm(pager, agency.getId());
            }
            buildingsId = null;
        }
        rows = pager.getResults();
        controllerResult = ControllerResult.getSuccessResult("评价列表");
        logger.info("评价列表");
        return "list";
    }

    public String userList() {
        rows = new ArrayList<Comment>();
        Pager<Comment> pager = new Pager<Comment>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        Object obj = request.getSession().getAttribute("user");
        if(obj == null) {
            controllerResult = ControllerResult.getFailResult("加载失败");
            return "userList";
        }
        User user =(User)obj;
        total = (int) commentService.countUserComm(user.getId());
        pager = commentService.listUserComm(pager, user.getId());
        rows = pager.getResults();
        controllerResult = ControllerResult.getSuccessResult("评价列表");
        logger.info("评价列表");
        return "userList";
    }

    public String update() {
        Comment comment1 = commentService.getById(comment.getId());
        comment1.setContent(comment.getContent());
        commentService.update(comment1);
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        logger.info("用户修改评价");
        return "update";
    }

    public String remove() {
        commentService.remove(comment);
        controllerResult = ControllerResult.getSuccessResult("删除成功");
        logger.info("经销商删除评价");
        return "remove";
    }

    public String listPage() {
        return "listPage";
    }

    public String userListPage() {
        return "userListPage";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public List<Comment> getRows() {
        return rows;
    }

    public int getTotal() {
        return total;
    }

    public String getBuildingsId() {
        return buildingsId;
    }

    public void setBuildingsId(String buildingsId) {
        this.buildingsId = buildingsId;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
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
}
