<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/24
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
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
    <title>经销商注册</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
</head>
<body>
<div class="container">
    <div class="row" style="margin-left: 85%;margin-top:30px">
        <label>已有账号？<a href="<%=path %>/agency/loginPage" class="btn btn-primary">立即登录</a></label>
</div>
    <div class="row">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">经销商注册</h3>
            <form id="reg">
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[chinese],maxSize[25]]" id="name" name="agency.name" placeholder="请输入登录名" data-errormessage-value-missing="请输入登录名" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[email]]" id="email" name="agency.email" placeholder="请输入邮箱" data-errormessage-value-missing="请输入邮箱" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,maxSize[20]]" id="leader" name="agency.leader" placeholder="请输入负责人姓名" data-errormessage-value-missing="请输入负责人姓名" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,maxSize[50]]" id="address" name="agency.address" placeholder="请输入地址" data-errormessage-value-missing="请输入地址" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control validate[required,minSize[6],maxSize[30]]" id="pwd" name="agency.pwd" placeholder="请输入登录密码" data-errormessage-value-missing="请输入登录密码" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control validate[required,equals[pwd],minSize[6],maxSize[30]]" id="pwdConfirm" name="pwdConfirm" placeholder="请输入确认密码" data-errormessage-value-missing="请输入确认密码" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[phone],minSize[11],maxSize[11]]" id="phone" name="agency.phone" placeholder="请输入手机号" data-errormessage-value-missing="请输入手机号" />
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control validate[required,maxSize[6],custom[integer],minSize[6]]" id="validate" name="validate" placeholder="请输入短信验证码" data-errormessage-value-missing="请输入短信验证码" onblur="checkCode();"/>
                    <input type="button" class="form-control" value="点击免费获取手机验证码" onclick="authCode();" />
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control validate[required],custom[onlyLetterNumber]" id="code" name="code" placeholder="请输入验证码" data-errormessage-value-missing="请输入验证码" />
                    <image src="<%=path%>/code/code" onclick="changeImg(this);" />
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="reg();">登录</a>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="<%=path %>/" style="margin-top:15px;">返回首页</a>
        </div>
    </div>
</div>
</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="<%=path %>/js/common/checkCode.js"></script>
<script src="<%=path %>/js/agency/agency.js"></script>
<script>
    function authCode() {
        if($("#phone").val() == null || $("#phone").val() ==""){
            swal("请输入手机号！","","warning");
        }else{
            var phone = $("#phone").val();
            $.post("/agency/authCode?phone="+phone,
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
            $.post("agency/checkCode?validate="+validate,
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

