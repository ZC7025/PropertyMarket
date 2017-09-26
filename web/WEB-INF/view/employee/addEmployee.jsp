<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2017/8/28
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>添加员工</title>
    <%@include file="../master/style.inc.jsp"%>
    <link href="<%=path %>/plugins/layDate/laydate.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">添加员工</h3>
            <form id="addEmployee">
                <input type ="hidden" id="employee.agency.id" name="employee.agency.id" value="${sessionScope.agency.id}">
                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[2]]" id="name" name="employee.name" placeholder="请输入姓名" data-errormessage-value-missing="请输入姓名" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[11],maxSize[11]]" id="phone"  name="employee.phone" placeholder="请输入电话" data-errormessage-value-missing="请输入电话"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[6]]" id="email"  name="employee.email" placeholder="请输入邮箱" data-errormessage-value-missing="请输入邮箱"/>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control validate[required,minSize[6]]" id="pwd"  name="employee.pwd" placeholder="请输入登录密码" data-errormessage-value-missing="请输入登录密码"/>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control validate[required,minSize[6] equals[pwd]]" id="conpwd"  name="pwd" placeholder="请再次输入登录密码" data-errormessage-value-missing="请再次输入登录密码"/>
                </div>

                <div class="form-group">
                    <label class="radio-inline">
                        <input type="radio" name="employee.gender" id="inlineRadio5" value="男" checked > 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="employee.gender" id="inlineRadio6" value="女" > 女
                    </label>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[2]]" id="exp"  name="employee.exp" placeholder="工作经验" data-errormessage-value-missing="请输入工作经验或工作描述"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[3]]" id="basicSalary"  name="employee.basicSalary" placeholder="请输入基础工资" data-errormessage-value-missing="请输入基础工资"/>
                </div>
                <div class="form-group form-inline">
                    <label>负责楼盘：</label>
                    <select class="form-control" id="buildingsid" name="employee.buildings.id">

                    </select>
                </div>

            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="add();">添加</a>
        </div>
    </div>
</div>

<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script>
    $('#addEmployee').validationEngine({
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
    function add() {
        validate('#addEmployee');
        if($('#addEmployee').validationEngine('validate')) {
            $.post("/employee/add",
                $("#addEmployee").serialize(),
                function (data) {
                    if (data.controllerResult.result == 'success') {
                        swal(data.controllerResult.message,"","success");
                        $(":text").val("");
                        $(":password").val("");
                    } else {
                        swal(data.controllerResult.message);
                    }
                }, "json"
            );
        }
    }

    $(function () {
        $.post("/builds/listByAgencyID",
            $(),
            function (data) {
            for(var i= 0 ;i<data.buildingss.length;i++){
                $("#buildingsid").append("<option value="+data.buildingss[i].id+">"+data.buildingss[i].name+"</option>");
            }
            }, "json"
        );
    })
</script>
</body>
</html>
