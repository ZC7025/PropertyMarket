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
        <li><a href="<%=path%>/activity/listPager"  class="nav_bg">活动</a></li>
        <li><a href="<%=path%>/article/listPager">文章</a></li>
    </ul>
</div>

<div class="margin">
    <div>
        <h6>当前位置：<a href="<%=path%>/home/homePager">首页</a>><a href="<%=path%>/article/listPager">文章</a> > 文章详情</h6>
    </div>

    <div class="row">
        <div class="col-md-12 column">
            <table class="table table-condensed" id="top">
                <tr>
                    <td width=400px;>
                        <div id="demon">
                            <input type="hidden" name="id"	value=${requestScope.article.id } />
                            <span>
                                <c:if test="${requestScope.article.logo != null }">
                                    <img alt="image" class="img-responsive img-rounded" src="<%= path%>/${requestScope.article.logo }"/>
                                </c:if>
                                <c:if test="${requestScope.article.logo == null }">
                                    <img alt="image" class="img-responsive img-rounded" src="<%=path%>/img/journalism/journalism4.jpg" />
                                </c:if>
                            </span>
                        </div>
                    </td>
                    <td>
                        <div id="left">
                            <div style=margin-left:30px;>
                                <h3>标题：${requestScope.article.title }</h3>
                                <h4>所属类型：${requestScope.article.articleType.name }</h4>
                                <%--<h4>内容：${requestScope.article.content }</h4>--%>
                                <h4>摘要：${requestScope.article.abstracts }</h4>
                                <div class="caption">
                                    <h5>创建时间：<fmt:formatDate value="${requestScope.article.createdTime}" pattern="yyyy-MM-dd"></fmt:formatDate></h5>
                                </div>

                            </div>
                        </div>
                    </td>
                </tr>

            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12 ">
            <div class="buy_tab ">
                <span>内容</span>
            </div>
            <h4>${requestScope.article.content }</h4>
        </div>
    </div>
</div>

<%@ include file="../master/foot.jsp"%>

<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
</body>
</html>
