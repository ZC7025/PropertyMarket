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
        <button id="getButton" class="btn btn-primary" onclick="show1()">修改</button>
        <button id="pact" class="btn btn-primary" onclick="uploading()">上传合同</button>
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
           data-url="<%=path%>/customer/listByEmployeeId";
           data-side-pagination="server"
           data-row-style="rowStyle">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="name" >姓名</th>
            <th data-field="email" >邮箱</th>
            <th data-field="phone" >电话</th>
            <th data-field="gender" >性别</th>
            <th data-field="customerType" >客户类型</th>
            <th data-field="address" >联系地址</th>
            <th data-field="createdTime"  data-formatter=formatDate>创建时间</th>
            <th data-field="status"  data-formatter=formatStatus>状态</th>
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
                                            <input type="text" class="form-control " id="name"  name="customer.name"  disabled />
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th>邮箱</th>
                                    <th>
                                        <div class="form-group">
                                            <input type="email" class="form-control " id="email"  name="customer.email" disabled />
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th>电话</th>
                                    <th>
                                        <div class="form-group">
                                            <input type="text" class="form-control " id="phone"  name="customer.phone" disabled />
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th>地址</th>
                                    <th>
                                        <div class="form-group">
                                            <input type="text" class="form-control " id="address"  name="customer.address"   />
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th>客户类型</th>
                                    <th>
                                        <select class="form-control" id="customerType1" name="customer.customerType">

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
                        <h4 class="modal-title" id="myModalLabel">查看信息</h4>
                    </div>
                    <div class="modal-body">
                        <form id="changMessage">
                            <table class="table table-hover">

                                <tbody>
                                <tr>
                                    <th>姓名</th>
                                    <th id="customerName">
                                    </th>
                                </tr>
                                <tr>
                                    <th>邮箱</th>
                                    <th id="customerEmail">
                                    </th>
                                </tr>
                                <tr>
                                    <th>电话</th>
                                    <th id="customerPhone">
                                    </th>
                                </tr>
                                <tr>
                                    <th>性别</th>
                                    <th id="customerGender">
                                    </th>
                                </tr>
                                <tr>
                                    <th>生日</th>
                                    <th id="customerBirthday">
                                    </th>
                                </tr>
                                <tr>
                                    <th>身份证号码</th>
                                    <th id="customerIdentityId">
                                    </th>
                                </tr>
                                <tr>
                                    <th>联系地址</th>
                                    <th id="customerAddress">
                                    </th>
                                </tr>
                                <tr>
                                    <th>客户类型</th>
                                    <th id="customerType">
                                    </th>
                                </tr>
                                <tr>
                                    <th>创建时间</th>
                                    <th id="customerCreated_time">
                                    </th>
                                </tr>
                                <tr>
                                    <th>状态</th>
                                    <th id="customerStatus">
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

    <div class="modal fade" id="editWin3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel2">修改信息</h4>
                </div>
                <div class="modal-body">
                    <form id="uploading" method="post" enctype="multipart/form-data">
                       <div class="form-group">
                            电子版购房合同：<input type="file" id="contract" name="contract"/>
                       </div>
                       <div class="form-group">
                            zip版购房合同：<input type="file" id="archives" name="archives"/>
                       </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="savePact();">保存</button>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path %>/plugins/jQuery.form.min.js"></script>
<script>

    function uploading() {
        var select = $("#table1").bootstrapTable('getSelections');
        if (select.length == 1) {
            if(select[0].status != 0){
                if (select[0].customerType === '购房客户') {
                    $('#editWin3').modal();//调用模态框

                }else{
                    swal("此客户不是购房客户","","warning");
                }
            }else{
                swal("此用户为冻结状态","","warning");
            }

        }else{
            swal("请选择一行数据","","warning");
        }
    }

    function savePact() {
        var select = $("#table1").bootstrapTable('getSelections');
        if (select.length == 1) {
            var id = select[0].id;
            $("#uploading").ajaxSubmit({
                type: 'post',
                url: '/customer/uploading?id=' + id,
                dataType: 'json',
                data: $("#uploading").serialize(),
                success: function (data) {
                        swal("上传成功");
                        $("#table").bootstrapTable("refresh");
                },
            });
        }
    }

    function changeEmployeeMessage() {
        var select= $("#table1").bootstrapTable('getSelections');
        var id = select[0].id;
        $('#editWin1').modal('hide');
        $.post("/customer/changeMessage?id="+id,
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
   function fire() {
       var select= $("#table1").bootstrapTable('getSelections');
       if(select.length == 1){
           if(select[0].status == 0){
               swal("已是冻结状态，不可重复操作","","warning");
           }else{
               $.post("/customer/changeStatus",
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
               $.post("/customer/changeStatus",
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
       $("#customerName").empty();
       $("#customerPhone").empty();
       $("#customerEmail").empty();
       $("#customerGender").empty();
       $("#customerBirthday").empty();
       $("#customerIdentityId").empty();
       $("#customerType").empty();
       $("#customerAddress").empty();
       $("#customerCreated_time").empty();
       $("#customerStatus").empty();
   }

   function seeDetail() {
       clear();
       var select= $("#table1").bootstrapTable('getSelections');
       if(select.length == 1){
           $('#editWin2').modal();
           $("#customerName").append("<span>"+select[0].name+"</span>");
           $("#customerPhone").append("<span>"+select[0].phone+"</span>");
           $("#customerEmail").append("<span>"+select[0].email+"</span>");
           $("#customerGender").append("<span>"+NullToString(select[0].gender)+"</span>");
           $("#customerBirthday").append("<span>"+NullToString(formatBirthday(select[0].birthday))+"</span>");
           $("#customerIdentityId").append("<span>"+NullToString(select[0].identityId)+"</span>");
           $("#customerType").append("<span>"+NullToString(select[0].customerType)+"</span>");
           $("#customerAddress").append("<span>"+NullToString(select[0].address)+"</span>");
           $("#customerCreated_time").append("<span>"+NullToString(formatDate(select[0].createdTime))+"</span>");
           $("#customerStatus").append("<span>"+NullToString(formatStatus(select[0].status))+"</span>");

       }else{
           swal("请选择一个员工","","warning");
       }

   }

    function show1(){
        $("#customerType1").empty();
        var select= $("#table1").bootstrapTable('getSelections');
        if(select.length==1){
            $('#editWin1').modal();//调用模态框
            $("#id").val(select[0].id);
            $("#name").val(select[0].name);
            $("#phone").val(select[0].phone);
            $("#email").val(select[0].email);
            $("#address").val(select[0].address);
            $("#customerType1").append("<option value= "+select[0].customerType+" >"+select[0].customerType+"</option>");

            var customerTypeStr = ["预约客户","意向客户","预定客户","购房客户"];
            for(i = 0; i < customerTypeStr.length; i++){
                if(customerTypeStr[i] != select[0].customerType){
                    $("#customerType1").append("<option value= "+customerTypeStr[i]+" >"+customerTypeStr[i]+"</option>");
                }
            }


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

    function rowStyle(row) {
        var classes = ['active', 'success', 'info', 'warning', 'danger'];
        if (row.customerType =="意向客户"){
            return {
                classes: 'active'
            };
        }else if (row.customerType =="预定客户"){
            return {
                classes: 'success'
            };
        }else if (row.customerType =="购房客户"){
            return {
                classes: 'info'
            };
        }
        return {};
    }


</script>

</body>
</html>
