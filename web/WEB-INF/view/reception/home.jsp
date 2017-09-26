<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/30
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/css/mains.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
    <style>
        #circleContent{
            width:100%;
            height:313px;
        }
    </style>
</head>
<body>
<div>

    <%@ include file="../master/head.jsp"%>

    <%--导航条--%>
    <div class=" navbar-collapse collapse nav navbar-default">
        <ul class="nav navbar-nav ">
            <li><a href="<%=path%>/home/homePager"  >&nbsp;首页</a></li>
            <li><a href="<%=path%>/builds/listPager" class="nav_bg" >楼盘</a></li>
            <li><a href="<%=path%>/house/houseList" class="nav_bg">户型</a></li>
            <li><a href="<%=path%>/activity/listPager"  class="nav_bg">活动</a></li>
            <li><a href="<%=path%>/article/listPager" class="nav_bg">文章</a></li>
        </ul>
    </div>

        <%--轮播图--%>
    <div id="circleContent" class="carousel slide">
        <ol class="carousel-indicators">
            <li data-target="#circleContent" data-slide-to="0" class="active"></li>
            <li data-target="#circleContent" data-slide-to="1"></li>
            <li data-target="#circleContent" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <a href="<%=path %>/builds/personInfo?id=402880725e930fdc015e939dd7480001">
                    <img src="<%=path%>/img/carousel/luenb1.jpg" style="height: 312px; width: 100%" >
                </a>
            </div>
            <div class="item">
                <a href="<%=path%>/builds/personInfo?id=402880725e978902015e979ef1270001">
                    <img src="<%=path%>/img/carousel/luenb2.jpg" style="height: 312px; width: 100%" >
                </a>
            </div>
            <div class="item">
                <a href="<%=path%>/builds/personInfo?id=402880725e97fc7c015e982c3bb10005">
                    <img src="<%=path%>/img/carousel/luenb4.jpg" style="height: 312px; width: 100%">
                </a>
            </div>
        </div>
    </div>

    <%--值得买--%>
    <div class="margin">
        <div class="col-sm-12 col-md-12 col-lg-12 ">
            <div class="buy_tab ">
                <span>值得买</span>
                <a class="pull-right" href="<%=path%>/builds/listPager" >更多</a>
            </div>
            <c:forEach items="${requestScope.buildings}" var="builds" end="2">
                <div class="col-sm-12 col-md-6 col-lg-4 ">
                    <div class="thumbnail" >
                        <a href="<%=path%>/builds/personInfo?id=${builds.id}" >
                            <c:if test="${builds.logo != null }">
                                <img alt="${builds.name}" class="img-responsive img-rounded" src="<%= path%>/${builds.logo }" style="height: 240px;"/>
                            </c:if>
                            <c:if test="${builds.logo == null }">
                                <img alt="${builds.name}" class="img-responsive img-rounded" src="<%=path%>/img/building/lcon1.jpg" style="height: 240px;"/>
                            </c:if>
                        </a>
                        <div class="caption">
                            <a href="<%=path%>/builds/personInfo?buildings.id=${builds.id}">${builds.name}</a>
                            <div class="pull-right text1"><span > &yen;${builds.avgPrice}元/平米</span></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

        <%--活动--%>
    <div class="margin">
        <div class="col-sm-12 col-md-12 col-lg-12 ">
            <div class="buy_tab ">
                <span >活动</span>
                <a class="pull-right" href="<%=path%>/activity/listPager" >更多</a>
            </div>
            <div class="col-sm-6 col-md-8 col-lg-9">
                <c:forEach items="${requestScope.activities}" var="act" end="7">
                    <div class="col-sm-6 col-md-4 col-lg-3 ">
                        <div class="thumbnail">
                            <a href="<%=path%>/activity/personInfor?id=${act.id}" >
                                <c:if test="${act.logo != null }">
                                    <img alt="${act.title}" class="img-responsive img-rounded" src="<%=path %>/${act.logo }"style="height: 150px;"/>
                                </c:if>
                                <c:if test="${act.logo == null }">
                                    <img alt="${act.title}" class="img-responsive img-rounded" src="<%=path %>/img/journalism/journalism1.jpg"style="height: 150px;"/>
                                </c:if>
                            </a>
                            <div class="caption">
                                <a target="_blank" href="<%=path%>/activity/personInfor?id=${act.id}">${act.title}</a>
                                <br />
                                <span class="text1">开始时间：<fmt:formatDate value="${act.startTime}" pattern="yyyy-MM-dd"></fmt:formatDate></span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 first ">
                <div class="buy_tab1 ">
                    <span>活动专栏</span>
                </div>
                <ul>
                    <c:forEach items="${requestScope.activities}" var="act" begin="8" end="14">
                        <li class="list-unstyled" style="margin-top: 10px;">
                            <a href="<%=path%>/activity/personInfor?id=${act.id}"><strong class="text-left">${act.title}</strong></a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

    <%--广告位1--%>
    <div class="margin">
        <div class="col-sm-12 col-md-12 col-lg-12 ">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="row">
                    <c:choose>
                        <c:when test="${requestScope.ads.size() > 0}">
                            <c:forEach items="${requestScope.ads}" var="ad" varStatus="count">
                                <c:if test="${ad.showOrder == 1}">
                                    <a href="<%=path %>/${ad.adUrl}"><img src="<%=path %>/${ad.logo}" height="150px;" width="100%;"></a>
                                </c:if>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <img src="<%=path %>/img/ads_default.png" height="150px;" width="100%;">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

        <%--户型--%>
    <div class="margin">
        <div class="col-sm-12 col-md-12 col-lg-12 ">
            <div class="buy_tab">
                <span>户型</span>
                <a class="pull-right" href="<%=path%>/house/houseList">更多</a>
            </div>
            <div class="col-sm-6 col-md-8 col-lg-9">
                <c:forEach items="${requestScope.houses}" var="house" end="7">
                    <div class="col-sm-6 col-md-4 col-lg-3 ">
                        <div class="thumbnail">
                            <a href="<%=path%>/house/detail?house.id=${house.id}">
                                <c:if test="${house.logo != null }">
                                    <img alt="${house.name}" class="img-responsive img-rounded" src="<%=path %>/${house.logo }"style="height: 150px;"/>
                                </c:if>
                                <c:if test="${house.logo == null }">
                                    <img alt="${house.name}" class="img-responsive img-rounded" src="<%=path%>/img/type/housetype1.JPG"style="height: 150px;"/>
                                </c:if>
                            </a>
                            <div class="caption">
                                <a target="_blank" href="<%=path%>/house/detail?house.id=${house.id}">${house.name}</a>
                                <div class="pull-right text1"><span >${house.area}m²</span></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 first2 ">
                <div class="buy_tab1 ">
                    <span>推荐户型</span>
                </div>
                <ul>
                    <c:forEach items="${requestScope.houses}" var="house" begin="8" end="11">
                        <li class="list-unstyled">
                            <span class="news">
                                <a href="<%=path%>/house/detail?house.id=${house.id}"><img src="<%=path%>/${house.logo}" width="120px;" height="85px;"></a>
                            </span>
                            <h4><a href="<%=path%>/house/detail?house.id=${house.id}">经典户型</a></h4>
                            <p><a href="<%=path%>/house/detail?house.id=${house.id}">${house.name}</a></p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

    <%--广告位2--%>
    <div class="margin">
        <div class="col-sm-12 col-md-12 col-lg-12 ">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="row">
                    <c:choose>
                        <c:when test="${requestScope.ads.size() > 0}">
                            <c:forEach items="${requestScope.ads}" var="ad" varStatus="count">
                                <c:if test="${ad.showOrder == 2}">
                                    <a href="<%=path %>/${ad.adUrl}"><img src="<%=path %>/${ad.logo}" height="150px;" width="100%;"></a>
                                </c:if>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <img src="<%=path %>/img/ads_default.png" height="150px;" width="100%;">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

        <%@ include file="../master/foot.jsp"%>
</div>
<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        $('#circleContent').carousel({interval:3000});//每隔3秒自动轮播
    });
</script>
</body>
</html>
