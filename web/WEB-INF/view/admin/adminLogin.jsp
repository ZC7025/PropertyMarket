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
    <title>管理员登录</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
</head>
<body>
<div class="container">
    <div class="row" style="margin-top: 100px;">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">管理员登录</h3>
            <%--<h4><span id="loginFail" style="color:red">${requestScope.loginFail }</span></h4>--%>
            <form id="adminLogin" method="post">
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[phone]]" id="name" name="admin.phone" placeholder="请输入手机号">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control validate[required]" id="password" name="admin.pwd" placeholder="请输入登录密码">
                </div>
                <input type="button" value="登录" class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" onclick="adminLogin();"/>
                <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="<%=path %>/home/homePager" style="margin-top:15px;">返回首页</a>
            </form>
        </div>
    </div>
</div>
</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path %>/js/common/validationEngine.js"></script>
<%--<script src="<%=path %>/js/admin/agency.js"></script>--%>
<script src="<%=path %>/js/admin/login.js"></script>
<script>
    $('#adminLogin').validationEngine({
        addPromptClass:'formError-white',
        autoHidePrompt:'true',
        autoHideDelay:10000,
        fadeDuration:0.3,
        promptPosition:'topLeft',
        maxErrorsPerField:1,
        ajaxFormValidation:'true',
        ajaxFormValidationMethod:'post'
    });
</script>
</html>
