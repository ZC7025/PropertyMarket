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
    <title>所有销售记录</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=path%>/plugins/sweet-alert/sweet-alert.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/examples.css">
    <link href="<%=path %>/plugins/layDate/laydate.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
    <script src="<%=path%>/plugins/jquery.min.js"></script>
    <script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>
</head>
<body>
<div >
    <h4>所有销售记录</h4>
    <div id="toolbar">
        <button id="seeButton" class="btn btn-primary" onclick="seeDetail()">查看详情</button>
        <button id="getButton" class="btn btn-primary" onclick="changeWind()">修改</button>
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
           data-url="<%=path%>/sale/listByEmployeeId"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="customer.name" >客户</th>
            <th data-field="roomName" >房屋编号</th>
            <th data-field="roomName" >房屋编号</th>
            <th data-field="unitPrice" >销售单价</th>
            <th data-field="discount"  data-formatter=formatDiscount>销售折扣</th>
            <th data-field="totalCost"  >销售总价</th>
            <th data-field="saleTime"  data-formatter=formatBirthday>销售时间</th>
            <th data-field="createdTime"  data-formatter=formatDate>创建时间</th>
            <th data-field="status"  data-formatter=formatStatus>状态</th>
        </tr>
        </thead>

    </table>



        <!-- Modal -->
    <div class="modal fade" id="editWin2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <form id="editForm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">详情</h4>
                    </div>
                    <div class="modal-body">
                        <form id="changMessage">
                            <table class="table table-hover">

                                <tbody>
                                <tr>
                                    <th>客户</th>
                                    <th id="saleCustomerName">
                                    </th>
                                </tr>
                                <tr>
                                    <th>房屋编号</th>
                                    <th id="saleRoomName">
                                    </th>
                                </tr>
                                <tr>
                                    <th>销售单价</th>
                                    <th id="saleUnitPrice">
                                    </th>
                                </tr>
                                <tr>
                                    <th>销售折扣</th>
                                    <th id="saleDiscount">
                                    </th>
                                </tr>
                                <tr>
                                    <th>销售总价</th>
                                    <th id="saleTotalCost">
                                    </th>
                                </tr>
                                <tr>
                                    <th>销售时间</th>
                                    <th id="saleSaleTime">
                                    </th>
                                </tr>
                                <tr>
                                    <th>创建时间</th>
                                    <th id="saleCreatedTime">
                                    </th>
                                </tr>
                                <tr>
                                    <th>状态</th>
                                    <th id="saleStatus">
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

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel1">修改</h4>
                </div>
                <div class="modal-body">
                    <from id="changeSale">
                        <input type="hidden" name="sale.id" id="id"/>
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th>销售折扣</th>
                                <th >
                                    <input type="text" class="form-control validate[required,custom[number]]" id="discount"  name="sale.discount" placeholder="请输入销售折扣(0-1的小数)" data-errormessage-value-missing="请输入销售折扣"/>
                                </th>
                            </tr>
                            <tr>
                                <th>销售时间</th>
                                <th>
                                    <input type="text" class="form-control validate[required] demo-input" id="saleTime"  name="sale.saleTime" placeholder="请选择销售时间" data-errormessage-value-missing="请选择销售时间"/>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </from>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="update();">保存</button>
                </div>
            </div>
        </div>
    </div>


</div>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path %>/plugins/layDate/laydate.js"></script>

<script src="<%=path %>/js/common/validationEngine.js"></script>
<script>
    function update() {
        var select  = $("#table1").bootstrapTable('getSelections');
        $.post("/sale/changeSale",
            {"id":select[0].id,"saleTime":$("#saleTime").val(),"discount":$("#discount").val()},
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



    var nowDate = new Date();
    var dateStr = nowDate.getFullYear() + '-' + (nowDate.getMonth()+1) + '-' + nowDate.getDate();
    //限定可选日期
    var ins22 = laydate.render({
        elem: '#saleTime'
        , min: '2010-01-01'
        ,max: dateStr
        ,ready: function(){
            ins22.hint('日期可选值设定在 <br> '+ '  2010-01-01到'+ dateStr );
        }
    });


    function changeWind() {
        var select  = $("#table1").bootstrapTable('getSelections');
        if(select.length==1){
            $("#discount").empty();
            $("#saleTime").empty();
            $("#id").val("");
            $("#discount").val(select[0].discount);
            $("#saleTime").val(formatBirthday(select[0].saleTime));
            $("#id").val(select[0].id);
            $("#myModal").modal();
        }else {
            swal("请选择一行数据","","warning");
        }


    }
    
   function fire() {
       var select= $("#table1").bootstrapTable('getSelections');
       if(select.length == 1){
           if(select[0].status == 0){
               swal("已是冻结状态，不可重复操作","","warning");
           }else{
               $.post("/sale/changeStatus",
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
               $.post("/sale/changeStatus",
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
       $("#saleCustomerName").empty();
       $("#saleRoomName").empty();
       $("#saleUnitPrice").empty();
       $("#saleDiscount").empty();
       $("#saleTotalCost").empty();
       $("#saleSaleTime").empty();
       $("#saleCreatedTime").empty();
       $("#saleStatus").empty();
       
   }

   function seeDetail() {
       clear();
       var select= $("#table1").bootstrapTable('getSelections');
       if(select.length == 1){
           $("#saleCustomerName").append("<span>"+select[0].customer.name+"</span>");
           $("#saleRoomName").append("<span>"+NullToString(select[0].roomName)+"</span>");
           $("#saleUnitPrice").append("<span>"+NullToString(select[0].unitPrice)+"</span>");
           $("#saleDiscount").append("<span>"+NullToString(select[0].discount)+"</span>");
           $("#saleTotalCost").append("<span>"+NullToString(select[0].totalCost)+"</span>");
           $("#saleSaleTime").append("<span>"+NullToString(formatBirthday(select[0].saleTime))+"</span>");
           $("#saleCreatedTime").append("<span>"+NullToString(formatDate(select[0].createdTime))+"</span>");
           $("#saleStatus").append("<span>"+NullToString(formatStatus(select[0].status))+"</span>");
           $('#editWin2').modal();
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


   function formatBirthday(value) {
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
           return year + "-" + month + "-" + day ;
       }
   }

   function NullToString(value){
        if(value === null){
            return "";
        }else{
            return value;
        }
   }

   function formatDiscount(value){
       if(value == 1){
           return "10折";
       }else{
           var a  = value*100;
           a = a + "";
           if(a.charAt(a.length-1)=="0"){
                return a.substr(0,a.length-1)+"折";
           }else{
               return a+"折";
           }
       }
   }

</script>

</body>
</html>
