<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/6
  Time: 20:30
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
    <title>楼盘详情</title>
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/css/mains.css">
    <link rel="stylesheet" href="<%=path%>/plugins/sweet-alert/sweet-alert.css">
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
    <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/Favicon.ico" />
    <style>
        #map {
            height:500px;
        }
    </style>
</head>
<body>

<%--首版和搜索--%>
<%@ include file="../master/head.jsp"%>

<%--导航条--%>
<div class=" navbar-collapse collapse nav navbar-default">
    <ul class="nav navbar-nav ">
        <li><a href="<%=path%>/home/homePager" class="nav_bg">&nbsp;首页</a></li>
        <li><a href="<%=path%>/builds/listPager">楼盘</a></li>
        <li><a href="<%=path%>/house/houseList" class="nav_bg">户型</a></li>
        <li><a href="<%=path%>/activity/listPager"  class="nav_bg">活动</a></li>
        <li><a href="<%=path%>/article/listPager" class="nav_bg">文章</a></li>
    </ul>
</div>

<%--楼盘详情--%>
<div class="margin">
    <div>
        <h6>当前位置：<a href="<%=path%>/home/homePager">首页</a>><a href="<%=path%>/builds/listPager">楼盘</a> > 楼盘详情</h6>
    </div>
    <div class="col-sm-12 col-md-12 col-lg-12 ">
        <div class="col-lg-12 col-md6 col-lg-6 thumbnail">
            <c:if test="${requestScope.buildings.logo != null }">
                <img alt="image" class="img-responsive img-rounded" src="<%= path%>/${requestScope.buildings.logo }"/>
            </c:if>
            <c:if test="${requestScope.buildings.logo == null }">
                <img alt="image" class="img-responsive img-rounded" src="<%=path%>/img/building/lcon1.jpg"/>
            </c:if>
        </div>
        <div class="col-lg-12 col-md6 col-lg-6  install">
            <h3>${requestScope.buildings.name}</h3>
            <p><span class="text06">参考价格：</span><span class="text07"> ${requestScope.buildings.avgPrice} </span>元/㎡</p>
            <p><h4>户数：${requestScope.buildings.totalRooms}</h4></p>
            <p><h4>车位数：${requestScope.buildings.carStation}</h4></p>
            <p><h4>开盘时间：<fmt:formatDate value="${requestScope.buildings.openDate}" pattern="yyyy-MM-dd"></fmt:formatDate></h4></p>
            <p><h4>开发商：<a href="<%=path %>/agency/detail?agency.id=${requestScope.buildings.agency.id}">${requestScope.buildings.agency.name}</a></h4></p>
            <p><h4>地址：${requestScope.buildings.area}${requestScope.buildings.address}</h4></p>
            <c:choose>
                <c:when test="${requestScope.appointment ==null}">
                    <button id="appButton" class="btn btn-primary" onclick="appointment()" >预约</button>
                    <button id="delAppButton" class="btn btn-danger" onclick="delAppointment()" style="display: none;">取消预约</button>
                </c:when>
                <c:otherwise>
                    <button id="appButton" class="btn btn-primary" onclick="appointment()" style="display: none;">预约</button>
                    <button id="delAppButton" class="btn btn-danger" onclick="delAppointment()" >取消预约</button>
                </c:otherwise>
            </c:choose>
            <input type="hidden" value="${requestScope.userId}" id="userId">
            <input type="hidden" value="${requestScope.buildings.id}" id="buildsId">
            <input type="hidden" value="${requestScope.buildings.agency.id}" id="agencyId">
            <input type="hidden" value="${requestScope.appointment.id}" id="appointmentId">
            <c:if test="${requestScope.like == null }">
                <img onclick="like();" src="<%=path %>/img/unclick.svg" class="click" />
            </c:if>
            <c:if test="${requestScope.like != null }">
                <img onclick="like();" src="<%=path %>/img/clicked.svg" class="click" />
            </c:if>
        </div>
    </div>
    <div class="col-sm-12 col-md-12 col-lg-12 ">
    <div class="buy_tab ">
        <span>详细信息</span>
    </div>
    <div class="col-lg-12 col-md6 col-lg-6  install">
        <p><span>接待地址：${requestScope.buildings.receptionAddress}</span></p>
        <p><span>售楼电话：${requestScope.buildings.tel}</span></p>
        <p><span>占地面积：${requestScope.buildings.floorArea}</span></p>
        <p><span>建筑面积：${requestScope.buildings.buildingArea}平米</span></p>
        <p><span>房源类型：${requestScope.buildings.houseType}平米</span></p>
        <p><span>建筑类型：${requestScope.buildings.buildingType}</span></p>
    </div>
    <div class="col-lg-12 col-md6 col-lg-6  install">
        <p><span>绿化率：${requestScope.buildings.greenRatio}%</span></p>
        <p><span>容积率：${requestScope.buildings.plotRatio}%</span></p>
        <p><span>物业费：${requestScope.buildings.propertyFee}</span></p>
        <p><span>交通状况：${requestScope.buildings.traffic}</span></p>
        <p><span>周边配套：${requestScope.buildings.equipments}</span></p>
        <p><span>简介：${requestScope.buildings.intro}</span></p>
        </div>
    </div>
