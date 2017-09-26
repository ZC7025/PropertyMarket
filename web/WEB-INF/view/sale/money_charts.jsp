<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/9/13
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>楼盘售价统计图表</title>
    <%@ include file="../master/style.inc.jsp"%>
</head>
<body>
    <a href="<%=path %>/builds/listPage" class="btn btn-primary">楼盘列表</a>

    <input type="hidden" name="id" value="${requestScope.buildingsId }" id="id" >

    <div id="line" style="width: 100%;height: 500px"></div>
    <br />
    <div id="column" style="width: 100%;height: 500px"></div>
</body>
<%@ include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/highcharts/highcharts.js"></script>
<script src="<%=path %>/plugins/highcharts/exporting.js"></script>
<script src="<%=path %>/plugins/highcharts/highcharts-zh_CN.js"></script>

<script src="<%=path %>/js/common/charts.js"></script>
<script>

    $(function () {
        $.post("<%=path %>/sale/saleMoney?buildingsId="+ $("#id").val(),
            function (data) {
                polylineCommon("line", data.saleMoneyCharts.series, "楼盘销售价统计图表", "近7周数据", "元/周", "元", data.saleMoneyCharts.xAxis.categories);
                columnCommon("column", data.saleMoneyCharts.series, "楼盘销售价统计图表", "近7周数据", "元/周", "元", data.saleMoneyCharts.xAxis.categories);
            }, "json"
        );
    });
</script>
</html>
