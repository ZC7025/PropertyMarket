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
    <title>留言列表</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/examples.css">
    <link rel="stylesheet" href="<%=path %>/plugins/sweet-alert/sweet-alert.css"/>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
</head>
<body>
<div>
    <div id="toolbar">
        <button class="btn btn-primary" onclick="show1();">修改留言</button>
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
           data-url="<%=path%>/message/userList"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-checkbox="true"></th>
            <th data-field="id" data-visible="false"></th>
            <th data-field="buildings.id" data-visible="false"></th>
            <th data-field="buildings.name">楼盘名称</th>
            <th data-field="content">留言内容</th>
            <th data-field="leaveTime" data-formatter="formatDate">留言时间</th>
            <th data-field="reply">回复</th>
            <th data-field="replyTime" data-formatter="formatDate">回复时间</th>
        </tr>
        </thead>
    </table>
</div>
<!-- Modal -->
<div class="modal fade" id="editWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="update">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改留言</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="content">留言内容</label>
                        <input type="text" class="form-control validate[required]" name="message.content" id="content" >
                        <input type="hidden" class="form-control" name="message.id" id="id" >
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="javascript:void(0);" type="button" class="btn btn-default" data-dismiss="modal">关闭</a>
                    <a href="javascript:void(0);" type="button" class="btn btn-primary" onclick="update();">保存</a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path %>/js/main.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path%>/js/message/message.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
</html>
