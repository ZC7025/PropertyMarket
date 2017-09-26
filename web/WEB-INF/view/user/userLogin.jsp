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
    <title>用户登录</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
</head>
<body>
<div class="container">
    <div class="row" style="margin-left: 85%;margin-top:30px">
        <label>没有账号？<a href="<%=path %>/user/userRegisterPage" class="btn btn-primary">立即注册</a></label>
    </div>
    <div class="row" style="margin-top: 100px;">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">用户登录</h3>
            <form id="login">
                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[10],maxSize[30]]" id="phoneOrEmail" name="phoneOrEmail" placeholder="请使用手机号/邮箱登录" data-errormessage-value-missing="请输入手机号或邮箱" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control validate[required,minSize[6]]" id="pwd"  name="user.pwd" placeholder="请输入登录密码" data-errormessage-value-missing="请输入密码"/>
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

<script>
    $('#login').validationEngine({
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
<script>
    function login() {
        validate('#login');
        if($('#login').validationEngine('validate')) {
            $.post("/user/login",
                $("#login").serialize(),
                function (data) {
                    if (data.controllerResult.result == 'success') {
                        window.location = "/home/homePager"
                    } else {
                        swal(data.controllerResult.message,"","error");
                    }
                }, "json"
            );
        }
    }
</script>
</html>
