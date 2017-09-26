package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

import java.util.Set;

/**
 * Created by sweet on 2017/8/23.
 */
public class ArticleType {

    private String id;//	varchar(36)	编号,UUID，主键
    private String name;//	varchar(50)	类别名称，uniquue,not null
    private String des;//	varchar(500)	类别描述
    private int status;

    private Set<Article> articles;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @JSON(serialize = false)
    public Set<Article> getArticles() {
        return articles;
    }

    public void setArticles(Set<Article> articles) {
        this.articles = articles;
    }

    @Override
    public String toString() {
        return "ArticleType{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", des='" + des + '\'' +
                '}';
    }
}
