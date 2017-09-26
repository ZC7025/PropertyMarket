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
    <link rel="stylesheet" href="<%=path%>/plugins/layDate/laydate.css">
    <script src="<%=path%>/plugins/jquery.min.js"></script>
    <script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>
</head>
<body>
<div >
    <h4>所有预约</h4>
    <div id="toolbar">
        <button id="seeButton" class="btn btn-primary" onclick="add()">添加看房时间</button>
        <button id="getButton" class="btn btn-primary" onclick="changeWin()">修改预约状态</button>
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
           data-url="<%=path%>/appointment/listByEmployee";
           data-side-pagination="server"
           data-row-style="rowStyle">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="user.name" >客户姓名</th>
            <th data-field="appArriveTime"  data-formatter=formatDate2>预约看房时间</th>
            <th data-field="arriveTime"  data-formatter=formatSeeHouse>看房时间</th>
            <th data-field="house.name" >户型</th>
            <th data-field="appStatus" >预约状态</th>
            <th data-field="createdTime"  data-formatter=formatDate>创建时间</th>
            <th data-field="status"  data-formatter=formatStatus>状态</th>
        </tr>
        </thead>

    </table>


    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改预约状态</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th>客户姓名</th>
                                <th>
                                    <div  id="name" class="form-group">

                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <th>预约状态</th>
                                <th>
                                    <div class="form-group">
                                       <select class="form-control" id="appStatus" name="appointment.appStatus"></select>
                                    </div>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="changeAppStatus();">保存</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel1">添加看房时间</h4>
                </div>
                <div class="modal-body">
                    <from id="addTime">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th>客户姓名</th>
                                <th>
                                    <div  id="name1" class="form-group">

                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <th>看房时间</th>
                                <th>
                                    <div class="form-group">
                                        <input type="text" id="test5" class="form-control"  name="appointment.arriveTime" placeholder="请选择选择时间">
                                    </div>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </from>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="addTime();">保存</button>
                </div>
            </div>
        </div>
    </div>


</div>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path%>/plugins/layDate/laydate.js"></script>

<script>

    laydate.render({
        elem: '#test5'
        ,type: 'datetime'
    });

    function addTime() {
        var select= $("#table1").bootstrapTable('getSelections');
        var id = select[0].id;
        $.post("/appointment/addArriveTime",
            {"id":id,"arriveTime":$("#test5").val()},
            function (data) {
                if (data.controllerResult.result == 'success') {
                    swal(data.controllerResult.message,"","success");
                    $("#table1").bootstrapTable('refresh');
                } else {
                    swal(data.controllerResult.message,"","error");
                }
            }, "json"
        );
    }

    function add() {
        var select= $("#table1").bootstrapTable('getSelections');
        if(select.length==1) {
            if(select[0].arriveTime ==null){
                $("#name1").empty();
                $("#id").empty();
                $("#test5").val("");
                $("#name1").append("<span>"+select[0].user.name+"</span>");
                $("#id").val(select[0].id);
                $("#myModal1").modal();
            }else{
                swal("已添加看房时间，不能重复添加","","warning");
            }
        }else{
            swal("请选择一行数据","","warning");
        }
    }

    function changeWin() {
        var select= $("#table1").bootstrapTable('getSelections');
        if(select.length==1){
            $("#appStatus").empty();
            $("#name").empty();
            $("#name").append("<span>"+select[0].user.name+"</span>");
            var a = ["已预约","已联系","已看房","已购房"];
            if(select[0].appStatus ==null){
                for(i=0;i<a.length;i++){
                    $("#appStatus").append("<option value="+a[i]+">"+a[i]+"</option>");
                }
            }else{
                $("#appStatus").append("<option value="+select[0].appStatus+">"+select[0].appStatus+"</option>");
                for(i=0;i<a.length;i++){
                    if(a[i] != select[0].appStatus){
                        $("#appStatus").append("<option value="+a[i]+">"+a[i]+"</option>");
                    }
                }
            }
            $("#myModal").modal();
        }else{
            swal("请选择一行数据","","warning");
        }


    }

    function changeAppStatus() {
        var select= $("#table1").bootstrapTable('getSelections');
        var appStatus = $("#appStatus").val();
        $.post("/appointment/changeAppStatus",
            {"id":select[0].id, "appStatus":appStatus},
            function (data) {
                if (data.controllerResult.result == 'success') {
                    swal(data.controllerResult.message,"","success");
                    $("#table1").bootstrapTable('refresh');
                } else {
                    swal(data.controllerResult.message,"","error");
                }
            }, "json"
        );
    }

    function fire() {
        var select= $("#table1").bootstrapTable('getSelections');
        if(select.length == 1){
            if(select[0].status == 0){
                swal("已是冻结状态，不可重复操作","","warning");
            }else{
                $.post("/appointment/changeStatus",
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
                $.post("/appointment/changeStatus",
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



    function rowStyle(row) {
        var classes = ['active', 'success', 'info', 'warning', 'danger'];
        if (row.appStatus =="已联系"){
            return {
                classes: 'active'
            };
        }else if (row.appStatus =="已看房"){
            return {
                classes: 'success'
            };
        }else if (row.appStatus =="已购房"){
            return {
                classes: 'info'
            };
        }
        return {};
    }

    function formatSeeHouse(value) {
        if(value == undefined || value == null || value == ''){
            return '还没来看房';
        }else{
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
            return year + "-" + month + "-" + day + " " + hour + ":" + minutes ;
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

    function formatDate2(value) {
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
            return year + "-" + month + "-" + day + " " + hour + ":" + minutes ;
        }
    }


    function NullToString(value){
        if(value === null){
            return "";
        }else{
            return value;
        }
    }
</script>
</body>
</html>