</div>

<%--楼盘户型--%>
<div class="margin">
    <div class="col-sm-12 col-md-12 col-lg-12 ">
        <div class="buy_tab ">
            <span>所有户型</span>
            <c:if test="${requestScope.buildings.houses.size() != 0}">
                <a class="pull-right" href="<%=path%>/house/moreHouseLogo?buildingsId=${requestScope.buildings.id}">更多</a>
            </c:if>
            <c:if test="${requestScope.buildings.houses.size() == 0}">
                <a class="pull-right"></a>
            </c:if>
        </div>
        <div id="nanoGallery2" class="pull-left" >
            <c:choose>
                <c:when test="${requestScope.buildings.houses.size() != 0}">
                    <c:forEach items="${requestScope.buildings.houses}" var="h" end="3">
                        <c:choose>
                            <c:when test="${h.logo != ''}">
                                <a href="<%=path%>/house/detail?house.id=${h.id}">
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                        <div class="thumbnail">
                                     <span>
                                         <img alt="image" class="img-responsive img-rounded" src="<%= path%>/${h.logo }" style="width:100%;height:230px;"/>
                                     </span>
                                                ${h.name}
                                        </div>
                                    </div>
                                </a>
                            </c:when>
                            <c:when test="${h.logo == ''}">
                                <a href="<%=path%>/house/detail?house.id=${h.id}">
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                                        <div class="thumbnail">
                                             <span>
                                                 <img alt="image" class="img-responsive img-rounded" src="<%= path%>/img/building/lcon4.jpg" style="width:100%;height:230px;"/>
                                             </span>
                                             ${h.name}
                                        </div>
                                    </div>
                                </a>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div style="height:230px;">
                        &nbsp;&nbsp;<h3>暂无数据</h3>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>

<div class="margin">
    <div class="col-sm-12 col-md-12 col-lg-12 ">
        <div class="buy_tab ">
            <span>楼盘相册</span>
            <c:if test="${requestScope.buildings.buildingsImgs.size() != 0}">
                <a class="pull-right" href="<%=path%>/buildsImg/moreImg?buildingsId=${requestScope.buildings.id}">更多</a>
            </c:if>
            <c:if test="${requestScope.buildings.buildingsImgs.size() == 0}">
                <a class="pull-right"></a>
            </c:if>
        </div>
        <c:choose>
            <c:when test="${requestScope.buildings.buildingsImgs.size() != 0}">
                <div>
                    <c:forEach items="${requestScope.buildings.buildingsImgs}" var="h" end="3">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
                            <div class="thumbnail">
                        <span>
                            <img alt="image" class="img-responsive img-rounded" src="<%= path%>/${h.imgPath }" style="width:250px; height:230px;"/>
                     </span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div style="height:230px;">
                    &nbsp;&nbsp;<h3>暂无数据</h3>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>
