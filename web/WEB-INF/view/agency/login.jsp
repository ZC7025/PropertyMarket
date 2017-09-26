<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/24
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>经销商登录</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />

</head>
<body>
<div class="container">
    <div class="row" style="margin-left: 85%;margin-top:30px">
        <label>没有账号？<a href="<%=path %>/agency/regPage" class="btn btn-primary">立即注册</a></label>
    </div>
    <div class="row" style="margin-top: 80px;">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">经销商登录</h3>
            <form id="login">
                <div class="form-group">
                    <input type="text" class="form-control validate[required]" id="common" name="common" placeholder="请使用登录名/手机号/邮箱登录" data-errormessage-value-missing="请使用登录名/手机号/邮箱" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control validate[required,minSize[6]]" id="password" name="agency.pwd" placeholder="请输入登录密码" data-errormessage-value-missing="请输入登录密码" />
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="login();">登录</a>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="<%=path %>/" style="margin-top:15px;">返回首页</a>
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
