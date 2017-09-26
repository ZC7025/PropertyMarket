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
        <button id="Button" class="btn btn-primary" onclick="changeWind()">修改预约</button>
        <button id="fireButton" class="btn btn-danger" onclick="del()">取消预约</button>
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
           data-url="<%=path%>/appointment/listByUser";
           data-side-pagination="server"
           data-row-style="rowStyle">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="employee.name" >负责员工</th>
            <th data-field="employee.buildings.name" >楼盘</th>
            <th data-field="appArriveTime"  data-formatter=formatDate2>预约看房时间</th>
            <th data-field="house.name" >户型</th>
            <th data-field="createdTime"  data-formatter=formatDate>创建时间</th>
        </tr>
        </thead>

    </table>


    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改预约</h4>
                </div>
                <div class="modal-body">
                    <form id="changeAppo">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th>预约看房时间</th>
                                <th>
                                    <input type="text" class="form-control " id="appTime" name="appointment.appArriveTime"/>
                                </th>
                            </tr>
                            <tr>
                                <th>户型</th>
                                <th>
                                    <select class="form-control" id="house" name="appointment.house.id"></select>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="changeAppo();">保存</button>
                </div>
            </div>
        </div>
    </div>


</div>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path%>/plugins/layDate/laydate.js"></script>

<script>

    var nowDate = new Date();
    var dateStr = nowDate.getFullYear() + '-' + (nowDate.getMonth()+1) + '-' + nowDate.getDate();
    var ins22 = laydate.render({
        elem: '#appTime'
        ,type: 'datetime'
        , min: dateStr
        ,ready: function(){

        }
    });

    function changeAppo() {
        var select= $("#table1").bootstrapTable('getSelections');
        var appointmentId = select[0].id;
        var appArriveTime = $("#appTime").val();
        var houseId  = $("#house").val();
        $.post("/appointment/changeAppointment",
            {"appointmentId":appointmentId,"appArriveTime":appArriveTime,"houseId":houseId},
            function (data) {
                if(data.controllerResult.result == 'success'){
                    swal(data.controllerResult.message,"","success");
                    $("#table1").bootstrapTable('refresh');
                }
            }, "json"
        );
    }
    
    function changeWind() {
        var select= $("#table1").bootstrapTable('getSelections');
        if(select.length==1){
            var buildsId = select[0].house.buildings.id;
            $("#appTime").val("");
            $("#house").empty();

            $("#appTime").val(formatDate(select[0].appArriveTime));
            $("#house").append("<option value="+select[0].house.id+">"+select[0].house.name+"</option>");
            $.post("/house/listByBuilds",
                {"buildsId":buildsId},
                function (data) {
                    for(i=0,length = data.houses.length;i<length;i++){
                        if(select[0].house.id!=data.houses[i].id){
                            $("#house").append("<option value="+data.houses[i].id+">"+data.houses[i].name+"</option>");
                        }
                    }
                }, "json"
            );
            $("#myModal").modal();

        }else{
            swal("请选择一行数据","","warning");
        }
    }

    function del() {
        var select= $("#table1").bootstrapTable('getSelections');
        if(select.length==1){
            var id  = select[0].id;
            swal({
                    title: "你要取消预约吗？",
                    text: "",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "是的",
                    cancelButtonText:"点错了",
                    closeOnConfirm: false
                },
                function(){
                    $.post("/appointment/delAppointment",
                        {"appointmentId":id},
                        function (data) {
                            if(data.controllerResult.result == 'success'){
                                swal("您已取消预约","","success");
                                $("#table1").bootstrapTable('refresh');
                            }
                        }, "json"
                    );
                }
            )
        }else{
            swal("请选择一行数据","","warning");
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
