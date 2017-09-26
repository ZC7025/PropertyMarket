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
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap-datetimepicker.min.css">
    <script src="<%=path%>/plugins/jquery.min.js"></script>
    <script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>

</head>
<body>
<div>
    <h4>所有员工</h4>
    <div id="toolbar">
    </div>
    <table id="allMission"
           data-toggle="table"
           data-show-columns="false"
           data-height="460"
           data-toolbar="#toolbar"
           data-click-to-select="true"
           data-cookie="true"
           data-cookie-id-table="saveId"
           data-pagination="true"
           data-search="false"
           data-url="<%=path%>/mission/listByEmployee";
           data-side-pagination="server"
           data-row-style="rowStyle">
        <thead>
        <tr>
            <th data-field="monthes" >月份</th>
            <th data-field="quantity" >指标</th>
            <th data-field="bonusPercent" >提成</th>
            <th data-field="employee.basicSalary" >基本工资</th>
            <th data-field="saleCount" >完成</th>
            <th data-field="lastSalary" >最终工资</th>
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
                        <form id="changeMission">
                            <input type="hidden" id="id" name="mission.id">
                            <table class="table table-hover">
                                <tbody>
                                <tr>
                                    <th>指标</th>
                                    <th>
                                        <div class="form-group">
                                            <input type="text" class="form-control " id="quantity"  name="mission.quantity"   />
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <th>提成</th>
                                    <th>
                                        <div class="form-group">
                                            <input type="text" class="form-control " id="bonusPercent"  name="mission.bonusPercent"  />
                                        </div>
                                    </th>
                                </tr>


                                </tbody>
                            </table>
                        </form>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="changeMission()">保存</button>
                    </div>
                </div>
        </div>
    </div>




</div>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-datetimepicker.js"></script>
<script src="<%=path%>/plugins/layDate/laydate.js"></script>
<script>

    function rowStyle(row) {
        var classes = ['active', 'success', 'info', 'warning', 'danger'];
        if (row.quantity > row.saleCount) {
            return {
                classes: 'danger'
            };
        }else if (row.quantity < row.saleCount){
            return {
                classes: 'success'
            };
        }
        return {};
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

</script>

</body>
</html>
