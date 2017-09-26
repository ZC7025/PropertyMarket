<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/4
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>楼盘</title>
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/css/mains.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
</head>
<body>
<%--首版和搜索--%>
<%@ include file="../master/head.jsp" %>

<%--导航条--%>
<div class=" navbar-collapse collapse nav navbar-default">
    <ul class="nav navbar-nav ">
        <li><a href="<%=path%>/home/homePager" class="nav_bg">&nbsp;首页</a></li>
        <li><a href="<%=path%>/builds/listPager" class="nav_bg" >楼盘</a></li>
        <li><a href="<%=path%>/house/houseList">户型</a></li>
        <li><a href="<%=path%>/activity/listPager"  class="nav_bg">活动</a></li>
        <li><a href="<%=path%>/article/listPager" class="nav_bg">文章</a></li>
    </ul>
</div>

<div class="margin">
    <div>
        <h6>当前位置：<a href="<%=path%>/">首页</a> > 户型列表</h6>
    </div>
    <div class="col-sm-12 col-md-12 col-lg-12 ">
        <div class="col-sm-12 col-md-10 col-lg-9 row">
            <c:forEach items="${requestScope.houses}" var="house">
                <div class="col-sm-12 col-md-6 col-lg-4 ">
                    <div class="thumbnail" >
                        <a href="<%=path%>/house/detail?house.id=${house.id}" >
                            <c:if test="${house.logo != null }">
                                <img alt="${house.name}" class="img-responsive img-rounded" src="<%= path%>/${house.logo }" style="height:250px;"/>
                            </c:if>
                            <c:if test="${house.logo == null }">
                                <img alt="${house.name}" class="img-responsive img-rounded" src="<%=path%>/img/building/lcon1.jpg" style="height:250px;"/>
                            </c:if>
                        </a>
                        <div class="caption">
                            <a href="<%=path%>/house/detail?house.id=${house.id}">${house.name}</a>
                            <div class="pull-right text1"><span > &yen;${house.unitPrice}元/平米</span></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
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
                                    <li><a href="<%=path%>/house/houseList?page=${page - 1}&pageSize=6">上一页</a></li>
                                    <li><a href="<%=path%>/house/houseList?page=1&pageSize=6">首页</a></li>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${requestScope.page == requestScope.totalPage || requestScope.page > requestScope.totalPage }">
                                    <li><a href="#" class="btn disabled">尾页</a></li>
                                    <li><a href="#" class="btn disabled">下一页</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="<%=path%>/house/houseList?page=${totalPage}&pageSize=6">尾页</a></li>
                                    <li><a href="<%=path%>/house/houseList?page=${page + 1}&pageSize=6">下一页</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <%--推荐楼盘--%>
        <div class="col-sm-12 col-md-2 col-lg-3 first2">
            <div class="buy_tab1 ">
                <span>推荐楼盘</span>
                <a class="pull-right more" href="<%=path%>/builds/listPager" >更多</a>
            </div>
            <ul>
                <c:forEach items="${requestScope.buildings}" var="b">
                    <li class="list-unstyled">
                        <a href="<%=path%>/builds/personInfo?id=${b.id }">
                            <span class="news">
                                <c:if test="${b.logo != null }">
                                    <img alt="image" class="img-responsive img-rounded" src="<%=path%>/${b.logo }" width="180px;" style="height:80px;"/>
                                </c:if>
                                <c:if test="${b.logo == null }">
                                    <img alt="image" class="img-responsive img-rounded" src="<%=path%>/img/building/lcon1.jpg" width="180px;" style="height:80px;"/>
                                </c:if>
                            </span>
                        </a>
                        <h4><a href="<%=path%>/builds/personInfo?id=${b.id }">${b.name }</a></h4>
                        <p><span class="red02">${b.avgPrice }</span>元/平方米</p>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<%--版权--%>
<%@ include file="../master/foot.jsp" %>
</body>
</html>
