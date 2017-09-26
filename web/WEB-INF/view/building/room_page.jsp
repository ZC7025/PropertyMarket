<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/30
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>房屋销售情况</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path %>/plugins/sweet-alert/sweet-alert.css"/>
</head>
<body>
<div class="container">
    <div class="row" style="margin-left:5%;margin-top:30px">
        <a href="<%=path %>/build/listPage" class="btn btn-primary">楼栋列表</a>
    </div>
    <input type="hidden" id="id" value="${requestScope.building.id }">
    <div class="row">
        <h3 class="text-center">${requestScope.building.name }房屋销售情况图表</h3>
        <table class="table table-bordered" id="roomSale">
        </table>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="editWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form>
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">业主信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>业主名称:</label>
                        <label id="name"></label>
                    </div>
                    <div class="form-group">
                        <label>业主手机号:</label>
                        <label id="phone"></label>
                    </div>
                    <div class="form-group">
                        <label>邮箱:</label>
                        <label id="email"></label>
                    </div>
                    <div class="form-group">
                        <label>负责员工:</label>
                        <label id="emp"></label>
                    </div>
                    <div class="form-group">
                        <label>员工手机号:</label>
                        <label id="empPhone"></label>
                    </div>
                    <div class="form-group">
                        <label>购买时间:</label>
                        <label id="time"></label>
                    </div>

                </div>
                <div class="modal-footer">
                    <a href="javascript:void(0);" type="button" class="btn btn-default" data-dismiss="modal">关闭</a>
                    <a href="javascript:void(0);" type="button" class="btn btn-primary" data-dismiss="modal">确定</a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path %>/js/main.js"></script>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>

<script src="<%=path%>/js/building/building.js"></script>
<script>
    $(function () {
        $.post(contextPath + "/build/roomSale?building.id=" + $("#id").val(),
            function (data) {
                for(var i = data.building.totalFloor;i>0;i--) {// 层
                    $("#roomSale").append("<tr id='total_floor"+i+"'></tr>");
                    for(var j = 0,rooms = data.building.floorRooms;j < rooms;j++) { // 户
                        var roomHouse = data.roomSale[(i-1)*rooms+j];
                        var status =  roomHouse.saleStatus;
                        $("#total_floor"+i+"").append("<td id='"+roomHouse.name+"' class='row'><span><small>" +
                            "房号："+roomHouse.name+"&nbsp;&nbsp;状态：" + fmtStatus(status)+
                            "&nbsp;&nbsp;户型："+roomHouse.houseName+"&nbsp;&nbsp;面积："+
                            roomHouse.area+"㎡"+"</small></span>"+
                            "<select class='form-control input-sm col-xs-2' id='"+roomHouse.id+"' name='status' onchange=\"updateRoom('"+roomHouse.id+"');\">"+
                            "<option value='1'>待售</option>"+
                            "<option value='2'>已预订</option>"+
                            "<option value='3'>已售</option>"+
                            "<option value='0'>保留</option>"+
                            "</select>"+
                            "</td>");
                        if(status === 1) {
                            $("#"+roomHouse.name).css("background-color","#33FF99");
                            $("#"+roomHouse.name +" option[value='1']").attr("selected","selected");
                        } else if(status === 2) {
                            $("#"+roomHouse.name).css("background-color","#FFFF33");
                            $("#"+roomHouse.name +" option[value='2']").attr("selected","selected");
                        } else if(status === 3) {
                            $("#"+roomHouse.name).css("background-color","#FF6633");
                            $("#"+roomHouse.name +" option[value='3']").attr("selected","selected");
                            $("#"+roomHouse.name + " span").attr("onclick","cusDetail('"+roomHouse.id+"');");
                        } else if(status === 0) {
                            $("#"+roomHouse.name).css("background-color","#31b0d5");
                            $("#"+roomHouse.name +" option[value='0']").attr("selected","selected");
                        }
                    }
                }
            }, "json"
        );
    });

    function cusDetail(roomId) {
        $.post(contextPath + "/sale/getCustomer",
            {"roomId": roomId},
            function (data) {
                if (data.controllerResult.result === 'success') {
                    if(data.sale !== null) {
                        $('#editWin').modal();//调用模态框
                        $("#name").text(data.sale.customer.name);
                        $("#phone").text(data.sale.customer.phone);
                        $("#email").text(data.sale.customer.email);
                        $("#emp").text(data.sale.employee.name);
                        $("#empPhone").text(data.sale.employee.phone);
                        $("#time").text(formatDate1(data.sale.saleTime));
                    } else {
                        swal("暂无业主信息！","请及时添加销售记录","warning");
                    }
                } else {
                    swal(data.controllerResult.message, "", "error");
                }
            }, "json"
        );
    }

    function fmtStatus(status) {
        if(status === 1) {
            return "待售";
        } else if(status === 2) {
            return "已预订";
        } else if(status === 3) {
            return "已售";
        } else if(status === 0) {
            return "保留";
        }
    }
    
    function updateRoom(id) {
        $('#'+id).on('click',function(){
            var status = $(this).children('option:selected').val();
            $.post(contextPath + "/build/updateRoom",
                {"room.id": id, "room.saleStatus": status},
                function (data) {
                    if (data.controllerResult.result === 'success') {
                        window.location.reload();
                    } else {
                        swal(data.controllerResult.message, "", "error");
                    }
                }, "json"
            );
        });
    }
</script>
</html>
