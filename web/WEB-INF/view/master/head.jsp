<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/6
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
<div>
    <ul class="nav nav-tabs edge">
        <li ><h6 ><a href="<%=path%>/home/homePager"  style="margin-top:6px">首页 &nbsp; &nbsp;</a></h6></li>
        <li><h6><a href="<%=path%>/builds/listPager"  style="margin-top:6px">&nbsp;&nbsp;楼盘 &nbsp;&nbsp;</a></h6></li>
        <li><h6><a href="<%=path%>/activity/listPager"  style="margin-top:6px">&nbsp;&nbsp;热门活动 &nbsp;&nbsp;</a></h6></li>
        <c:choose>
            <c:when test="${sessionScope.user!=null}">
                <a class="pull-right" style="margin-top: 6px;margin-left: 15px;" href="<%=path%>/user/logout">安全退出</a>
            </c:when>
            <c:when test="${sessionScope.employee!=null}">
                <a class="pull-right" style="margin-top: 6px;margin-left: 15px;" href="<%=path%>/employee/logout">安全退出</a>
            </c:when>
            <c:when test="${sessionScope.agency!=null}">
                <a class="pull-right" style="margin-top: 6px;margin-left: 15px;" href="<%=path%>/agency/logout">安全退出</a>
            </c:when>
            <c:when test="${sessionScope.admin!=null}">
                <a class="pull-right" style="margin-top: 6px;margin-left: 15px;" href="<%=path%>/admin/logout">安全退出</a>
            </c:when>
        </c:choose>

        <c:choose>
            <c:when test="${sessionScope.user!=null}">
                <c:choose>
                    <c:when test="${sessionScope.user.name!=null && sessionScope.user.name!=''}">
                        <a class="pull-right " style="margin-top: 6px" href="<%=path%>/user/userCenter">${sessionScope.user.name}</a>
                    </c:when>
                    <c:otherwise>
                        <a class="pull-right " style="margin-top: 6px" href="<%=path%>/user/userCenter">${sessionScope.user.phone}</a>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:when test="${sessionScope.agency!=null}">
                <c:choose>
                    <c:when test="${sessionScope.agency.name!=null && sessionScope.agency.name!=''}">
                        <a class="pull-right " style="margin-top: 6px" href="<%=path%>/agency/home">${sessionScope.agency.name}</a>
                    </c:when>
                    <c:otherwise>
                        <a class="pull-right " style="margin-top: 6px" href="<%=path%>/agency/home">${sessionScope.agency.phone}</a>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:when test="${sessionScope.employee!=null}">
                <c:choose>
                    <c:when test="${sessionScope.employee.name!=null && sessionScope.employee.name!=''}">
                        <a class="pull-right " style="margin-top: 6px" href="<%=path%>/employee/toBackground">${sessionScope.employee.name}</a>
                    </c:when>
                    <c:otherwise>
                        <a class="pull-right " style="margin-top: 6px" href="<%=path%>/employee/toBackground">${sessionScope.employee.phone}</a>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${sessionScope.admin.name!=null && sessionScope.admin.name!=''}">
                        <a class="pull-right " style="margin-top: 6px" href="<%=path%>/admin/toBackground">${sessionScope.admin.name}</a>
                    </c:when>
                    <c:otherwise>
                        <a class="pull-right " style="margin-top: 6px" href="<%=path%>/admin/toBackground">${sessionScope.admin.phone}</a>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>

        <c:if test="${sessionScope.user == null && sessionScope.agency == null && sessionScope.employee == null && sessionScope.admin == null}">
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
                <ul id="search_ul" hidden style="position: absolute;left: 0;min-width: 99%;line-height: 36px;padding: 5px 0;box-shadow: 0 2px 4px rgba(0,0,0,.12);border: 1px solid #d2d2d2;background-color: #fcfaff;z-index: 100;border-radius: 2px;white-space: nowrap;width: 502px;"></ul>
        </div>
    </div>
</div>
<script src="<%=path %>/plugins/jquery.min.js"></script>
<script src="<%=path %>/js/search/search.js"></script>