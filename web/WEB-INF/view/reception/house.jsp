<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/13
  Time: 14:51
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
    <title>户型详情</title>
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/css/mains.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
</head>
<body>

<div>
    <ul class="nav nav-tabs  edge">
        <li class="mates"><h6 ><a href="<%=path%>/home/homePager">首页 &nbsp; &nbsp;</a></h6></li>
        <li class="mates"><h6><a href="<%=path%>/builds/listPager">&nbsp;&nbsp;楼盘 &nbsp;&nbsp;</a></h6></li>
        <li class="mates"><h6><a href="<%=path%>/activity/listPager">&nbsp;&nbsp;热门活动 &nbsp;&nbsp;</a></h6></li>
        <c:if test="${sessionScope.user!=null}">
            <a class="pull-right " style="margin-top: 6px;margin-left: 15px;" href="<%=path%>/user/logout">安全退出</a>
        </c:if>
        <c:choose>
            <c:when test="${sessionScope.user.name!=null && sessionScope.user.name!=''}">
                <a class="pull-right "  style="margin-top: 6px" href="<%=path%>/user/userCenter">${sessionScope.user.name}</a>
            </c:when>
            <c:otherwise>
                <a class="pull-right "style="margin-top: 6px" href="<%=path%>/user/userCenter">${sessionScope.user.phone}</a>
            </c:otherwise>
        </c:choose>
        <c:if test="${sessionScope.user==null}">
            <li class="pull-right ">
                <div class="dropdown" style="top: 4px;">
                    <a  class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        注册
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu4">
                        <li><a href="<%=path%>/agency/regPage">经销商</a></li>
                        <li><a href="<%=path%>/user/userRegisterPage">用户</a></li>
                    </ul>
                </div>
            </li>
            <li class="pull-right ">
                <div class="dropdown" style="top: 4px;left: -16px;">
                    <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        登录
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu4">
                        <li><a href="<%=path%>/agency/loginPage">经销商</a></li>
                        <li><a href="<%=path%>/user/userLoginPage">用户</a></li>
                        <li><a href="<%=path%>/employee/employeeLoginPager">员工</a></li>
                    </ul>
                </div>
            </li>
        </c:if>

    </ul>
</div>
<div class="edges">
        <span class=" logo">
            <a href="<%=path%>/home/homePager">
                <img src="<%=path%>/img/LOGO.png" alt="Responsive image">
            </a>
        </span>
    <div class="search-input ">

        <div class="input-group pull-right"  style="width: 40%;">
            <div class="search01" id="search">
                <ul>
                    <li><a href="javascript:void(0);">楼盘</a></li>
                    <li><a href="javascript:void(0);">户型</a></li>
                    <li><a href="javascript:void(0);">文章</a></li>
                    <li><a href="javascript:void(0);">活动</a></li>
                </ul>
            </div >
            <div class="search2">
                <input type="text" class="form-control" id="searchTxt" placeholder="请输入您要搜索的关键词：" value="" ></div>
            <ul id="search_ul" hidden style="position: absolute;left: 0;min-width: 99%;line-height: 36px;padding: 5px 0;box-shadow: 0 2px 4px rgba(0,0,0,.12);border: 1px solid #d2d2d2;background-color: #fcfaff;z-index: 100;border-radius: 2px;white-space: nowrap;width: 567px;"></ul>
            <%--<span class="input-group-btn search">--%>
                <%--<button class="btn btn-danger but1" id="btnSearch" type="button">搜索</button>--%>
            <%--</span>--%>
        </div>
    </div>
</div>

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

<%--户型详情--%>
<div class="margin">
    <div>
        <h6>当前位置：<a href="<%=path%>/">首页</a>><a href="<%=path%>/house/houseList">户型</a> > 户型详情</h6>
    </div>
    <div class="col-sm-12 col-md-12 col-lg-12 ">
        <div class="col-lg-12 col-md6 col-lg-6 thumbnail">
            <img src="<%=path%>/${requestScope.house.logo }">
        </div>
        <div class="col-lg-12 col-md6 col-lg-6  install">
            <h3>${requestScope.house.name }</h3>
            <p><span class="text08">参考价格：</span><span class="text07" id="unitPrice">${requestScope.house.unitPrice }</span>元/㎡</p>
            <p><span class="text08">面积：</span><span id="area">${requestScope.house.area }</span>㎡</p>
            <p><span class="text08">楼盘名称：</span><span><a href="<%=path %>/builds/personInfo?id=${requestScope.house.buildings.id }">${requestScope.house.buildings.name }</a></span></p>
            <p><span class="text08">开发商：</span><span><a href="<%=path %>/agency/detail?agency.id=${requestScope.house.agency.id}">${requestScope.house.agency.name }</a></span></p>
            <p><span class="text08">地址：</span><span>${requestScope.house.buildings.address }</span></p>
            <p><span class="text08">简介：</span><span>${requestScope.house.intro }</span></p>
        </div>
    </div>
</div>

<%--贷款计算器--%>
<div class="margin">
    <div class="col-sm-12 col-md-12 col-lg-12 ">
        <div class="buy_tab ">
            <span>贷款计算器</span>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-12 ">
            <%@include file="../master/calc.inc.jsp"%>
        </div>
    </div>
</div>
<%--版权--%>
<%@ include file="../master/foot.jsp" %>
</body>
<script>
    $(function () {
        $("#calcValue").val(($("#unitPrice").text() * $("#area").text())/10000);
        $("#calc").trigger("click");
    });
</script>
<script src="<%=path %>/plugins/jquery.min.js"></script>
<script src="<%=path %>/js/search/search.js"></script>
</html>
