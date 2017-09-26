<%--
  Created by IntelliJ IDEA.
  User: sweet
  Date: 2017/9/16
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>楼盘详情</title>
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/css/mains.css">
    <link rel="stylesheet" href="<%=path%>/plugins/sweet-alert/sweet-alert.css">
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
</head>
<body>

<%--首版和搜索--%>
<%@ include file="../master/head.jsp"%>

<%--导航条--%>
<div class=" navbar-collapse collapse nav navbar-default">
    <ul class="nav navbar-nav ">
        <li><a href="<%=path%>/home/homePager" class="nav_bg">&nbsp;首页</a></li>
        <li><a href="<%=path%>/builds/listPager" >楼盘</a></li>
        <li><a href="<%=path%>/house/houseList" class="nav_bg">户型</a></li>
        <li><a href="<%=path%>/activity/listPager"  class="nav_bg">活动</a></li>
        <li><a href="<%=path%>/article/listPager" class="nav_bg">文章</a></li>
    </ul>
</div>

<%--楼盘详情--%>
<div class="margin">
    <div>
        <h6>当前位置：<a href="<%=path%>/home/homePager">首页</a>><a href="<%=path%>/builds/listPager">楼盘</a> > <a href="<%=path%>/builds/personInfo?id=${requestScope.buildingsId}">楼盘详情</a>>楼盘相册</h6>
    </div>
    <c:forEach items="${requestScope.buildingsImgs}" var="img">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
            <div class="thumbnail" style="height:320px; width:350px;">
                <img class="img-responsive img-rounded" src="<%=path%>/${img.imgPath}" style="width:340px; height:250px;"/>
                <div class="caption">
                    <h3>${img.imgDes }</h3>
                </div>
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
                        <li><a href="${pageContext.request.contextPath }/buildsImg/moreImg?page=${page - 1}&pageSize=6&buildingsId=${requestScope.buildingsId}">上一页</a></li>
                        <li><a href="${pageContext.request.contextPath }/buildsImg/moreImg?page=1&pageSize=6&buildingsId=${requestScope.buildingsId}">首页</a></li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${requestScope.page == requestScope.totalPage || requestScope.page > requestScope.totalPage }">
                        <li><a href="#" class="btn disabled">尾页</a></li>
                        <li><a href="#" class="btn disabled">下一页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath }/buildsImg/moreImg?page=${totalPage}&pageSize=6&buildingsId=${requestScope.buildingsId}">尾页</a></li>
                        <li><a href="${pageContext.request.contextPath }/buildsImg/moreImg?page=${page + 1}&pageSize=6&buildingsId=${requestScope.buildingsId}">下一页</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </div>
</div>

<%@ include file="../master/foot.jsp"%>

<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
</body>
</html>
