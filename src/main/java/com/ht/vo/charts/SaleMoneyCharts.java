package com.ht.vo.charts;

import java.util.List;

/**
 * Created by 7025 on 2017/9/13.
 */
public class SaleMoneyCharts {
    private List<HighchartsLine<Double>> series;
    private XAxis xAxis;// 图表的x轴

    public List<HighchartsLine<Double>> getSeries() {
        return series;
    }

    public void setSeries(List<HighchartsLine<Double>> series) {
        this.series = series;
    }

    public XAxis getxAxis() {
        return xAxis;
    }

    public void setxAxis(XAxis xAxis) {
        this.xAxis = xAxis;
    }
}
