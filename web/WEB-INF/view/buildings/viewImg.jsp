<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/4
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>楼盘图片浏览</title>
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/css/mains.css">
    <link rel="stylesheet" href="<%=path%>/plugins/sweet-alert/sweet-alert.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
</head>
<body>
<div class="margin">
    <c:forEach items="${requestScope.buildingsImgs}" var="img">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
            <div class="thumbnail" style="height:400px; width:300px;">
                <img class="img-responsive img-rounded" src="<%=path%>/${img.imgPath}" style="width:340px; height:250px;"/>
                <div class="caption">
                    <h3>${img.imgDes }</h3>
                </div>
                <p class="text-center"><button  class="btn btn-danger"  onclick="delImg('${img.id}');">删除</button></p>
            </div>
        </div>
    </c:forEach>
</div>

<div class="container">
    <div class="col-sm-12">
        <nav aria-label="Page navigation" class="pull-center">
            <ul class="pagination">
                <c:choose>
                    <c:when test="${requestScope.page == 1}">
                        <li><a href="#" class="btn disabled">上一页</a></li>
                        <li><a href="#" class="btn disabled">首页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath }/buildsImg/viewImg?page=${page - 1}&pageSize=6&buildingsId=${requestScope.buildingsId}">上一页</a></li>
                        <li><a href="${pageContext.request.contextPath }/buildsImg/viewImg?page=1&pageSize=6&buildingsId=${requestScope.buildingsId}">首页</a></li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${requestScope.page == requestScope.totalPage || requestScope.page > requestScope.totalPage }">
                        <li><a href="#" class="btn disabled">尾页</a></li>
                        <li><a href="#" class="btn disabled">下一页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath }/buildsImg/viewImg?page=${totalPage}&pageSize=6&buildingsId=${requestScope.buildingsId}">尾页</a></li>
                        <li><a href="${pageContext.request.contextPath }/buildsImg/viewImg?page=${page + 1}&pageSize=6&buildingsId=${requestScope.buildingsId}">下一页</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </div>
</div>



<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path%>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script>
    function delImg(value) {
        swal({
                title: "你要删除楼盘图片吗？",
                text: "",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "是的",
                cancelButtonText:"点错了",
                closeOnConfirm: false
            },
            function(){
                $.post("/buildsImg/delImg",
                    {"imgId":value},
                    function (data) {
                        if(data.controllerResult.result == 'success'){
                           window.location.reload();
                        }
                    }, "json"
                );
            }
        );
    }
</script>
</body>
</html>
