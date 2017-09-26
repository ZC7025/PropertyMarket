package com.ht.controller;

import com.ht.bean.History;
import com.ht.bean.User;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.service.HistoryService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 7025 on 2017/9/11.
 */
public class HistoryController extends ActionSupport implements ServletRequestAware {
    // 无
    private HttpServletRequest request;
    private final static Logger logger = Logger.getLogger(HistoryController.class);//日志记录

    // get
    private ControllerResult controllerResult;
    private List<History> rows;
    private int total;

    // set
    private HistoryService historyService;
    private int offset;//第几条开始
    private int limit;//每页几行

    // get set
    private History history;

    public String list() {
        Object obj = request.getSession().getAttribute("user");
        if(obj != null) {
            User user =(User)obj;
            total = (int)historyService.countHistory(user.getId());
            Pager<History> pager = new Pager<History>();
            pager.setBeginIndex(offset);
            pager.setPageSize(limit);
            pager = historyService.listByPager(pager, user.getId());
            rows = pager.getResults();
        }
        return "list";
    }

    public String remove() {
        String tempStr = request.getParameter("tempStr");
        String[] ids = tempStr.split(",");
        List<History> histories1 = new ArrayList<>();
        for(String id : ids) {
            History history1 = new History();
            history1.setId(id);
            histories1.add(history1);
        }
        historyService.remove(histories1);
        logger.info("用户批量删除浏览记录");
        controllerResult = ControllerResult.getSuccessResult("删除成功");
        return "remove";
    }

    public String listPage() {
        return "listPage";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    public void setHistoryService(HistoryService historyService) {
        this.historyService = historyService;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public History getHistory() {
        return history;
    }

    public void setHistory(History history) {
        this.history = history;
    }

    public List<History> getRows() {
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
