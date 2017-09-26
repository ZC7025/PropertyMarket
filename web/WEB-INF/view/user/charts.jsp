<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/9/13
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>用户量统计图表</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body>
    <div id="line" style="width: 100%;height: 500px"></div>
    <br />
    <div id="column" style="width: 100%;height: 500px"></div>
</body>
<script src="<%=path %>/plugins/jquery.min.js"></script>
<script src="<%=path %>/plugins/highcharts/highcharts.js"></script>
<script src="<%=path %>/plugins/highcharts/exporting.js"></script>
<script src="<%=path %>/plugins/highcharts/highcharts-zh_CN.js"></script>

<script src="<%=path %>/js/common/charts.js"></script>
<script>

    $(function () {
        $.get("<%=path %>/user/charts",
            function (data) {
                polylineCommon("line", data.userChartsData.series, "用户数量统计图表", "近7周数据", "人数/周", "人", data.userChartsData.xAxis.categories);
                columnCommon("column", data.userChartsData.series, "用户数量统计图表", "近7周数据", "人数/周", "人", data.userChartsData.xAxis.categories);
            }, "json"
        );
    });
</script>
</html>
