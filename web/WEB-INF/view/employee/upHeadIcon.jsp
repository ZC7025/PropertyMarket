<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/9/1
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改头像</title>
    <%@include file="../master/style.inc.jsp"%>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">修改头像</h3>
            <form id="upHeadIcon" method="post" enctype="multipart/form-data">
                <div class="form-group" class="col-lg-12 col-md-6 col-sm-3">
                    <label onclick="$('#upload').click();">点击更换头像</label><br/>
                    <div id="preview"  class="col-lg-12 col-md-6 col-sm-3">
                        <c:if test="${sessionScope.employee.headicon == null}">
                            <img id="imghead" border="0" src="<%=path %>/img/headDefault.png"    onclick="$('#upload').click();" >
                        </c:if>
                        <c:if test="${sessionScope.employee.headicon != null}">
                            <img id="imhead" broder="0" src="<%=path%>/${sessionScope.employee.headicon}" style="width:300px; height:266px">
                        </c:if>
                    </div>
                    <input type="file" onchange="previewImage(this, '#upload')" style="display: none;" name="upload" id="upload">
                </div>
                <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="checkHeadIcon();">确定</a>
            </form>

        </div>
    </div>
</div>
</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jQuery.form.min.js"></script>
<script src="<%=path %>/js/common/changeImg.js"></script>

<script>
    function checkHeadIcon() {
        $("#upHeadIcon").ajaxSubmit({
            type: 'post',
            url: '/employee/checkHeadIcon',
            dataType : 'json',
            data: $("#upHeadIcon").serialize(),
            success: function(data) {
                if(data.controllerResult.result === 'success') {
                    swal("修改成功","", "success");
                    $(":file").val("");
                } else {
                    swal("请选择一张图片","", "error");
                }
            },
            error: function(data) {
                swal("添加失败","", "error");
            }
        });
        return false; // 阻止表单自动提交事件
    }
</script>
</html>
