package ht.controller;

import com.ht.bean.Article;
import com.ht.common.Constants;
import com.ht.common.bean.ControllerResult;
import com.ht.common.bean.Pager;
import com.ht.common.util.FileUtil;
import com.ht.common.util.SpellUtil;
import com.ht.service.ArticleService;
import com.ht.vo.Search;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by sweet on 2017/8/31.
 */
public class ArticleController extends ActionSupport implements ServletRequestAware {

    private HttpServletRequest request;
    private ControllerResult controllerResult;//get
    private ArticleService articleService;//set

    private Article article;//get,set

    private List<Article> rows;//get
    private int total;//get
    private int offset;//第几条开始,set
    private int limit;//每页几行，set

    private File logo;//set
    private String logoFileName;//set

    private List<Article> articles;//get.set

    private int page = 1;//get,set
    private int pageSize = 6;//get,set
    private long totalPage;//get
    private List<Search> searches;

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

     public List<Article> getRows() {
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

    public void setLogo(File logo) {
        this.logo = logo;
    }

    public void setLogoFileName(String logoFileName) {
        this.logoFileName = logoFileName;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
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

    //跳转到添加页面
    public String addPage() {
       return "addPage";
    }

    //跳转到后台分页页面
    public String articlePager() {
        return "articlePager";
    }

    public String pager() {
        rows = new ArrayList<Article>();
        total = (int) articleService.count();
        Pager<Article> pager = new Pager<Article>();
        pager.setBeginIndex(offset);
        pager.setPageSize(limit);
        pager = articleService.listByPager(pager);
        rows = pager.getResults();
        return "pager";
    }

    public String search() {
        searches = articleService.getSearchList(request.getParameter("searchStr"));
        controllerResult = ControllerResult.getSuccessResult("搜索成功");
        return "search";
    }

    //把状态变为可用的方法
    public String beUsable() {
        Article article = new Article();
        String id = request.getParameter("id");
        article = articleService.getById(id);
        article.setStatus(1);
        articleService.update(article);
        controllerResult = ControllerResult.getSuccessResult("激活");
        return "beUsable";
    }

    //把状态变为不可用的方法
    public String beDisable() {
        Article article = new Article();
        String id = request.getParameter("id");
        article = articleService.getById(id);
        article.setStatus(0);
        articleService.update(article);
        controllerResult = ControllerResult.getSuccessResult("激活");
        return "beDisable";
    }

    public String addArticle() throws IOException {
        article.setCreatedTime(Calendar.getInstance().getTime());
        if(logoFileName != null){
            FileUtils.copyFile(logo, new File(FileUtil.uploadPath() + File.separator + logoFileName));
            article.setLogo(Constants.UPLOADS + "/" + logoFileName);
        }else{
            article.setLogo(article.getLogo());
        }
        article.setSpell(SpellUtil.getSpell(article.getTitle()));
        article.setStatus(Constants.ACTIVATION);
        articleService.save(article);
        controllerResult = ControllerResult.getSuccessResult("添加成功");
        return "addArticle";
    }

    public String upArticle() {
        Article article1 = new Article();
        String id = request.getParameter("id");
        article1 = articleService.getById(id);
        article1.setTitle(article.getTitle());
        article1.setContent(article.getContent());
        article1.setTitle(article.getTitle());
        article1.setAbstracts(article.getAbstracts());
        article1.setContent(article.getContent());
        article1.setCreatedTime(article1.getCreatedTime());
        article1.setArticleType(article.getArticleType());
        if(logo != null) {
            try {
                FileUtils.copyFile(logo, new File(FileUtil.uploadPath() + File.separator + logoFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            article1.setLogo(Constants.UPLOADS + "/" + logoFileName);
        }else{
            article1.setLogo(article1.getLogo());
        }
        articleService.update(article1);
        controllerResult = ControllerResult.getSuccessResult("修改成功");
        return "upArticle";
    }


    //前台分页
    public String listPager() {
        Pager<Article> pager = new Pager<Article>();
        total = (int)articleService.count();
        totalPage = total % pageSize == 0 ? total / pageSize : (total / pageSize) + 1;
        if(page <= 1) {
            page = 1;
        }else if(page >= totalPage) {
            page = new Long(totalPage).intValue();
        }
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = articleService.pager(pager);
        articles = pager.getResults();
        return "listPager";
    }

    public String personInfor() {
        String id = request.getParameter("id");
        article = articleService.getById(id);
        return "personInfor";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
