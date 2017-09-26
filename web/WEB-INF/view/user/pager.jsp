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
    <div id="toolbar">
        <%--<button id="getButton" class="btn btn-default" onclick="show1()">修改</button>--%>
       <%-- <button id="removeButton" class="btn btn-default">删除</button>--%>
        <button id="beUsable" class="btn btn-primary" onclick="beUsable()">激活</button>
        <button id="beDisable" class="btn btn-warning" onclick="beDisable()">冻结</button>

    </div>
    <table id="table"
           data-toggle="table"
           data-show-columns="false"
           data-height="520"
           data-toolbar="#toolbar"
           data-click-to-select="false"
           data-cookie="true"
           data-cookie-id-table="saveId"
           data-pagination="true"
           data-search="false"
           data-url="<%=path%>/user/userPager";
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <%--<th data-field="id" data-checkbox="true">ID</th>--%>
            <th data-field="name" data-formatter=NullToString>名称</th>
            <th data-field="nickname" data-formatter=NullToString>昵称</th>
            <th data-field="gender" data-formatter=NullToString>性别</th>
            <th data-field="birthday"  data-formatter=formatDate>生日</th>
            <th data-field="email" >邮箱</th>
            <th data-field="phone" >手机号</th>
            <th data-field="qq" data-formatter=NullToString>QQ</th>
            <th data-field="wechat" data-formatter=NullToString>微信</th>
            <th data-field="status"  data-formatter=statusShow>状态</th>
        </tr>
        </thead>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="editWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="editForm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">名称</label>
                        <input type="text" class="form-control" id="name" >
                    </div>
                        <div class="form-group">
                            <label for="nickname">昵称</label>
                            <input type="text" class="form-control" id="nickname" >
                        </div>
                        <div class="form-group">
                            <label for="gender">性别</label>
                            <input type="text" class="form-control" id="gender" >
                        </div>
                        <div class="form-group">
                            <label for="birthday">生日</label>
                            <input type="date" class="form-control" id="birthday" >
                        </div>
                        <div class="form-group">
                            <label for="qq">QQ</label>
                            <input type="text" class="form-control" id="qq" >
                        </div>
                        <div class="form-group">
                            <label for="wechat">微信</label>
                            <input type="text" class="form-control" id="wechat" >
                        </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">保存</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path%>/plugins/sweet-alert/sweet-alert.min.js"></script>

<script src="<%=path%>/js/agency/agency.js"></script>
<script src="<%=path%>/js/user/user.js"></script>

</body>
</html>
