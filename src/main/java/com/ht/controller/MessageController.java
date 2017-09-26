package com.ht.controller;

import com.ht.bean.Agency;
import com.ht.bean.Buildings;
import com.ht.bean.Message;
import com.ht.bean.User;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.service.MessageService;
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
public class MessageController extends ActionSupport implements ServletRequestAware {

    // 无
    private HttpServletRequest request;
    private final static Logger logger = Logger.getLogger(AdminController.class);//日志记录

    // set
    private MessageService messageService;
    private int offset;//第几条开始
    private int limit;//每页几行

    // get
    private ControllerResult controllerResult;
    private List<Message> rows;
    private int total;
    private long totalPage;

    //get set
    private Message message;
    private String buildingsId;
    private List<Message> messages;
    private int page = 1;
    private int pageSize = 6;

    public String add() {
        Object obj = request.getSession().getAttribute("user");
        if(obj == null) {
            controllerResult = ControllerResult.getFailResult("未登录用户账号");
            return "add";
        }
        User user = (User)obj;
        message.setUser(user);
        Agency agency = new Agency();
        agency.setId(request.getParameter("agencyId"));
        message.setAgency(agency);
        Buildings buildings = new Buildings();
        buildings.setId(buildingsId);
        message.setBuildings(buildings);
        message.setLeaveTime(Calendar.getInstance().getTime());
        if(message.getReply() != null) {
            message.setReply(null);
        }
        messageService.save(message);
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        logger.info("用户添加留言");
        return "add";
    }

    /**
     * 前台留言显示
     * @return
     */
    public String frontList() {
        Pager<Message> pager = new Pager<Message>();
        total = (int)messageService.frontCount(buildingsId);
        totalPage = total % pageSize == 0 ? total / pageSize : (total / pageSize) + 1;
        if(page <= 1) {
            page = 1;
        }else if(page >= totalPage) {
            page = new Long(totalPage).intValue();
        }
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = messageService.frontMsg(pager, buildingsId);
        messages = pager.getResults();
        controllerResult = ControllerResult.getSuccessResult("留言列表");
        return "frontList";
    }

    public String list() {
        rows = new ArrayList<Message>();
        Pager<Message> pager = new Pager<Message>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        if(buildingsId != null) {
            // 单个楼盘内的留言
            total = (int) messageService.count(buildingsId);
            pager = messageService.listByPager(pager, buildingsId);
            buildingsId = null;
        } else {
            // 单个经销商内的留言
            Object obj = request.getSession().getAttribute("agency");
            if(obj != null) {
                Agency agency = (Agency)obj;
                total = (int) messageService.countMsg(agency.getId());
                pager = messageService.listMsg(pager, agency.getId());
                buildingsId = null;
            }
        }
        rows = pager.getResults();
        controllerResult = ControllerResult.getSuccessResult("留言列表");
        logger.info("留言列表");
        return "list";
    }

    public String userList() {
        rows = new ArrayList<Message>();
        Pager<Message> pager = new Pager<Message>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        Object obj = request.getSession().getAttribute("user");
        if(obj != null) {
            User user =(User)obj;
            total = (int) messageService.countUserMsg(user.getId());
            pager = messageService.listUserMsg(pager, user.getId());
            rows = pager.getResults();
            controllerResult = ControllerResult.getSuccessResult("留言列表");
            logger.info("留言列表");
        }
        return "userList";
    }

    public String update() {
        Message message1 = getMsg();
        message1.setContent(message.getContent());
        message1.setReply(null);
        message1.setReplyTime(null);
        messageService.update(message1);
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        logger.info("用户修改留言");
        return "update";
    }

    public String reply() {
        Message message1 = getMsg();
        message1.setReply(message.getReply());
        message1.setReplyTime(Calendar.getInstance().getTime());
        messageService.update(message1);
        controllerResult = ControllerResult.getSuccessResult("回复成功");
        logger.info("经销商回复留言");
        return "reply";
    }

    public String remove() {
        messageService.remove(message);
        controllerResult = ControllerResult.getSuccessResult("删除成功");
        logger.info("经销商删除留言");
        return "remove";
    }

    public String listPage() {
        return "listPage";
    }

    public String userListPage() {
        return "userListPage";
    }

    private Message getMsg() {
        return messageService.getById(message.getId());
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public List<Message> getRows() {
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

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
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
}
