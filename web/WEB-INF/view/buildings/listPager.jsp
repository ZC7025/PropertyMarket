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
    <title>楼盘</title>
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/css/mains.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
</head>
<body>
<%@ include file="../master/head.jsp"%>

<%--导航条--%>
<div class=" navbar-collapse collapse nav navbar-default">
    <ul class="nav navbar-nav ">
        <li><a href="<%=path%>/home/homePager" class="nav_bg" >&nbsp;首页</a></li>
        <li><a href="<%=path%>/builds/listPager">楼盘</a></li>
        <li><a href="<%=path%>/house/houseList" class="nav_bg">户型</a></li>
        <li><a href="<%=path%>/activity/listPager"  class="nav_bg">活动</a></li>
        <li><a href="<%=path%>/article/listPager" class="nav_bg">文章</a></li>
    </ul>
</div>

<div class="margin">
    <div>
        <h6>当前位置：<a href="<%=path%>/home/homePager">首页</a> > 楼盘</h6>
    </div>
    <div class="col-sm-12 col-md-12 col-lg-12 ">
        <div class="col-sm-12 col-md-10 col-lg-9 ">
            <ul>
                <c:forEach items="${requestScope.buildingss}" var="b">
                    <li class="body_div">
                        <input type="hidden" name="id" value=${b.id }/>
                        <a href="<%= path%>/builds/personInfo?id=${b.id }">
                            <span class="buy_t1">
                                <c:if test="${b.logo != null }">
                                    <img alt="image" class="img-responsive img-rounded" src="<%= path%>/${b.logo }" width="180px;" style="height:160px;"/>
                                </c:if>
                                <c:if test="${b.logo == null }">
                                    <img alt="image" class="img-responsive img-rounded" src="<%=path%>/img/building/lcon1.jpg" width="180px;" style="height:160px;"/>
                                </c:if>
                            </span>
                            <h3>${b.name } </h3>
                        </a>
                        <h3>
                            <span class="text05">&nbsp; [毫装] &nbsp; [已开盘]</span>
                            <span class="text06 pull-right">元/㎡</span>
                            <span class="text07 pull-right">${b.avgPrice }</span>
                            <span class="text06 pull-right">均价</span>
                        </h3>
                        <p>${b.area}${b.address}</p>
                        <p><span>房源类型：</span>${b.houseType}</p>
                        <p><span>建筑类型：</span>${b.buildingType}</p>
                    </li>
                </c:forEach>
            </ul>
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
                                    <li><a href="${pageContext.request.contextPath }/builds/listPager?page=${page - 1}&pageSize=6">上一页</a></li>
                                    <li><a href="${pageContext.request.contextPath }/builds/listPager?page=1&pageSize=6">首页</a></li>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${requestScope.page == requestScope.totalPage || requestScope.page > requestScope.totalPage }">
                                    <li><a href="#" class="btn disabled">尾页</a></li>
                                    <li><a href="#" class="btn disabled">下一页</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${pageContext.request.contextPath }/builds/listPager?page=${totalPage}&pageSize=6">尾页</a></li>
                                    <li><a href="${pageContext.request.contextPath }/builds/listPager?page=${page + 1}&pageSize=6">下一页</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <%--热门活动--%>
        <div class="col-sm-12 col-md-2 col-lg-3 first2">
            <div class="buy_tab1 ">
                <span>热门活动</span>
                <a class="pull-right more" href="<%=path%>/activity/listPager" >更多</a>
            </div>
            <ul>
                <c:forEach items="${requestScope.activities}" var="act" end="3">
                    <li class="list-unstyled">
                            <span class="news">
                                <a href="<%=path%>/activity/personInfor?id=${act.id}" >
                                <c:if test="${act.logo != null }">
                                    <img alt="${act.title}" class="img-responsive img-rounded" src="<%=path %>/${act.logo }" style="width:120px; height:85px;"/>
                                </c:if>
                                <c:if test="${act.logo == null }">
                                    <img alt="${act.title}" class="img-responsive img-rounded" src="<%=path %>/img/journalism/journalism1.jpg"style="width:120px; height:85px;"/>
                                </c:if>
                            </a>
                            </span>
                        <h4><a href="<%=path%>/activity/personInfor?id=${act.id}">${act.title}</a></h4>
                        <p><span class="red02"><small>火热进行中</small></span></p>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<%@ include file="../master/foot.jsp"%>

<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
</body>
</html>
