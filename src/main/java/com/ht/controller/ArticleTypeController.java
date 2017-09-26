package com.ht.controller;

import com.ht.bean.ArticleType;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.service.ArticleTypeService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by sweet on 2017/9/1.
 */
public class ArticleTypeController extends ActionSupport implements ServletRequestAware {

    private HttpServletRequest request;
    private ArticleTypeService articleTypeService;//set
    private ControllerResult controllerResult;//get

    private ArticleType articleType;//get,set

    private List<ArticleType> rows;//get
    private int total;//get
    private int offset;//第几条开始,set
    private int limit;//每页几行，set

    private List<ArticleType> articleTypes;//get


    public ArticleType getArticleType() {
        return articleType;
    }

    public void setArticleType(ArticleType articleType) {
        this.articleType = articleType;
    }

    public void setArticleTypeService(ArticleTypeService articleTypeService) {
        this.articleTypeService = articleTypeService;
    }

    public List<ArticleType> getRows() {
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

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public List<ArticleType> getArticleTypes() {
        return articleTypes;
    }

    //跳转到添加文章类型页面
    public String addPage() {
        return "addPage";
    }

    //跳转到管理员的文章分页文章类型页面
    public String articleTypePager() {
        return "articleTypePager";
    }

    //管理员后台分页文章类型
    public String pager() {
        rows = new ArrayList<ArticleType>();
        total = (int)articleTypeService.count();
        Pager<ArticleType> pager = new Pager<ArticleType>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        pager = articleTypeService.listByPager(pager);
        rows = pager.getResults();
        return "pager";
    }

    //把状态变为可用的方法
    public String beUsable() {
        ArticleType articleType = new ArticleType();
        String id = request.getParameter("id");
        articleType = articleTypeService.getById(id);
        articleType.setStatus(1);
        articleTypeService.update(articleType);
        controllerResult = ControllerResult.getSuccessResult("激活");
        return "beUsable";
    }

    //把状态变为不可用的方法
    public String beDisable() {
        ArticleType articleType = new ArticleType();
        String id = request.getParameter("id");
        articleType = articleTypeService.getById(id);
        articleType.setStatus(0);
        articleTypeService.update(articleType);
        controllerResult = ControllerResult.getSuccessResult("激活");
        return "beDisable";
    }

    //修改
    public String adminUpType() {
        ArticleType articleType1 = new ArticleType();
        String id = request.getParameter("id");
        articleType1 = articleTypeService.getById(id);
        articleType1.setName(articleType.getName());
        articleType1.setDes(articleType.getDes());
        articleTypeService.update(articleType1);
        return "adminUpType";
    }

    //添加
    public String addType() {
        ArticleType articleType1 = new ArticleType();
        articleType1.setName(articleType.getName());
        articleType1.setDes(articleType.getDes());
        articleTypeService.save(articleType1);
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        return "addType";
    }

    public String allType() {
        articleTypes = articleTypeService.all();
        return "allType";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
