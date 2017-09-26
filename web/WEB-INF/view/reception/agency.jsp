<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/9
  Time: 8:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>经销商详情</title>
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/css/mains.css">
</head>
<body>
<%--首版和搜索--%>
<%@ include file="../master/head.jsp" %>

<%--导航条--%>
<div class=" navbar-collapse collapse nav navbar-default">
    <ul class="nav navbar-nav ">
        <li><a href="<%=path%>/home/homePager" class="nav_bg" >&nbsp;首页</a></li>
        <li><a href="<%=path%>/builds/listPager"  >楼盘</a></li>
        <li><a href="<%=path%>/house/houseList" class="nav_bg">户型</a></li>
        <li><a href="<%=path%>/activity/listPager"  class="nav_bg">活动</a></li>
        <li><a href="<%=path%>/article/listPager" class="nav_bg">文章</a></li>
    </ul>
</div>


<div class="margin">
    <div>
        <h6>当前位置：<a href="<%=path%>/home/homePager">首页</a>>经销商 </h6>
    </div>

    <div class="col-sm-12 col-md-12 col-lg-12 ">
        <div class="col-sm-12 col-md-12 col-lg-3 ">
            <c:if test="${requestScope.agency.logo != null }">
                <img alt="${requestScope.agency.name}" class="img-responsive img-rounded" src="<%= path%>/${requestScope.agency.logo }"/>
            </c:if>
            <c:if test="${requestScope.agency.logo == null }">
                <img alt="${requestScope.agency.name}" class="img-responsive img-rounded" src="<%=path%>/img/building/lcon1.jpg"/>
            </c:if>
        </div>
        <div class="col-sm-9 col-md-9 col-lg-7  install">
            <h3><a href="#">${requestScope.agency.name}</a>
            </h3>
            <p><span class="text08">负责人：</span><span>${requestScope.agency.leader}</span></p>
            <p><span class="text08">电话：</span><span>${requestScope.agency.tel}</span></p>
            <p><span class="text08">地址：</span><span>${requestScope.agency.address}</span></p>
            <p><span class="text08">简介：</span><span>${requestScope.agency.intro}</span></p>
        </div>
</div>

    <div class="col-sm-12 col-md-12 col-lg-12">
        <div class="buy_tab ">
            <span>在售楼盘</span>
            <%--<a class="pull-right" href="#" >更多</a>--%>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-12 ">
            <c:forEach items="${requestScope.agency.buildings}" var="b">
                <li class="body_div">
                    <input type="hidden" name="id" value=${b.id }/>
                    <a href="<%= path%>/builds/personInfo?id=${b.id }">
                          <span class="buy_t1">
                              <c:if test="${b.logo != null }">
                                  <img alt="image" class="img-responsive img-rounded" src="<%= path%>/${b.logo }" width="180px;" height="126px;"/>
                              </c:if>
                              <c:if test="${b.logo == null }">
                                  <img alt="image" class="img-responsive img-rounded" src="<%=path%>/img/building/lcon1.jpg" width="180px;" height="126px;"/>
                              </c:if>
                        </span>
                    </a>
                    <h3><a href="<%=path%>#">${b.name } </a>
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
        </div>
    </div>

    <div class="col-sm-12 col-md-12 col-lg-12">
        <div class="buy_tab ">
            <span>活动</span>
            <%--<a class="pull-right" href="#" >更多</a>--%>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-12 ">
            <c:forEach items="${requestScope.agency.activities}" var="a">
                <li class="body_div">
                    <div class="thumbnail" style="height: 150px;">
                        <input type="hidden" name="id" value=${a.id }/>
                        <a href="<%= path%>/activity/personInfor?id=${a.id }">
                         <span class="buy_t1">
                               <c:if test="${a.logo != null }">
                                   <img alt="image" class="img-responsive img-rounded" src="<%= path%>/${a.logo }" width="180px;" height="126px;"/>
                               </c:if>
                              <c:if test="${a.logo == null }">
                                  <img alt="image" class="img-responsive img-rounded" src="<%=path%>/img/journalism/journalism1.jpg" width="180px;" height="126px;"/>
                              </c:if>
                            </span>
                        </a>
                        <a href="<%= path%>/activity/personInfor?id=${a.id }"><h3 class="title">${a.title }</h3></a>
                        <h4>活动楼盘：<a href="<%=path %>/builds/personInfo?id=${a.buildings.id }">${a.buildings.name }</a></h4>
                        <h4>活动时间：<fmt:formatDate value="${a.startTime}" pattern="yyyy-MM-dd"></fmt:formatDate></h4>
                    </div>
                </li>
            </c:forEach>
            </div>
        </div>
    </div>

</div>

<%--版权--%>
<%@ include file="../master/foot.jsp" %>
<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
</body>
</html>
