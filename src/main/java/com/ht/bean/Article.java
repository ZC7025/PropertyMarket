package com.ht.bean;

import java.util.Date;

/**
 * Created by sweet on 2017/8/23.
 */
public class Article {

    private String id;//	varchar(36)	编号,UUID，主键
    private String title;//	varchar(50)	文章标题,not null
    private String abstracts;//	varchar(100)	文章摘要,not null
    private String content;//	text	文章内容，not null
    private String logo;//	varchar(500)	文章图片路径
    private Date createdTime;	//datetime	创建时间
    private int status;//	tinyint	状态，激活或冻结
    private String spell;//	varchar(100)	处理搜索的拼音

    private ArticleType articleType;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAbstracts() {
        return abstracts;
    }

    public void setAbstracts(String abstracts) {
        this.abstracts = abstracts;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getSpell() {
        return spell;
    }

    public void setSpell(String spell) {
        this.spell = spell;
    }

    public ArticleType getArticleType() {
        return articleType;
    }

    public void setArticleType(ArticleType articleType) {
        this.articleType = articleType;
    }

    @Override
    public String toString() {
        return "ArticleService{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", abstracts='" + abstracts + '\'' +
                ", content='" + content + '\'' +
                ", logo='" + logo + '\'' +
                ", createdTime=" + createdTime +
                ", status=" + status +
                ", spell='" + spell + '\'' +
                '}';
    }
}
