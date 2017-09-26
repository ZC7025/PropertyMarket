<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2017/8/31
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加客户</title>
    <%@include file="../master/style.inc.jsp"%>
    <link href="<%=path %>/plugins/layDate/laydate.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">添加客户</h3>
            <form id="addCustomer">
                <input type ="hidden" id="customer.agency.id" name="customer.agency.id" value="${sessionScope.agency.id}">
                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[2]]" id="name" name="customer.name" placeholder="请输入姓名" data-errormessage-value-missing="请输入姓名" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[11],maxSize[11]]" id="phone"  name="customer.phone" placeholder="请输入电话" data-errormessage-value-missing="请输入电话"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[6]]" id="email"  name="customer.email" placeholder="请输入邮箱" data-errormessage-value-missing="请输入邮箱"/>
                </div>
                <div class="form-group">
                    <label class="radio-inline">
                        <input type="radio" name="customer.gender" id="inlineRadio5" value="男" checked="true" > 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="customer.gender" id="inlineRadio6" value="女" > 女
                    </label>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control demo-input" id="birthday"  name="customer.birthday" placeholder="请选择生日" data-errormessage-value-missing="请选择生日"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[18],maxSize[18]]" id="identityId"  name="customer.identityId" placeholder="请输入身份证号码" data-errormessage-value-missing="请输入身份证号码"/>
                </div>

                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[5]]" id="address"  name="customer.address" placeholder="请输入联系地址" data-errormessage-value-missing="请输入联系地址"/>
                </div>

                <div class="form-group form-inline">
                    <label>客户类型：</label>
                    <select class="form-control" id="customerType" name="customer.customerType">
                        <option value="预约客户">预约客户</option>
                        <option value="意向客户">意向客户</option>
                        <option value="预定客户">预定客户</option>
                        <option value="购房客户">购房客户</option>
                    </select>
                </div>

                <div class="form-group form-inline">
                    <label>负责员工：</label>
                    <select class="form-control" id="employee" name="customer.employee.id">

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
<script src="<%=path %>/plugins/layDate/laydate.js"></script>
<script>
    $('#addCustomer').validationEngine({
        addPromptClass:'formError-white',
        autoHidePrompt:'true',
        autoHideDelay:10000,
        fadeDuration:0.3,
        promptPosition:'topRight',
        maxErrorsPerField:1,
        ajaxFormValidation:'true',
        ajaxFormValidationMethod:'post'
    });
    $(
        function () {
            $.post("/employee/listByAgencyID",
                $().serialize(),
                function (data) {
               for(i= 0;i < data.employees.length; i++){
                   $("#employee").append("<option value="+data.employees[i].id+">"+data.employees[i].name+"</option>");
               }

                }, "json"
            );
        }
    );

    function add() {
        validate('#addCustomer');
        if($('#addCustomer').validationEngine('validate')) {
            $.post("/customer/add",
                $("#addCustomer").serialize(),
                function (data) {
                    if (data.controllerResult.result == 'success') {
                        swal(data.controllerResult.message,"","success");
                        $(":text").val("");
                    } else {
                        swal(data.controllerResult.message),"","error";
                    }
                }, "json"
            );
        }

    }

    var nowDate = new Date();
    var dateStr = nowDate.getFullYear() + '-' + (nowDate.getMonth()+1) + '-' + nowDate.getDate();
    //限定可选日期
    var ins22 = laydate.render({
        elem: '#birthday'
        , min: '1949-01-01'
        ,max: dateStr
        ,ready: function(){
            ins22.hint('日期可选值设定在 <br> '+ '  1949-01-01 到'+ dateStr );
        }
    });
</script>
</body>
</html>