<div class="margin">
    <div class="col-sm-12 col-md-12 col-lg-12">
        <div class="buy_tab ">
            <span>百度地图</span>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-12 thumbnail">
            <input type="hidden" id="longitude" value="${requestScope.buildings.longitude}">
            <input type="hidden" id="latitude" value="${requestScope.buildings.latitude}">
            <div id="map"></div>
        </div>
    </div>
</div>

<div class="margin">
    <div class="col-sm-12 col-md-12 col-lg-12 ">
        <div class="buy_tab ">
            <span>留言评价</span>
        </div>
        <div class="col-sm12 col-md12 col-lg-12 thumbnail">
            <div>
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active">
                        <a href="#home" data-toggle="tab" onclick="appendMessage(1);">留言</a></li>
                    <li><a href="#ios" data-toggle="tab" onclick="appendComment(1);">评价</a></li>
                </ul>
                <%--留言--%>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="home">
                        <div class="row">
                            <form class="form-group" id="messageForm">
                                <textarea style="width:90%;resize: vertical;" rows="5" id="message" class="validate[required]" name="message.content"></textarea>
                                <a href="javascript:void(0);" class="btn btn-info pull-right juli" style="width:5%;" onclick="message();">留言</a>
                            </form>
                        </div>
                        <div class="container" id="messageRow"></div>
                        <div class="container">
                            <div class="col-sm-12">
                                <nav aria-label="Page navigation" class="pull-center">
                                    <ul class="pagination">
                                        <li><a href="javascript:void(0);" onclick="appendMessage(${requestScope.page - 1});">上一页</a></li>
                                        <li><a href="javascript:void(0);" onclick="appendMessage(1);">首页</a></li>
                                        <li><a href="javascript:void(0);" onclick="appendMessage(${requestScope.totalPage});">尾页</a></li>
                                        <li><a href="javascript:void(0);" onclick="appendMessage(${requestScope.page + 1});">下一页</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <%--评价--%>
                    <div class="tab-pane fade" id="ios">
                        <div class="row">
                            <form class="form-group" id="commentForm">
                                <textarea style="width:90%;resize: vertical;" rows="5" id="comment" class="validate[required]" name="comment.content"></textarea>
                                <a href="javascript:void(0);" class="btn btn-info pull-right juli" style="width:5%;" onclick="comment();">评价</a>
                            </form>
                        </div>
                        <div class="container" id="commentRow"></div>
                        <div class="container">
                            <div class="col-sm-12">
                                <nav aria-label="Page navigation" class="pull-center">
                                    <ul class="pagination">
                                        <li><a href="javascript:void(0);" onclick="appendComment(${requestScope.page - 1});">上一页</a></li>
                                        <li><a href="javascript:void(0);" onclick="appendComment(1);">首页</a></li>
                                        <li><a href="javascript:void(0);" onclick="appendComment(${requestScope.totalPage});">尾页</a></li>
                                        <li><a href="javascript:void(0);" onclick="appendComment(${requestScope.page + 1});">下一页</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--版权--%>
<%@ include file="../master/foot.jsp"%>

<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path %>/js/main.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>

<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="http://api.map.baidu.com/api?v=2.0&ak=KjEQlPmSO1aM6G9cFGCQd7WL0arGC6zE"></script>
<script type="text/javascript">
    var map = new BMap.Map("map");    // 创建Map实例
    var point = new BMap.Point($("#longitude").val(),$("#latitude").val());
    map.centerAndZoom(point, 13);  // 初始化地图,设置中心点坐标和地图级别
    map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    var marker = new BMap.Marker(point);  // 创建标注
    map.addOverlay(marker);               // 将标注添加到地图中
    marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
</script>
<script src="<%=path %>/js/buildings/front_builds.js"></script>
</body>
</html>
