<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/4
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>文章</title>
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/css/mains.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
</head>
<body>

<%@ include file="../master/head.jsp"%>
<%--导航条--%>
<div class=" navbar-collapse collapse nav navbar-default">
    <ul class="nav navbar-nav ">
        <li><a href="<%=path%>/home/homePager"  class="nav_bg" >&nbsp;首页</a></li>
        <li><a href="<%=path%>/builds/listPager"  class="nav_bg">楼盘</a></li>
        <li><a href="<%=path%>/house/houseList" class="nav_bg">户型</a></li>
        <li><a href="<%=path%>/activity/listPager"  class="nav_bg">活动</a></li>
        <li><a href="<%=path%>/article/listPager">文章</a></li>
    </ul>
</div>


<div class="margin">

    <div>
        <h6>当前位置：<a href="<%=path%>/home/homePager">首页</a> > 文章</h6>
    </div>
    <c:forEach items="${requestScope.articles}" var="a">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
            <div class="thumbnail">
                <input type="hidden" name="id" value=${a.id }/>
                <a href="<%= path%>/article/personInfor?id=${a.id }">
                     <span>
                         <c:if test="${a.logo != null }">
                             <img alt="image" class="img-responsive img-rounded" src="<%= path%>/${a.logo }" style="width:356px; height:230px;"/>
                         </c:if>
                         <c:if test="${a.logo == null }">
                             <img alt="image" class="img-responsive img-rounded" src="<%=path%>/img/journalism/journalism1.jpg" style="width:356px; height:230px;"/>
                         </c:if>
                     </span>
                <div class="caption">
                    <h3 class="title">${a.title }</h3>
                </div>
                </a>
                <div>
                    <h4>所属类型：${a.articleType.name}</h4>
                    <h4>发布时间：<fmt:formatDate value="${a.createdTime}" pattern="yyyy-MM-dd"></fmt:formatDate></h4>
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
                            <li><a href="${pageContext.request.contextPath }/article/listPager?page=${page - 1}&pageSize=6">上一页</a></li>
                            <li><a href="${pageContext.request.contextPath }/article/listPager?page=1&pageSize=6">首页</a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${requestScope.page == requestScope.totalPage || requestScope.page > requestScope.totalPage }">
                            <li><a href="#" class="btn disabled">尾页</a></li>
                            <li><a href="#" class="btn disabled">下一页</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="<%=path%>/article/listPager?page=${totalPage}&pageSize=6">尾页</a></li>
                            <li><a href="<%=path%>/article/listPager?page=${page + 1}&pageSize=6">下一页</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </div>
    </div>
</div>


<%@ include file="../master/foot.jsp"%>


<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>

</body>
</html>
