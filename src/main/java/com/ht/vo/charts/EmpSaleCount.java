package com.ht.vo.charts;

import java.util.List;

/**
 * Created by 7025 on 2017/9/13.
 */
public class EmpSaleCount {
    private List<HighchartsLine<Integer>> series;
    private XAxis xAxis;// 图表的x轴

    public List<HighchartsLine<Integer>> getSeries() {
        return series;
    }

    public void setSeries(List<HighchartsLine<Integer>> series) {
        this.series = series;
    }

    public XAxis getxAxis() {
        return xAxis;
    }

    public void setxAxis(XAxis xAxis) {
        this.xAxis = xAxis;
    }
}
