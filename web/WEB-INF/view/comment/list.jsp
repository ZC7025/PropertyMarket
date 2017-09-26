<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/30
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>评价列表</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/examples.css">
    <link rel="stylesheet" href="<%=path %>/plugins/sweet-alert/sweet-alert.css"/>
</head>
<body>
<div>
    <div id="toolbar">
        <a href="<%=path %>/builds/listPage" class="btn btn-primary">楼盘列表</a>
        <button class="btn btn-danger" onclick="remove();">删除</button>
    </div>
    <table id="table"
           data-toggle="table"
           data-show-columns="false"
           data-toolbar="#toolbar"
           data-height="520"
           data-click-to-select="true"
           data-cookie="true"
           data-cookie-id-table="saveId"
           data-pagination="true"
           data-search="false"
           data-url="<%=path%>/comment/list"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-checkbox="true"></th>
            <th data-field="id" data-visible="false"></th>
            <th data-field="buildings.name">楼盘名称</th>
            <th data-field="content">评价内容</th>
            <th data-field="commentTime" data-formatter="formatDate">评价时间</th>
            <th data-field="user.name">用户名</th>
        </tr>
        </thead>
    </table>
</div>
</body>
<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path %>/js/main.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script>
    function remove() {
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length === 1){
            $.post(contextPath + "/comment/remove",
                {"comment.id": select[0].id },
                function (data) {
                    if (data.controllerResult.result === 'success') {
                        swal("删除成功","", "success");
                        $("#table").bootstrapTable('refresh');
                    } else {
                        swal(data.controllerResult.message, "", "error");
                    }
                }, "json"
            );
        }else{
            swal("请选中一行！","","warning");
        }
    }
</script>
</html>
