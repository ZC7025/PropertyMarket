<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>账号审核中</title>
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/css/mains.css">
    <style>
    </style>
</head>
<body>
<div class="am-g">
    <div class="comt">
        <h1>PM欢迎您</h1>
    </div>
    <div>
        <img src="<%=path%>/img/timg.gif">
    </div>
    <div class="comt1">
        <p>管理员正在审核中。。。请耐心等待</p>
    </div>
    <div class="comt1">
        <button   type="button" class="btn btn-info">
            <a href="<%=path%>/home/homePager" >&nbsp;&nbsp;&nbsp;&nbsp;返&nbsp;回&nbsp;首&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;</a></button>
    </div>
</div>
<%--版权--%>
<%@ include file="../master/foot.jsp"%>

<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
</body>
</html>


