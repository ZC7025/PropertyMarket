<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/9/11
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>历史记录列表</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/examples.css">
    <link rel="stylesheet" href="<%=path %>/plugins/sweet-alert/sweet-alert.css"/>
</head>
<body>
<div>
    <div id="toolbar">
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
           data-url="<%=path%>/history/list"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-checkbox="true"></th>
            <th data-field="id" data-visible="false"></th>
            <th data-field="buildings.id" data-visible="false"></th>
            <th data-field="buildings.name">浏览楼盘</th>
            <th data-field="buildings.address">楼盘地址</th>
            <th data-field="buildings.tel">固定电话</th>
            <th data-field="createdTime" data-formatter="formatDate">浏览时间</th>
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
        var tempStr = '';
        if(select.length > 0){
            for(var i = 0; i<select.length; i++) {
                tempStr += select[i].id +",";
            }
            $.post(contextPath + "/history/remove",
                {"tempStr": tempStr},
                function (data) {
                    if (data.controllerResult.result === 'success') {
                        swal("删除成功", "", "success");
                        $("#table").bootstrapTable('refresh');
                    } else {
                        swal(data.controllerResult.message, "", "error");
                    }
                }, "json"
            );
        }else{
            swal("请选中一行或多行！","","warning");
        }
    }
</script>
</html>
