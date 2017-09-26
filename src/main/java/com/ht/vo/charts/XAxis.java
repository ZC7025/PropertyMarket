package com.ht.vo.charts;

import java.util.Arrays;

/**
 * Created by 7025 on 2017/9/13.
 */
public class XAxis {
    private String[] categories;

    public String[] getCategories() {
        return categories;
    }

    public void setCategories(String[] categories) {
        this.categories = categories;
    }

    @Override
    public String toString() {
        return "XAxis{" +
                "categories=" + Arrays.toString(categories) +
                '}';
    }
}
