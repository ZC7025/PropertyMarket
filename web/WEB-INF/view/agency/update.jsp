<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/27
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
</head>
<body>
<div class="container">
    <div class="row" style="margin-top: 100px;">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">修改信息</h3>
            <form id="update">
                <input type="hidden" name="agency.id" value="${sessionScope.agency.id }"/>
                <div>
                    <div class="form-inline form-group">
                        <label>名称 :${sessionScope.agency.name }</label>
                    </div>
                    <div class="form-inline form-group">
                        <label>邮箱 :${sessionScope.agency.email }</label>
                    </div>
                    <div class="form-inline form-group">
                        <label>手机号 :${sessionScope.agency.phone }</label>
                    </div>
                    <div class="form-inline form-group">
                        <label>负责人 &nbsp;&nbsp;&nbsp;&nbsp;:</label>
                        <input class="form-control validate[required]" name="agency.leader" value="${sessionScope.agency.leader }"/>
                    </div>
                    <div class="form-inline form-group">
                        <label>固定电话 :</label>
                        <input class="form-control validate[required,minSize[7],maxSize[11],custom[number]]" name="agency.tel" value="${sessionScope.agency.tel }"/>
                    </div>
                    <div class="form-inline form-group">
                        <label>地&nbsp;&nbsp;&nbsp;&nbsp;址&nbsp;&nbsp;&nbsp;&nbsp; :</label>
                        <input class="form-control" name="agency.address" value="${sessionScope.agency.address }"/>
                    </div>
                    <div class="form-inline form-group">
                        <label>简&nbsp;&nbsp;&nbsp;&nbsp;介&nbsp;&nbsp;&nbsp;&nbsp;:</label>
                        <textarea class="form-control" style="resize: vertical;" name="agency.intro">${sessionScope.agency.intro }</textarea>
                    </div>
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="update();">修改</a>
        </div>
    </div>
</div>
</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="<%=path %>/js/agency/agency.js"></script>
</html>
