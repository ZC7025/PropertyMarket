<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/28
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
</head>
<body>
<div class="container">
    <div class="row" style="margin-top: 100px;">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">修改密码</h3>
            <form id="updatePwd">
                <div>
                    <div class="form-group">
                        <input type="hidden" id="id" name="agency.id" value="${sessionScope.agency.id }"/>
                        <input type="hidden" id="phone" name="agency.phone" value="${sessionScope.agency.phone }"/>
                    </div>
                    <div class="form-group">
                        <input type="password" class="pwd form-control validate[required,minSize[6],maxSize[30]]" id="pwd" name="agency.pwd" placeholder="请输入原密码" data-errormessage-value-missing="请输入原密码" />
                    </div>
                    <div class="form-group">
                        <input type="password" class="pwd form-control validate[required,minSize[6],maxSize[30]]" id="password" name="password" placeholder="请输入新密码" data-errormessage-value-missing="请输入新密码" />
                    </div>
                    <div class="form-group">
                        <input type="password" class="pwd form-control validate[required,minSize[6],maxSize[30],equals[password]]" placeholder="请输入确认密码" data-errormessage-value-missing="请输入确认密码" />
                    </div>
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="updatePwd();">修改</a>
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
