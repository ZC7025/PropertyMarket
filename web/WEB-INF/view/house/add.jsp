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
    <title>添加户型</title>
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
            <h3 class="text-center">添加户型</h3>
            <form id="add">
                <div class="form-group">
                    <input type="text" class="form-control validate[required]" name="house.name" placeholder="请输入户型名" data-errormessage-value-missing="请输入户型名" />
                    <input type="hidden" name="buildingsId" value="${requestScope.buildingsId }"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[number],min[0]]" name="house.area" placeholder="请输入面积" data-errormessage-value-missing="请输入面积" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[number],min[0]]" name="house.unitPrice" placeholder="请输入参考单价" data-errormessage-value-missing="请输入参考单价" />
                </div>
                <div class="form-group">
                    <textarea type="text" class="form-control" name="house.intro" placeholder="请输入简介"></textarea>
                </div>
                <div class="form-group form-inline">
                    <label>户型图：</label>
                    <input type="file" class="form-control" name="upload" />
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="add();">添加</a>
        </div>
    </div>
</div>
</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jQuery.form.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>

<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="<%=path %>/js/house/house.js"></script>
</html>
