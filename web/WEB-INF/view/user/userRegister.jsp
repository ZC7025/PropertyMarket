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
    <title>用户注册</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
</head>
<body>
<div class="container">
    <div class="row" style="margin-left: 85%;margin-top:30px">
        <label>已有账号？<a href="<%=path %>/user/userLoginPage" class="btn btn-primary">立即登录</a></label>
    </div>
    <div class="row" style="margin-top: 100px;">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">用户注册</h3>
            <h4><span id="registerFail" style="color:red">${requestScope.loginFail }</span></h4>
            <form id="userRegister">
                <div class="form-group">
                    <input type="text" class="form-control validate[required] validate[custom[phone],maxSize[11]]" id="phone" name="user.phone" placeholder="请输入手机号" data-errormessage-value-missing="请输入手机号" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required] validate[custom[email]]" id="email" name="user.email" placeholder="请输入邮箱" data-errormessage-value-missing="请输入邮箱" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control validate[required,,minSize[6]]" id="pwd" name="user.pwd" placeholder="请输入登录密码" data-errormessage-value-missing="请输入密码"/>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control validate[required,equals[pwd]]" id="pwdConfirm" name="pwdConfirm" placeholder="请输入确认密码" data-errormessage-value-missing="请输入确认密码" />
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control validate[required,maxSize[6],custom[integer]]" id="validate" name="validate" placeholder="请输入短信验证码" data-errormessage-value-missing="请输入短信验证码" onblur="checkCode();"/>
                    <input type="button" class="form-control" value="点击免费获取手机验证码" onclick="authCode();" />
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="register();">注册</a>
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
    $('#userRegister').validationEngine({
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
    function register() {
        validate('#userRegister');
        if($('#userRegister').validationEngine('validate')) {
            $.post("/user/register",
                $("#userRegister").serialize(),
                function (data) {
                    if (data.controllerResult.result == 'success') {
                        swal(data.controllerResult.message,"","success");
                        $(":text").val("");
                        $(":password").val("");
                    } else {
                        swal(data.controllerResult.message,"","error");
                    }
                }, "json"
            );
        }
    }

    function authCode() {
        if($("#phone").val() == null || $("#phone").val() ==""){
            swal("请输入手机号！","","warning");
        }else{
            var phone = $("#phone").val();
            $.post("/user/authCode?phone="+phone,
                function(data) {
                    if(data.controllerResult.result == 'success'){
                        swal("发送成功","请于3分钟内输入验证","success");
                    }else{
                        swal("发送失败","","error");
                    }
                }
            );
        }
    }

    function checkCode() {
        var validate = $("#validate").val();
        if(validate != null && validate != ''){
            $.post("user/checkCode?validate="+validate,
                function(data) {
                    if(data.controllerResult.result == 'success'){

                    }else{
                        swal(data.controllerResult.message);
                        $("input[name='validate']").val("").focus();
                    }
                }
            );
        }
    }
</script>

</html>
