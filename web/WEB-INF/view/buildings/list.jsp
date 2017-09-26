<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/30
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title></title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/examples.css">
    <link rel="stylesheet" href="<%=path %>/plugins/sweet-alert/sweet-alert.css"/>
    <link rel="stylesheet" href="<%=path%>/plugins/layer/skin/default/layer.css">
</head>
<body>
<div>
    <div id="toolbar">
        <button id="getButton" class="btn btn-primary" onclick="show()">修改</button>
        <button class="btn btn-primary" onclick="addBuild()">添加楼栋</button>
        <button class="btn btn-primary" onclick="addHouse()">添加户型</button>
        <button class="btn btn-primary" onclick="addImgPage()">添加图片</button>
        <button class="btn btn-primary" onclick="addActivity()">添加活动</button>
        <button id="active" class="btn btn-primary" onclick="updateStatus(1);">激活</button>
        <button id="free" class="btn btn-warning" onclick="updateStatus(0);">冻结</button>
        <br />
        <button class="btn btn-primary" onclick="detail();">查看详情</button>
        <button class="btn btn-primary" onclick="viewImg()">查看图片</button>
        <button class="btn btn-primary" onclick="listBuild()">查看楼栋</button>
        <button class="btn btn-primary" onclick="listHouse()">查看户型</button>
        <button class="btn btn-primary" onclick="countCharts()">查看销售统计</button>
        <button class="btn btn-primary" onclick="saleCharts()">查看售价统计</button>
        <button class="btn btn-primary" onclick="listMsg()">查看留言</button>
        <button class="btn btn-primary" onclick="listComment()">查看评价</button>
    </div>
    <table id="table"
           data-toggle="table"
           data-show-columns="false"
           data-height="520"
           data-toolbar="#toolbar"
           data-click-to-select="true"
           data-cookie="true"
           data-cookie-id-table="saveId"
           data-pagination="true"
           data-search="false"
           data-url="<%=path%>/builds/list"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-checkbox="true"></th>
            <th data-field="id" data-visible="false"></th>
            <th data-field="name">楼盘名称</th>
            <th data-field="area">所属区域</th>
            <th data-field="address">地址</th>
            <th data-field="floorArea">占地面积</th>
            <th data-field="buildingArea">建筑面积</th>
            <th data-field="houseType">房源类型</th>
            <th data-field="buildingType">建筑类型</th>
            <%--<th data-field="longitude">经度</th>
            <th data-field="latitude">纬度</th>--%>
            <th data-field="avgPrice">楼盘均价</th>
            <th data-field="company">开发公司</th>
            <th data-field="openDate" data-formatter="formatDate">开盘时间</th>
            <th data-field="totalRooms">总套数</th>
            <th data-field="receptionAddress">接待地址</th>
            <th data-field="tel">售楼部电话</th>
            <%--<th data-field="greenRatio">绿化率</th>
            <th data-field="plotRatio">容积率</th>--%>
            <th data-field="propertyCompany">物业公司</th>
           <%-- <th data-field="propertyFee">物业费</th>--%>
            <th data-field="carStation">车位数</th>
            <%--<th data-field="traffic">交通状况</th>--%>
            <th data-field="equipments">周边配套</th>
            <th data-field="intro">简介</th>
            <th data-field="status" data-formatter="formatStatus">状态</th>
            <th data-field="createdTime" data-formatter="formatDate">创建时间</th>
        </tr>
        </thead>
    </table>
</div>

</body>
<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path %>/js/main.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>
<script src="<%=path %>/plugins/layer/layer.js"></script>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path %>/js/buildings/buildings.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script>
    function detail() {
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length === 1){
            layer.open({
                type: 2,
                title: '楼盘详情',
                shadeClose: true,
                shade: false,
                maxmin: true,
                area: ['1000px', '450px'],
                content: '/builds/personInfo?id='+select[0].id
            });
        } else {
            swal("请选中一行！","","warning");
        }
    }
</script>
</html>
