<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/26
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>基本信息</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
</head>
<body>
<div class="container">
    <div class="row">
        <h1>基本信息</h1>
        <table class="table table-hover">

            <tbody>
            <tr>
                <th>名称</th>
                <th>${sessionScope.agency.name }</th>
            </tr>
            <tr>
                <th>负责人</th>
                <th> ${sessionScope.agency.leader }</th>
            </tr>
            <tr>
                <th>邮箱</th>
                <th>${sessionScope.agency.email }</th>
            </tr>
            <tr>
                <th>手机号</th>
                <th>${sessionScope.agency.phone }</th>
            </tr>
            <tr>
                <th>固定电话</th>
                <th>${sessionScope.agency.tel }</th>
            </tr>
            <tr>
                <th>地址</th>
                <th>${sessionScope.agency.address}</th>
            </tr>

            <tr>
                <th>简介</th>
                <th>${sessionScope.agency.intro }</th>
            </tr>
            <tr>
                <th>创建时间</th>
                <th>
                    <fmt:formatDate value="${sessionScope.agency.createdTime }" pattern="yyyy-MM-dd"></fmt:formatDate>
                </th>
            </tr>
            </tbody>
        </table>
        <a href="<%=path %>/agency/updatePage" class="btn btn-primary btn-lg">修改</a>
    </div>
</div>
</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="<%=path %>/js/agency/agency.js"></script>
</html>
