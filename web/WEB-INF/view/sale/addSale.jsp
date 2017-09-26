<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2017/9/4
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加销售记录</title>
    <%@include file="../master/style.inc.jsp"%>
    <link href="<%=path %>/plugins/layDate/laydate.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">添加销售记录</h3>
            <form id="addSale">
                <input type ="hidden" id="employee.agency.id" name="sale.employee.id" value="${sessionScope.employee.id}">
                <div class="form-group form-inline">
                    <label>客户:</label>
                    <select class="form-control" id="customer" name="sale.customer.id" style="width: 415px;">

                    </select>
                </div>
                <div class="form-group form-inline" >
                    <label>楼栋:</label>
                    <select class="form-control" id="building" style="width: 415px;">

                    </select>
                </div>
                <div class="form-group form-inline">
                    <label>楼层:</label>
                    <select class="form-control validate[required]" style="width: 415px;" id="floor" name="floor" data-errormessage-value-missing="请选择楼层">

                    </select>
                </div>
                <div class="form-group form-inline">
                    <label>房号:</label>
                    <select class="form-control validate[required]" style="width: 415px;" id="room" name="roomId" data-errormessage-value-missing="请选择选择房屋">

                    </select>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required] demo-input" id="birthday"  name="sale.saleTime" placeholder="请选择销售时间" data-errormessage-value-missing="请选择销售时间"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required] validate[custom[number],min[0],max[1]]" id="discount"  name="sale.discount" placeholder="请输入销售折扣(0-1的小数)" data-errormessage-value-missing="请输入销售折扣"/>
                </div>

                <div class="form-group">
                    <input type="text" class="form-control " id="totalCost"  name="sale.totalCost" placeholder="销售总价"readonly/>
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
    $('#addSale').validationEngine({
        addPromptClass:'formError-white',
        autoHidePrompt:'true',
        autoHideDelay:10000,
        fadeDuration:0.3,
        promptPosition:'topRight',
        maxErrorsPerField:1,
        ajaxFormValidation:'true',
        ajaxFormValidationMethod:'post'
    });

    $(function () {
        $.post("/customer/listBuyCustomerByEmployee",
            function (data) {
                for(i=0;i<data.rows.length;i++){
                    $("#customer").append("<option value="+data.rows[i].id+">"+data.rows[i].name+"</option>");
                }
            }, "json"
        );

        $.post("/build/listBuildingByEmployee",
            function (data) {
                for(i=0;i<data.rows.length;i++){
                    $("#building").append("<option value="+data.rows[i].id+">"+data.rows[i].name+"</option>");
                }
            }, "json"
        );



    });

    $("#building").blur(
        function(){
            $.post("/build/countFloor",
                {"id":$("#building").children('option:selected').val()},
                function (data) {
                    $("#floor").empty();
                    for(i=0;i<data.floor;i++){
                        var floor = i+1;
                        $("#floor").append("<option value="+floor+">"+"第"+floor+"层"+"</option>");
                    }
                }, "json"
            )
        }
    )

    $("#floor").blur(
        function(){
            $.post("/room/listByBuild",
                {"id":$("#building").children('option:selected').val(),"floor":$("#floor").children('option:selected').val()},
                function (data) {
                    $("#room").empty();
                    for(i=0;i<data.rooms.length;i++){
                        var floor = i+1;
                        $("#room").append("<option value="+data.rooms[i].id+">"+data.rooms[i].name+"</option>");
                    }
                }, "json"
            )
        }
    )

    $("#discount").change(
        function(){
            $.post("/room/countTotalCost",
                {"id":$("#room").children('option:selected').val(),"discount":$("#discount").val()},
                function (data) {
                    $("#totalCost").empty();
                        var floor = i+1;
                        $("#totalCost").val(data.totalCost);
                }, "json"
            )
        }
    )

    var nowDate = new Date();
    var dateStr = nowDate.getFullYear() + '-' + (nowDate.getMonth()+1) + '-' + nowDate.getDate();
    //限定可选日期
    var ins22 = laydate.render({
        elem: '#birthday'
        , min: '2010-01-01'
        ,max: dateStr
        ,ready: function(){
            ins22.hint('日期可选值设定在 <br> '+ '  2010-01-01到'+ dateStr );
        }
    });

    function add() {
        validate('#addSale');
        if($('#addSale').validationEngine('validate')) {
            $.post("/sale/add",
                $("#addSale").serialize(),
                function (data) {
                    if (data.controllerResult.result == 'success') {
                        $(":text").val("");
                        $(":file").val("");
                        $("#floor").html("");
                        $("#room").html("");
                        swal(data.controllerResult.message,"","success");
                    } else {
                        swal(data.controllerResult.message,"","error");
                    }
                }, "json"
            );
        }

    }
</script>
</body>
</html>
