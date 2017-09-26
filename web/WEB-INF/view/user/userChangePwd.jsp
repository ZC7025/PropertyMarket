<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2017/8/26
  Time: 11:07
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
        <div class="row">
            <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12" style="margin-top: 50px;">
                <h3 class="text-center">修改密码</h3>
                <form id="changePwd">

                        <div class="form-group">
                            <input type="hidden" class="form-control" id="id" name="user.id"  value="${sessionScope.user.id}"/>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control validate[required,minSize[6]]" id="pwd" name="user.pwd" placeholder="请输入原密码" data-errormessage-value-missing="请输入原密码" />
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control validate[required,minSize[6]] " id="newpwd"  name="newPwd" placeholder="请输入新密码" data-errormessage-value-missing="请输入新密码"/>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control validate[required,minSize[6],equals[newpwd]] " id="connewpwd"  name="conNewPwd" placeholder="请再次输入新密码" data-errormessage-value-missing="请再次输入新密码"/>
                        </div>
                    <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="changePwd();">修改</a>
                </form>
            </div>
        </div>
    </div>
    <%@include file="../master/script.inc.jsp"%>
    <script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
    <script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
    <script src="<%=path %>/js/common/validationEngine.js"></script>
    <script>
        $('#changePwd').validationEngine({
            addPromptClass:'formError-white',
            autoHidePrompt:'true',
            autoHideDelay:10000,
            fadeDuration:0.3,
            promptPosition:'topRight',
            maxErrorsPerField:1,
            ajaxFormValidation:'true',
            ajaxFormValidationMethod:'post'
        });

       function changePwd() {
           validate('#changePwd');
           if ($('#changePwd').validationEngine('validate')) {
               $.post("/user/userChangePwd",
                   $("#changePwd").serialize(),
                   function (data) {
                       if (data.controllerResult.result == 'success') {
                           swal(data.controllerResult.message, "", "success");
                           $(":text").val("");
                           $(":password").val("");
                       } else {
                           swal(data.controllerResult.message, "", "error");
                       }
                   }, "json"
               );
           }
        }
    </script>
</body>
</html>
