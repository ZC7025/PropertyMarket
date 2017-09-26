<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2017/8/26
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Title</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" src="<%=path%>/plugins/layDate/laydate.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <h1>基本信息</h1>
            <table class="table table-hover">

                <tbody>
                    <tr>
                        <th>邮箱</th>
                        <th id="thEmail">
                            ${sessionScope.user.email}
                        </th>
                    </tr>
                    <tr>
                        <th>电话</th>
                        <th id="thPhone">
                            ${sessionScope.user.phone}
                        </th>
                    </tr>
                    <tr>
                        <th>真实姓名</th>
                        <th id="thName">
                            ${sessionScope.user.name}
                        </th>
                    </tr>
                    <tr>
                        <th>昵称</th>
                        <th id="thNickname">
                            ${sessionScope.user.nickname}
                        </th>
                    </tr>
                    <tr>
                        <th>qq</th>
                        <th id="thQq">
                            ${sessionScope.user.qq}
                        </th>
                    </tr>
                    <tr>
                        <th>微信</th>
                        <th id="thWechat">
                            ${sessionScope.user.wechat}
                        </th>
                    </tr>

                    <tr>
                        <th>性别</th>
                        <th id="thGender">
                            ${sessionScope.user.gender}
                        </th>
                    </tr>
                    <tr>
                        <th>生日</th>
                        <th id="thBirthday">
                            <fmt:formatDate value="${sessionScope.user.birthday}" pattern="yyyy/MM/dd" var="d" />
                            ${d}
                        </th>
                    </tr>
                </tbody>
            </table>
            <button type="button" class="btn btn-primary " data-toggle="modal"  onclick="changeWin()">
                修改信息
            </button>
        </div>
    </div>



    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                </div>
                <div class="modal-body">
                   <form id="changMessage">
                       <div class="form-group">
                           <input type="hidden" class="form-control " id="id"  name="user.id"  value="${sessionScope.user.id}" />
                       </div>
                       <table class="table table-hover">

                           <tbody>
                           <tr>
                               <th>邮箱</th>
                               <th>
                                   <div class="form-group">
                                       <input type="email" class="form-control " id="email"  name="user.email"   readonly/>
                                   </div>
                               </th>
                           </tr>
                           <tr>
                               <th>真实姓名</th>
                               <th>
                                   <c:choose>
                                       <c:when test="${sessionScope.user.name ==null || sessionScope.user.name ==''}">
                                           <div class="form-group">
                                               <input type="text" class="form-control " id="name"  name="user.name"   />
                                           </div>
                                       </c:when>
                                       <c:otherwise>
                                           <div class="form-group">
                                               <input type="text" class="form-control " id="name1"  name="user.name"   readonly/>
                                           </div>
                                       </c:otherwise>
                                   </c:choose>
                               </th>

                           </tr>
                           <tr>
                               <th>电话</th>
                               <th>
                                   <div class="form-group">
                                       <input type="text" class="form-control " id="phone"  name="user.phone"  />
                                   </div>
                               </th>
                           </tr>
                           <tr>
                               <th>昵称</th>
                               <th>
                                   <div class="form-group">
                                       <input type="text" class="form-control " id="nickname"  name="user.nickname"   />
                                   </div>
                               </th>
                           </tr>
                           <tr>
                               <th>qq</th>
                               <th>
                                   <div class="form-group">
                                       <input type="text" class="form-control " id="qq"  name="user.qq" />
                                   </div>
                               </th>
                           </tr>
                           <tr>
                               <th>微信</th>
                               <th>
                                   <div class="form-group">
                                       <input type="text" class="form-control " id="wechat"  name="user.wechat"   />
                                   </div>
                               </th>
                           </tr>

                           <tr>
                               <th>性别</th>
                               <th>
                                   <label class="radio-inline" id="man_label"></label>
                                   <label class="radio-inline" id="woman_label"></label>
                               </th>
                           </tr>
                           <tr>
                               <th>生日</th>
                               <th>
                                   <div class="form-group">
                                       <fmt:formatDate value="${sessionScope.user.birthday}" pattern="yyyy-MM-dd" var="d" />
                                       <input type="text" class="form-control " id="birthday"  name="user.birthday"  />
                                   </div>
                               </th>
                           </tr>
                           </tbody>
                       </table>
                   </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <a type="button" class="btn btn-default" data-dismiss="modal" href="javascript:void(0);" onclick="changMessage()">保存</a>
                </div>
            </div>
        </div>
    </div>

<%@include file="../master/script.inc.jsp"%>
<script src="<%=path%>/plugins/layDate/laydate.js"></script>
<script>


    var nowDate = new Date();
    var dateStr = nowDate.getFullYear() + '-' + (nowDate.getMonth()+1) + '-' + nowDate.getDate();
    var ins22 = laydate.render({
        elem: '#birthday'
        ,type: 'date'
        , max: dateStr
        ,ready: function(){

        }
    });


    function createGender(gender) {

        var manChecked = '<input type="radio" name="user.gender" id="man" value="男" checked> 男 </label>';
        var womanChecked = '<input type="radio" name="user.gender" id="woman" value="女" checked> 女 </label>';
        var man = '<input type="radio" name="user.gender" id="man" value="男"> 男 </label>';
        var woman = '<input type="radio" name="user.gender" id="woman" value="女"> 女 </label>';
        $("#man_label").empty();
        $("#woman_label").empty();
        if (gender == '男') {
            $("#man_label").append(manChecked);
            $("#woman_label").append(woman);
        } else if (gender == '女') {
            $("#man_label").append(man);
            $("#woman_label").append(womanChecked);
        }else{
            $("#man_label").append(man);
            $("#woman_label").append(woman);
        }

    }

    function changeWin() {
        $(":text").val("");
        $.post("/user/getById",
            function(data) {
                if(data.user.name !=null && data.user.name !="" && data.user.name != undefined){
                    $("#name1").val(data.user.name);
                }
                createGender(data.user.gender);
                $("#email").val(data.user.email);
                $("#phone").val(data.user.phone);
                $("#nickname").val(data.user.nickname);
                $("#qq").val(data.user.qq);
                $("#wechat").val(data.user.wechat);
                $("#birthday").val(formatDate(data.user.birthday));
            },"json"
        );

        $("#myModal").modal();
    }


    function changMessage() {
        $.post("/user/userChangeMessage",
            $("#changMessage").serialize(),
            function(data) {
               if(data.controllerResult.result == 'success') {
                    window.location.reload();
                }else{
                    swal(data.controllerResult.message);
                }
            },"json"
        );
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
                return year + "-" + month + "-" + day;
            }
        }
    </script>
</body>
</html>
