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
    <title>楼栋列表</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/examples.css">
    <link rel="stylesheet" href="<%=path %>/plugins/sweet-alert/sweet-alert.css"/>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
    <link rel="stylesheet" href="<%=path%>/plugins/layer/skin/default/layer.css">
</head>
<body>
<div>
    <div id="toolbar">
        <a href="<%=path %>/builds/listPage" class="btn btn-primary">楼盘列表</a>
        <button id="getButton" class="btn btn-primary" onclick="show();">修改</button>
        <button class="btn btn-primary" onclick="room();">生成房号</button>
        <button class="btn btn-primary" onclick="roomPage();">房屋销售图表</button>
        <button id="active" class="btn btn-primary" onclick="updateStatus(1);">激活</button>
        <button id="free" class="btn btn-warning" onclick="updateStatus(0);">冻结</button>
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
           data-url="<%=path%>/build/listBuild"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-checkbox="true"></th>
            <th data-field="id" data-visible="false"></th>
            <th data-field="buildings.id" data-visible="false"></th>
            <th data-field="name">楼栋名称</th>
            <th data-field="totalFloor">总层数</th>
            <th data-field="totalLift">电梯数</th>
            <th data-field="floorRooms">每层户数</th>
            <th data-field="totalRoom">总户数</th>
            <th data-field="buildings.name">所属楼盘</th>
            <th data-field="status" data-formatter="formatStatus">状态</th>
            <th data-field="createdTime" data-formatter="formatDate">创建时间</th>
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
                    <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">楼栋名称</label>
                        <input type="text" class="form-control validate[required]" name="building.name" id="name" >
                        <input type="hidden" class="form-control" name="building.id" id="id" >
                    </div>
                    <div class="form-group">
                        <label for="totalFloor">总层数</label>
                        <input type="text" class="form-control validate[required,custom[number],min[0]]" name="building.totalFloor" id="totalFloor" >
                    </div>
                    <div class="form-group">
                        <label for="totalLift">电梯数</label>
                        <input type="text" class="form-control validate[required,custom[number],min[0]]" name="building.totalLift" id="totalLift" >
                    </div>
                    <div class="form-group">
                        <label for="floorRooms">每层户数</label>
                        <input type="text" class="form-control validate[required,custom[number],min[0]]" name="building.floorRooms" id="floorRooms" >
                    </div>
                    <div class="form-group">
                        <label for="totalRoom">总户数</label>
                        <input type="text" class="form-control validate[required,custom[number],min[0]]" name="building.totalRoom" id="totalRoom" readonly >
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
<!-- Modal -->
<div class="modal fade" id="addWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="addRoom">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">生成房号</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">楼栋名称</label>
                        <input type="text" class="form-control" id="names" readonly>
                        <input type="hidden" class="form-control" name="building.id" id="ids" >
                        <input type="hidden" class="form-control" name="buildingsId" id="buildingsId" >
                    </div>
                    <div class="form-group">
                        <label for="totalFloor">总层数</label>
                        <input type="text" class="form-control validate[required] custom[number]" name="building.totalFloor" id="totalFloors" readonly>
                    </div>
                    <div class="form-group">
                        <label for="floorRooms">每层户数</label>
                        <input type="text" class="form-control validate[required] custom[number]" name="building.floorRooms" id="floorRoomss" readonly>
                    </div>
                    <div class="form-group">
                        <label for="totalRoom">总户数</label>
                        <input type="text" class="form-control validate[required] custom[number]" name="building.totalRoom" id="totalRooms" readonly >
                    </div>
                    <div id="houseType" class="form-group">
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="javascript:void(0);" type="button" class="btn btn-default" data-dismiss="modal">关闭</a>
                    <a href="javascript:void(0);" type="button" class="btn btn-primary" data-dismiss="modal" onclick="addRoom();">保存</a>
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
<script src="<%=path %>/plugins/layer/layer.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="<%=path%>/js/building/building.js"></script>
</html>
