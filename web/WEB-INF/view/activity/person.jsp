<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/4
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>活动</title>
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/css/mains.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
</head>
<body>
<%--首版--%>

<%@ include file="../master/head.jsp"%>

<%--导航条--%>
<div class=" navbar-collapse collapse nav navbar-default">
    <ul class="nav navbar-nav ">
        <li><a href="<%=path%>/home/homePager"  class="nav_bg" >&nbsp;首页</a></li>
        <li><a href="<%=path%>/builds/listPager"  class="nav_bg">楼盘</a></li>
        <li><a href="<%=path%>/house/houseList" class="nav_bg">户型</a></li>
        <li><a href="<%=path%>/activity/listPager">活动</a></li>
        <li><a href="<%=path%>/article/listPager" class="nav_bg">文章</a></li>
    </ul>
</div>

<div class="margin">
    <div>
        <h6>当前位置：<a href="<%=path%>/home/homePager">首页</a>><a href="<%=path%>/activity/listPager">活动</a> < 活动详情</h6>
    </div>
    <div class="row">
        <div class="col-md-12 column">
            <table class="table table-condensed" id="top">
                <tr>
                    <td width=400px;>
                        <div id="demon">
                            <input type="hidden" name="id"	value=${requestScope.activity.id } />
                            <span>
                                <c:if test="${requestScope.activity.logo != null }">
                                    <img alt="image" class="img-responsive img-rounded" src="<%= path%>/${requestScope.activity.logo }"/>
                                </c:if>
                                <c:if test="${requestScope.activity.logo == null }">
                                    <img alt="image" class="img-responsive img-rounded" src="<%=path%>/img/journalism/journalism1.jpg" />
                                </c:if>
                            </span>
                        </div>
                    </td>
                    <td>
                        <div id="left">
                            <div style=margin-left:30px;>
                                <h3>名称：${requestScope.activity.title }</h3>
                                <h4>地址：${requestScope.activity.address }</h4>
                                <div class="caption">
                                    <h4>活动时间：<fmt:formatDate value="${requestScope.activity.startTime}" pattern="yyyy-MM-dd"></fmt:formatDate>至<fmt:formatDate value="${requestScope.activity.endTime}" pattern="yyyy-MM-dd"></fmt:formatDate></h4>
                                </div>
                                <c:if test="${requestScope.activity.buildings != null}">
                                   <h4>楼盘名：<a href="<%=path %>/builds/personInfo?id=${requestScope.activity.buildings.id }">${requestScope.activity.buildings.name}</a></h4>
                                </c:if>

                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="buy_tab">
                <span>活动内容</span>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-12">
                <h4>${requestScope.activity.content }</h4>
            </div>
        </div>
    </div>
</div>

<%@ include file="../master/foot.jsp"%>

<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path%>/js/main.js"></script>
</body>
</html>
