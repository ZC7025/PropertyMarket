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
    <link rel="stylesheet" href="<%=path%>/plugins/sweet-alert/sweet-alert.css">

</head>
<body>
<div>
    <%--<h1>Cookie</h1>
    <div id="toolbar">
        <button id="getButton" class="btn btn-default" onclick="show1()">修改</button>
        <button id="removeButton" class="btn btn-default">删除</button>

    </div>--%>
    <div>
        <div id="toolbar">
            <input type="button" name="id"  class="btn btn-primary" value="审核" onclick="dealCheck()"/>
        </div>
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
           data-url="<%=path%>/agency/uncheck";
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <%--<th data-field="id" data-checkbox="true">ID</th>--%>
            <th data-field="name" >经销商名称</th>
            <th data-field="email" >邮箱</th>
            <th data-field="leader" >负责人</th>
            <th data-field="phone" >手机号</th>
            <th data-field="tel" >固定电话</th>
            <th data-field="address" >地址</th>
            <th data-field="intro" >简介</th>
            <th data-field="createdTime"  data-formatter=formatDate>创建时间</th>
            <th data-field="checked_status" data-formatter=showStatus>状态</th>
        </tr>
        </thead>

    </table>
</div>
<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path%>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path%>/js/agency/agency.js"></script>
</body>
</html>
