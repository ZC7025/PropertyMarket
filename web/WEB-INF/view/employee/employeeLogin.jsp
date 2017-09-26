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
    <title>员工登录</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
    <script>

    </script>
</head>
<body>
<div class="container">
    <div class="row" style="margin-top: 100px;">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">员工登录</h3>
            <%--<h4><span id="loginFail" style="color:red">${requestScope.loginFail }</span></h4>--%>
            <form id="employeeLogin" method="post">
                <div class="form-group">
                    <input type="text" class="form-control validate[required] " id="name" name="phoneOrEmail" placeholder="请输入手机号或者邮箱">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control validate[required]" id="password" name="employee.pwd" placeholder="请输入登录密码">
                </div>
                <input type="button" value="登录" class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" onclick="employeeLogin();"/>
                <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="<%=path %>/" style="margin-top:15px;">返回首页</a>
            </form>
        </div>
    </div>
</div>
</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="<%=path %>/js/employee/login.js"></script>
<script>
    $('#employeeLogin').validationEngine({
        addPromptClass:'formError-white',
        autoHidePrompt:'true',
        autoHideDelay:10000,
        fadeDuration:0.3,
        promptPosition:'topRight',
        maxErrorsPerField:1,
        ajaxFormValidation:'true',
        ajaxFormValidationMethod:'post'
    });
</script>
</html>
