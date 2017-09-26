<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2017/8/29
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=path%>/plugins/sweet-alert/sweet-alert.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/examples.css">
    <script src="<%=path%>/plugins/jquery.min.js"></script>
    <script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>
</head>
<body>
<div >
    <h4>所有员工</h4>
    <div id="toolbar">
        <button id="seeButton" class="btn btn-primary" onclick="seeDetail()">查看详情</button>
        <button class="btn btn-primary" onclick="empSaleCount()">查看员工销售量</button>
        <button id="getButton" class="btn btn-primary" onclick="show1()">修改</button>
        <button id="enableButton" class="btn btn-primary" onclick="enable()">激活</button>
        <button id="fireButton" class="btn btn-warning" onclick="fire()">冻结</button>

    </div>
    <table id="table1"
           data-toggle="table"
           data-show-columns="false"
           data-height="460"
           data-toolbar="#toolbar"
           data-click-to-select="true"
           data-cookie="true"
           data-cookie-id-table="saveId"
           data-pagination="true"
           data-search="false"
           data-url="<%=path%>/employee/allEmployee";
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="name">姓名</th>
            <th data-field="email">邮箱</th>
            <th data-field="phone">电话</th>
            <th data-field="gender">性别</th>
            <th data-field="basicSalary">基本工资</th>
            <th data-field="status" data-formatter=formatStatus>状态</th>
            <th data-field="createdTime" data-formatter=formatDate>创建时间</th>
            <th data-field="buildings.name" >负责楼盘</th>
        </tr>
        </thead>

    </table>

    <div class="modal fade" id="editWin1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel1">修改信息</h4>
                    </div>
                    <div class="modal-body">
                        <form id="changeMessage">
                            <table class="table table-hover">
                                <tbody>
                                <tr>
                                    <th>姓名</th>
                                    <th>
                                        <div class="form-group">
                                            <input type="text" class="form-control " id="name"  name="employee.name"  disabled />
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th>邮箱</th>
                                    <th>
                                        <div class="form-group">
                                            <input type="email" class="form-control " id="email"  name="employee.email" disabled />
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th>电话</th>
                                    <th>
                                        <div class="form-group">
                                            <input type="text" class="form-control " id="phone"  name="employee.phone" disabled />
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th>qq</th>
                                    <th>
                                        <div class="form-group">
                                            <input type="text" class="form-control " id="qq"  name="employee.qq"   />
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th>微信</th>
                                    <th>
                                        <div class="form-group">
                                            <input type="text" class="form-control " id="wechat"  name="employee.wechat"   />
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th>地址</th>
                                    <th>
                                        <div class="form-group">
                                            <input type="text" class="form-control " id="address"  name="employee.address"   />
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th>基本工资</th>
                                    <th>
                                        <div class="form-group">
                                            <input type="text" class="form-control " id="basicSalary"  name="employee.basicSalary"   />
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th>负责楼盘</th>
                                    <th>
                                        <select class="form-control" id="buildingsId" name="employee.buildings.id">

                                        </select>
                                    </th>
                                </tr>

                                </tbody>
                            </table>
                        </form>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-default" onclick="changeEmployeeMessage()">保存</button>
                    </div>
                </div>
        </div>
    </div>

        <!-- Modal -->
    <div class="modal fade" id="editWin2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <form id="editForm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                    </div>
                    <div class="modal-body">
                        <form id="changMessage">
                            <div class="form-group">
                                <input type="hidden" class="form-control " id="id"  name="user.id"/>
                            </div>
                            <table class="table table-hover">

                                <tbody>
                                <tr>
                                    <th>姓名</th>
                                    <th id="employeeName">
                                    </th>
                                </tr>
                                <tr>
                                    <th>邮箱</th>
                                    <th id="employeeEmail">
                                    </th>
                                </tr>
                                <tr>
                                    <th>电话</th>
                                    <th id="employeePhone">
                                    </th>
                                </tr>
                                <tr>
                                    <th>qq</th>
                                    <th id="employeeQq">
                                    </th>
                                </tr>
                                <tr>
                                    <th>微信</th>
                                    <th id="employeeWechat">
                                    </th>
                                </tr>
                                <tr>
                                    <th>性别</th>
                                    <th id="employeeGender">
                                    </th>
                                </tr>
                                <tr>
                                    <th>个人说明</th>
                                    <th id="employeeDes">
                                    </th>
                                </tr>
                                <tr>
                                    <th>工作经验</th>
                                    <th id="employeeExp">
                                    </th>
                                </tr>
                                <tr>
                                    <th>地址</th>
                                    <th id="employeeAddress">
                                    </th>
                                </tr>
                                <tr>
                                    <th>基本工资</th>
                                    <th id="employeeBasic_salary">
                                    </th>
                                </tr>
                                <tr>
                                    <th>简介</th>
                                    <th id="employeeIntro">
                                    </th>
                                </tr>
                                <tr>
                                    <th>负责楼盘</th>
                                    <th id="employeeBuildings">
                                    </th>
                                </tr>
                                <tr>
                                    <th>创建时间</th>
                                    <th id="employeeCreated_time">
                                    </th>
                                </tr>
                                <tr>
                                    <th>状态</th>
                                    <th id="employeeStatus">
                                    </th>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


