/**
 * 一月到十二月的json数组
 * @type {[*]}
 */
var monthArray = ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'];
/**
 * 周一到周日的json数组
 * @type {[*]}
 */
var weekArray = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];

/**
 * highcharts折线图通用方法
 * @param id DOM节点id，如div中的id属性
 * @param data 绘图的数据，json格式
 * @param title 图表标题
 * @param subtitle 子标题
 * @param unit 单位，如：月薪/元
 * @param subunit 子单位 如：元
 * @param xArray x轴坐标，json数组
 */
function polylineCommon(id, data, title, subtitle, unit, subunit, xArray) {
    new Highcharts.Chart(id, {
        // 图表的标题
        title: {
            text: title,
            x: -20
        },
        // 子标题
        subtitle: {
            text: subtitle,
            x: -20
        },
        xAxis: {
            categories: xArray // x轴坐标
        },
        yAxis: {
            title: {
                text: unit // 单位，如：月薪/元
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: subunit // 子单位 如：元
        },
        // 图例
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        // 数据
        series: data
    });
}

/**
 *  highcharts柱状图通用方法
 * @param id DOM节点id，如div中的id属性
 * @param data 绘图的数据，json格式
 * @param title 图表标题
 * @param subtitle 子标题
 * @param unit 单位，如：月薪/元
 * @param subunit 提示单位
 * @param xArray x轴坐标，json数组
 */
function columnCommon(id, data, title, subtitle, unit, subunit, xArray) {
    $('#' + id).highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: title // 图表标题
        },
        subtitle: {
            text: subtitle // 子标题
        },
        xAxis: {
            categories: xArray, // x轴坐标
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: unit // 单位，如：月薪/元
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f}' + subunit + '</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: data // 绘图数据
    });
}

/**
 * highcharts饼图通用方法
 * @param id DOM节点id，如div中的id属性
 * @param data 绘图的数据，json格式
 * @param title 图表标题
 * @param prompt 提示内容
 */
function pieCommon(id, data, title, prompt) {
    $('#'+ id).highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: title // 图表标题
        },
        tooltip: {
            headerFormat: '{series.name}<br>',
            pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            type: 'pie',
            name: prompt, // 提示内容
            data: data // 绘图数据
        }]
    });
}