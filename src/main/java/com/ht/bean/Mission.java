package com.ht.bean;

/**
 * Created by sweet on 2017/8/23.
 */
public class Mission {

    private String id;//	varchar(36)	编号,UUID，主键
    private Integer quantity;//	int	员工任务量
    private String monthes;//	int	月份
    private double bonusPercent;//	double	销售提成百分比

    private Employee employee;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getMonthes() {
        return monthes;
    }

    public void setMonthes(String monthes) {
        this.monthes = monthes;
    }

    public double getBonusPercent() {
        return bonusPercent;
    }

    public void setBonusPercent(double bonusPercent) {
        this.bonusPercent = bonusPercent;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public String toString() {
        return "Mission{" +
                "id='" + id + '\'' +
                ", quantity='" + quantity + '\'' +
                ", monthes=" + monthes +
                ", bonusPercent=" + bonusPercent +
                '}';
    }
}