</div>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path%>/js/main.js"></script>
<script>

    function changeEmployeeMessage() {
        var id=$("#id").val();
        $('#editWin1').modal('hide');
        $.post("/employee/changeMessage?id="+id,
            $("#changeMessage").serialize(),
            function (data) {
                if (data.controllerResult.result == 'success') {
                    swal(data.controllerResult.message,"","success");
                    $("#table1").bootstrapTable('refresh');
                } else {
                    swal(data.controllerResult.message,"","waring");
                }
            }, "json"
        );
    }

    function empSaleCount() {
        var select= $("#table1").bootstrapTable('getSelections');
        if(select.length === 1){
            window.location = contextPath + "/sale/empChartsPage?empId="+select[0].id;
        }else{
            swal("请选择一行数据","","warning");
        }
    }

   function fire() {
       var select= $("#table1").bootstrapTable('getSelections');
       if(select.length == 1){
           if(select[0].status == 0){
               swal("已是冻结状态，不可重复操作","","warning");
           }else{
               $.post("/employee/changeStatus",
                   {"id":select[0].id, "status":0},
                   function (data) {
                       if (data.controllerResult.result == 'success') {
                           $("#table1").bootstrapTable('refresh');
                           swal(data.controllerResult.message,"","success");
                       } else {
                           swal(data.controllerResult.message,"","error");
                       }
                   }, "json"
               );
           }
       }else{
           swal("请选择一行数据","","warning");
       }
   }

   function enable() {
       var select= $("#table1").bootstrapTable('getSelections');
       if(select.length == 1){
           if(select[0].status == 1){
               swal("已是激活状态，不可重复操作","","warning");
           }else{
               $.post("/employee/changeStatus",
                   {"id":select[0].id, "status":1},
                   function (data) {
                       if (data.controllerResult.result == 'success') {
                           $("#table1").bootstrapTable('refresh');
                           swal(data.controllerResult.message,"","success");
                       } else {
                           swal(data.controllerResult.message,"","fail");
                       }
                   }, "json"
               );
           }
       }else{
           swal("请选择一行数据","","warning");
       }
   }

   function clear() {
       $("#employeeName").empty();
       $("#employeePhone").empty();
       $("#employeeEmail").empty();
       $("#employeeQq").empty();
       $("#employeeWechat").empty();
       $("#employeeGender").empty();
       $("#employeeDes").empty();
       $("#employeeExp").empty();
       $("#employeeAddress").empty();
       $("#employeeBasic_salary").empty();
       $("#employeeIntro").empty();
       $("#employeeBuildings").empty();
       $("#employeeCreated_time").empty();
       $("#employeeStatus").empty();
   }

   function seeDetail() {
       clear();
       var select= $("#table1").bootstrapTable('getSelections');
       if(select.length == 1){
           $("#employeeName").append("<span>"+select[0].name+"</span>");
           $("#employeePhone").append("<span>"+select[0].phone+"</span>");
           $("#employeeEmail").append("<span>"+select[0].email+"</span>");
           $("#employeeQq").append("<span>"+NullToString(select[0].qq)+"</span>");
           $("#employeeWechat").append("<span>"+NullToString(select[0].wechat)+"</span>");
           $("#employeeGender").append("<span>"+NullToString(select[0].gender)+"</span>");
           $("#employeeDes").append("<span>"+NullToString(select[0].des)+"</span>");
           $("#employeeExp").append("<span>"+NullToString(select[0].exp)+"</span>");
           $("#employeeAddress").append("<span>"+NullToString(select[0].address)+"</span>");
           $("#employeeBasic_salary").append("<span>"+NullToString(select[0].basicSalary)+"</span>");
           $("#employeeIntro").append("<span>"+NullToString(select[0].intro)+"</span>");
           $("#employeeBuildings").append("<span>"+NullToString(select[0].buildings.name)+"</span>");
           $("#employeeCreated_time").append("<span>"+formatDate(select[0].createdTime)+"</span>");
           $("#employeeStatus").append("<span>"+formatStatus(select[0].createdTime)+"</span>");
           $('#editWin2').modal();
       }else{
           swal("请选择一个员工","","warning");
       }

   }

    function show1(){
        $("#buildingsId").empty();
        var select= $("#table1").bootstrapTable('getSelections');
        if(select.length==1){
            $('#editWin1').modal();//调用模态框
            $("#id").val(select[0].id);
            $("#name").val(select[0].name);
            $("#email").val(select[0].email);
            $("#phone").val(select[0].phone);
            $("#qq").val(select[0].qq);
            $("#wechat").val(select[0].wechat);
            $("#address").val(select[0].address);
            $("#basicSalary").val(select[0].basicSalary);
            $("#buildingsId").append("<option value= "+select[0].buildings.id+" >"+select[0].buildings.name+"</option>");

            $.post("/builds/listByAgencyID",
                $(),
                function (data) {
                    for(var i= 0 ;i<data.buildingss.length;i++){
                        if(data.buildingss[i].name != select[0].buildings.name){
                            $("#buildingsId").append("<option value="+data.buildingss[i].id+">"+data.buildingss[i].name+"</option>");
                        }
                    }
                }, "json"
            );

        }else{
            swal("请选择一行数据进行编辑","","warning");
        }
    }

    function formatStatus(value) {
        if(value ==0){
            return '不可用';
        }else{
            return '可用';
        }
    }


   function formatDate(value) {
       if (value == undefined || value == null || value == '') {
           return "";
       } else {
           var date = new Date(value);
           var year = date.getFullYear().toString();
           var month = (date.getMonth() + 1);
           var day = date.getDate().toString();
           var hour = date.getHours().toString();
           var minutes = date.getMinutes().toString();
           var seconds = date.getSeconds().toString();
           if (month < 10) {
               month = "0" + month;
           }
           if (day < 10) {
               day = "0" + day;
           }
           if (hour < 10) {
               hour = "0" + hour;
           }
           if (minutes < 10) {
               minutes = "0" + minutes;
           }
           if (seconds < 10) {
               seconds = "0" + seconds;
           }
           return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
       }
   }


   function NullToString(value){
        if(value === null){
            return "";
        }else{
            return value;
        }
   }

   $(function () {
       $.post("/builds/listByAgencyID",
           $(),
           function (data) {

           }, "json"
       );
   })

</script>

</body>
</html>
