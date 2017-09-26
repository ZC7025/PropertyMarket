<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/12
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>员工</title>
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/css/mains.css">
    <link rel="stylesheet" href="<%=path%>/plugins/layDate/laydate.css">
    <link href="<%=path %>/plugins/sweet-alert/sweet-alert.css" rel="stylesheet"/>
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico">
</head>
<body>
<%--首版和搜索--%>
<%@ include file="../master/head.jsp" %>

<%--导航条--%>
<div class=" navbar-collapse collapse nav navbar-default">
    <ul class="nav navbar-nav ">
        <li><a href="<%=path%>/home/homePager" class="nav_bg" >&nbsp;首页</a></li>
        <li><a href="<%=path%>/builds/listPager"  >楼盘</a></li>
        <li><a href="<%=path%>/house/houseList" class="nav_bg">户型</a></li>
        <li><a href="<%=path%>/activity/listPager"  class="nav_bg">活动</a></li>
        <li><a href="<%=path%>/article/listPager" class="nav_bg">文章</a></li>
    </ul>
</div>

<div class="margin">
    <div>
        <h6>当前位置：<a href="<%=path%>/home/homePager">首页</a>><a href="<%=path%>/builds/listPager">楼盘</a> > 预约</h6>
    </div>
    <div class="col-sm-12 col-md-12 col-lg-12">
        <div class="buy_tab ">
            <span>销售员</span>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">

                <c:if test="${requestScope.employees==null}">
                    <h1>很抱歉，暂无员工！！</h1>
                </c:if>
                <c:if test="${requestScope.employees!=null}">
                    <c:forEach var="employee" items="${requestScope.employees}" >
                        <div class="col-sm-6 col-md-4 col-lg-2 ">
                            <div><%--头像推荐使用510*510像素的头像--%>

                                <c:choose>
                                    <c:when test="${employee.headicon==null}">
                                        <img  src="<%=path%>/img/portrait/tx1.jpg" alt="Bootstrap 编码规范" class="img-circle" height="140px">
                                    </c:when>
                                    <c:otherwise>
                                        <img  src="<%=path%>/${employee.headicon}" alt="Bootstrap 编码规范" class="img-circle" height="140px">
                                    </c:otherwise>
                                </c:choose>
                                <p class="text-center">${employee.name}</p>
                                <p class="text-center"><span class="">电话<span>${employee.phone}</span></span></p>
                                <c:choose>
                                    <c:when test="${employee.haveAppo ==true}">
                                        <p class="text-center"><button id="appButton${employee.id}" class="btn btn-default" style="display:none;" onclick="appointment('${employee.id}')">选择</button></p>
                                        <p class="text-center"><button id="delAppButton${employee.id}" class="btn btn-danger"  onclick="delAppo('${employee.id}');">已预约</button></p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-center"><button id="appButton${employee.id}" class="btn btn-default" onclick="appointment('${employee.id}')">选择</button></p>
                                        <p class="text-center"><button id="delAppButton${employee.id}" class="btn btn-danger" style="display:none;" onclick="delAppo('${employee.id}');">已预约</button></p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

                <input type="hidden" id="buildsId" value="${requestScope.buildsId}">
                <input type="hidden" id="userId" value="${sessionScope.user.id}">
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">预约信息</h4>
            </div>
            <div class="modal-body">
                <form id="appMessage">
                    <table class="table table-hover">
                        <tbody>
                        <tr>
                            <th>您的电话</th>
                            <th>
                                <input type="text" class="form-control " id="phone"  name="appointment.appPhone" value="${sessionScope.user.phone}"/>
                            </th>
                        </tr>
                        <tr>
                            <th>户型</th>
                            <th>
                                <select id="house" class="form-control" name="appointment.house.id">

                                </select>
                            </th>
                        </tr>
                        <tr>
                            <th>预约看房时间</th>
                            <th>
                                <div class="form-group">
                                    <input type="text" class="form-control " id="appTime"  name="appointment.appArriveTime"  />
                                </div>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="addAppo();">预约</button>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="employeeId" >
<%--版权--%>
<%@ include file="../master/foot.jsp" %>
<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>
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

    function delAppo(value) {
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
                    var userId = $("#userId").val();
                    $.post("/appointment/delAppointmentByUserEmployee?employeeId="+value+"&userId="+userId,
                        $("#appMessage").serialize(),
                        function (data) {
                            if(data.controllerResult.result == 'success'){
                                swal(data.controllerResult.message,"","success");
                                $("#appButton"+value).show();
                                $("#delAppButton"+value).hide();
                            }else{

                            }
                        }, "json"
                    );
                }
        );


    }

    function addAppo() {
        var id  = $("#employeeId").val();
        var userId = $("#userId").val();
        if(userId === null || userId ===''){
            swal("请先登录用户账号！","","warning");
        }else {
            if (id !== null || id !== "") {
                $.post("/appointment/addAppointment?employeeId=" + id + "&userId=" + userId,
                    $("#appMessage").serialize(),
                    function (data) {
                        if (data.controllerResult.result === 'success') {
                            swal(data.controllerResult.message, "", "success");
                            $("#appButton" + id).hide();
                            $("#delAppButton" + id).show();
                        }
                    }, "json"
                );
            }
        }
    }

    function appointment(value) {
        var userId = $("#userId").val();
        var buildsId = $("#buildsId").val();
        if(userId ==null || userId ==""){
            swal("请先登录账户","","warning")
        }else{
            $.post("/appointment/judgtAppointmentByUser",
                {"userId": userId,"buildsId":buildsId},
                function (data) {
                    if (data.appointment !=null) {
                        swal("您已预约，不能重复预约","","warning")
                    } else {
                        $("#employeeId").val("");
                        $("#house").empty();
                        $("#appTime").val("");
                        $.post("/house/listByBuilds",
                            {"buildsId":buildsId},
                            function (data) {
                                for(i=0,length = data.houses.length;i<length;i++){
                                    $("#house").append("<option value="+data.houses[i].id+">"+data.houses[i].name+"</option>");
                                }
                            }, "json"
                        );
                        $("#employeeId").val(value);
                        $("#myModal").modal();
                    }
                }, "json"
            );
        }
    }
</script>
</body>
</html>
