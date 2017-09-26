package com.ht.common.bean;

import java.util.List;

/**
 * Created by 7025 on 2017-8-22.
 */
public class Pager<T> {

    private int page;
    private int pageSize;
    private int beginIndex;


    private int total;
    private List<T> results;

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

    public int getBeginIndex() {
        return beginIndex;
    }

    public void setBeginIndex(int beginIndex) {
        this.beginIndex = beginIndex;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getResults() {
        return results;
    }

    public void setResults(List<T> results) {
        this.results = results;
    }

    public int startIndex(){
        return (page - 1)*pageSize;
    }

}
