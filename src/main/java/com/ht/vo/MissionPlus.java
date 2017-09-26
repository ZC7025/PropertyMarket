package com.ht.vo;

import com.ht.bean.Mission;

public class MissionPlus extends Mission {

    private Double lastSalary;//最终工资

    private Integer saleCount;//完成了多少个任务

    public Double getLastSalary() {
        return lastSalary;
    }

    public void setLastSalary(Double lastSalary) {
        this.lastSalary = lastSalary;
    }

    public Integer getSaleCount() {
        return saleCount;
    }

    public void setSaleCount(Integer saleCount) {
        this.saleCount = saleCount;
    }
}
