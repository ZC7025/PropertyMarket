<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/28
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>楼栋添加</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
</head>
<body>
<div class="container">
    <div class="row" style="margin-left:5%;margin-top:30px">
        <a href="<%=path %>/builds/listPage" class="btn btn-primary">返回列表</a>
    </div>
    <div class="row">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">楼栋添加</h3>
            <form id="add">
                <div class="form-group">
                    <input type="text" class="form-control validate[required]" name="building.name" placeholder="请输入楼栋名" data-errormessage-value-missing="请输入楼栋名" />
                    <input type="hidden" id="id" name="buildingsId" value="${requestScope.buildingsId }"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[integer],min[0]]" id="totalFloor" name="building.totalFloor" placeholder="请输入总层数" data-errormessage-value-missing="请输入总层数" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[integer],min[0]]" name="building.totalLift" placeholder="请输入电梯数" data-errormessage-value-missing="请输入电梯数" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[integer],min[0]]" id="floorRooms" name="building.floorRooms" placeholder="请输入每层户数" data-errormessage-value-missing="请输入每层户数" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="totalRoom" name="building.totalRoom" placeholder="总户数" readonly />
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="add();">添加</a>
        </div>
    </div>
</div>
</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>

<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="<%=path %>/js/building/building.js"></script>
</html>
