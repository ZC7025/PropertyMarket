<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>楼盘销售量统计图表</title>
    <%@ include file="../master/style.inc.jsp"%>
</head>
<body>
    <c:if test="${requestScope.seeType == 'unhidden'}">
        <a href="<%=path %>/employee/allEmployeePage" class="btn btn-primary">返回列表</a>
    </c:if>
    <input type="hidden" name="id" value="${requestScope.empId }" id="id" >

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
        $.post("<%=path %>/sale/empCharts?id="+ $("#id").val(),
            function (data) {
                polylineCommon("line", data.empSaleCount.series, "楼盘销售量统计图表", "近7周数据", "间/周", "间", data.empSaleCount.xAxis.categories);
                columnCommon("column", data.empSaleCount.series, "楼盘销售量统计图表", "近7周数据", "间/周", "间", data.empSaleCount.xAxis.categories);
            }, "json"
        );
    });
</script>
</html>
