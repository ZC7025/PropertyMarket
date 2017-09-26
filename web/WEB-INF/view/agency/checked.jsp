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

    <link rel="stylesheet" href="<%=path%>/plugins/layer/skin/default/layer.css">
    <link rel="stylesheet" href="<%=path%>/plugins/sweet-alert/sweet-alert.css">

</head>
<body>
<div>
    <div id="toolbar">
        <button class="btn btn-primary" onclick="detail()">查看详情</button>
        <button id="getButton" class="btn btn-primary" onclick="show1()">修改</button>
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
           data-url="<%=path%>/agency/check"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="name" >经销商名称</th>
            <th data-field="email" >邮箱</th>
            <th data-field="leader" >负责人</th>
            <th data-field="phone" >手机号</th>
            <th data-field="tel" >固定电话</th>
            <th data-field="address" >地址</th>
            <th data-field="intro" >简介</th>
            <th data-field="createdTime"  data-formatter=formatDate>创建时间</th>
            <th data-field="status"  data-formatter=statusShow>状态</th>
        </tr>
        </thead>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="editWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="editForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label for="leader">经销商名称:</label>
                        <input type="text" name="agency.name" class="form-control" id="name" >
                    </div>
                    <div class="form-group">
                        <label for="leader">负责人</label>
                        <input type="text" name="agency.leader" class="form-control" id="leader" >
                    </div>
                    <div class="form-group">
                        <label for="address">地址</label>
                        <input type="text" name="agency.address" class="form-control" id="address" >
                    </div>
                    <div class="form-group">
                        <label for="intro">简介</label>
                        <input type="text" name="agency.intro" class="form-control" id="intro" >
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="adminUpAgency();">保存</button>
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
<script src="<%=path %>/plugins/layer/layer.js"></script>

<script src="<%=path%>/js/agency/agency.js"></script>
<script src="<%=path%>/js/agency/checked.js"></script>

</body>
</html>
