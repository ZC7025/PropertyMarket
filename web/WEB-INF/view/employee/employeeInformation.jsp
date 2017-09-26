<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2017/8/26
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../master/style.inc.jsp"%>
</head>
<body>
    <div class="container">
        <div class="row">
            <h1>基本信息</h1>
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th>邮箱</th>
                        <th>${sessionScope.employee.email}</th>
                    </tr>
                    <tr>
                        <th>电话</th>
                        <th>${sessionScope.employee.phone}</th>
                    </tr>
                    <tr>
                        <th>真实姓名</th>
                        <th>${sessionScope.employee.name}</th>
                    </tr>
                    <tr>
                        <th>qq</th>
                        <th>${sessionScope.employee.qq}</th>
                    </tr>
                    <tr>
                        <th>微信</th>
                        <th>${sessionScope.employee.wechat}</th>
                    </tr>

                    <tr>
                        <th>性别</th>
                        <th>${sessionScope.employee.gender}</th>
                    </tr>
                    <tr>
                        <th>工作经历</th>
                        <th>${sessionScope.employee.exp}</th>
                    </tr>
                    <tr>
                        <th>住址</th>
                        <th>${sessionScope.employee.address}</th>
                    </tr>

                    <tr>
                        <th>底薪</th>
                        <th>${sessionScope.employee.basicSalary}</th>
                    </tr>
                    <tr>
                        <th>创建时间</th>
                        <th>
                            <fmt:formatDate value="${sessionScope.employee.createdTime }" pattern="yyyy-MM-dd HH:mm:ss" var="d"/>
                            ${d}
                        </th>
                    </tr>
                    <tr>
                        <th>简介</th>
                        <th>${sessionScope.employee.intro}</th>
                    </tr>
                    <tr>
                        <th>个人说明</th>
                        <th>${sessionScope.employee.des}</th>
                    </tr>
                </tbody>
            </table>
            <button type="button" class="btn btn-primary " data-toggle="modal" onclick="changeWin()">
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
                           <input type="hidden" class="form-control " id="id"  name="employee.id"  value="${sessionScope.employee.id}" />
                       </div>
                       <table class="table table-hover">
                           <tbody>
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
                               <th>性别</th>
                               <th>
                                   <label class="radio-inline" id="man_label"></label>
                                   <label class="radio-inline" id="woman_label"></label>
                               </th>
                           </tr>

                           <tr>
                               <th>住址</th>
                               <th>
                                   <div class="form-group">
                                       <input type="text" class="form-control " id="address"  name="employee.address"  />
                                   </div>
                               </th>
                           </tr>
                           <tr>
                               <th>个人说明</th>
                               <th>
                                   <div class="form-group">
                                       <textarea class="form-control" rows="3"  id="des"  name="employee.des"  style="resize:none" ></textarea>
                                   </div>
                               </th>
                           </tr>
                           <tr>
                               <th>简介</th>
                               <th>
                                   <div class="form-group">
                                       <textarea class="form-control" rows="3" id="intro" name="employee.intro"  style="resize:none" ></textarea>
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
<script>
    function changeWin() {
        $(":text").val("");
        $.post("/employee/getById",
            function(data) {
                $("#qq").val(data.employee.qq);
                $("#wechat").val(data.employee.wechat);
                $("#gender").val(data.employee.gender);
                $("#address").val(data.employee.address);
                $("#des").val(data.employee.des);
                $("#intro").val(data.employee.intro);
                createGender(data.employee.gender);
            },"json"
        );
        $("#myModal").modal();
    }

    function createGender(gender) {

        var manChecked = '<input type="radio" name="employee.gender" id="man" value="男" checked> 男 </label>';
        var womanChecked = '<input type="radio" name="employee.gender" id="woman" value="女" checked> 女 </label>';
        var man = '<input type="radio" name="employee.gender" id="man" value="男"> 男 </label>';
        var woman = '<input type="radio" name="employee.gender" id="woman" value="女"> 女 </label>';
        $("#man_label").empty();
        $("#woman_label").empty();
        if (gender == '男') {
            $("#man_label").append(manChecked);
            $("#woman_label").append(woman);
        } else if (gender == '女') {
            $("#man_label").append(man);
            $("#woman_label").append(womanChecked);
        } else{
            $("#man_label").append(man);
            $("#woman_label").append(woman);
        }

    }

    function changMessage() {
        $.post("/employee/updateEmpPersonInfo",
            $("#changMessage").serialize(),
            function(data) {
               if(data.controllerResult.result == 'success') {
                    //swal(data.controllerResult.message);
                    window.location = "/employee/viewPersonInfo"
                }else{
                    swal(data.controllerResult.message);
                }
            },"json"
        );
    }

</script>
</body>
</html>
