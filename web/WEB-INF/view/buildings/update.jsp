<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/31
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改楼盘</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
    <link href="<%=path %>/plugins/layDate/theme/default/laydate.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row" style="margin-left:5%;margin-top:30px">
        <a href="<%=path %>/builds/listPage" class="btn btn-primary">返回列表</a>
    </div>
    <div class="row">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">修改楼盘</h3>
            <form id="update" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control validate[required]" name="buildings.name" placeholder="请输入楼盘名" data-errormessage-value-missing="请输入楼盘名" value="${requestScope.buildings.name }" />
                </div>
                <div class="form-group"><%--所属区域--%>
                    <div class="form-group form-inline">
                        <label>所属区域：</label>
                        <input type="text" class="form-control" value="江西省赣州市" disabled readonly />
                        <select class="form-control" name="district">
                            <option class="form-control" value="章贡区" <c:if test="${requestScope.district == '章贡区' }">selected</c:if>>章贡区</option>
                            <option class="form-control" value="南康区" <c:if test="${requestScope.district == '南康区' }">selected</c:if>>南康区</option>
                            <option class="form-control" value="赣县" <c:if test="${requestScope.district == '赣县' }">selected</c:if>>赣县</option>
                            <option class="form-control" value="信丰县" <c:if test="${requestScope.district == '信丰县' }">selected</c:if>>信丰县</option>
                            <option class="form-control" value="大余县" <c:if test="${requestScope.district == '大余县' }">selected</c:if>>大余县</option>
                            <option class="form-control" value="上犹县" <c:if test="${requestScope.district == '上犹县' }">selected</c:if>>上犹县</option>
                            <option class="form-control" value="崇义县" <c:if test="${requestScope.district == '崇义县' }">selected</c:if>>崇义县</option>
                            <option class="form-control" value="安远县" <c:if test="${requestScope.district == '安远县' }">selected</c:if>>安远县</option>
                            <option class="form-control" value="龙南县" <c:if test="${requestScope.district == '龙南县' }">selected</c:if>>龙南县</option>
                            <option class="form-control" value="定南县" <c:if test="${requestScope.district == '定南县' }">selected</c:if>>定南县</option>
                            <option class="form-control" value="全南县" <c:if test="${requestScope.district == '全南县' }">selected</c:if>>全南县</option>
                            <option class="form-control" value="宁都县" <c:if test="${requestScope.district == '宁都县' }">selected</c:if>>宁都县</option>
                            <option class="form-control" value="于都县" <c:if test="${requestScope.district == '于都县' }">selected</c:if>>于都县</option>
                            <option class="form-control" value="兴国县" <c:if test="${requestScope.district == '兴国县' }">selected</c:if>>兴国县</option>
                            <option class="form-control" value="会昌县" <c:if test="${requestScope.district == '会昌县' }">selected</c:if>>会昌县</option>
                            <option class="form-control" value="寻乌县" <c:if test="${requestScope.district == '寻乌县' }">selected</c:if>>寻乌县</option>
                            <option class="form-control" value="石城县" <c:if test="${requestScope.district == '石城县' }">selected</c:if>>石城县</option>
                            <option class="form-control" value="瑞金市" <c:if test="${requestScope.district == '瑞金市' }">selected</c:if>>瑞金市</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required]" name="buildings.address" placeholder="请输入地址" data-errormessage-value-missing="请输入地址" value="${requestScope.buildings.address }" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[number],min[0]]" value="${requestScope.buildings.floorArea }" name="buildings.floorArea" placeholder="请输入占地面积" data-errormessage-value-missing="请输入占地面积" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[number],min[0]]" value="${requestScope.buildings.buildingArea }" name="buildings.buildingArea" placeholder="请输入建筑面积" data-errormessage-value-missing="请输入建筑面积" />
                </div>
                <div class="form-group form-inline">
                    <label>房源类型：</label>
                    <select class="form-control" name="buildingType">
                        <option class="form-control" value="商品房" <c:if test="${requestScope.buildings.buildingType == '商品房' }">selected</c:if>>商品房</option>
                        <option class="form-control" value="商业用房" <c:if test="${requestScope.buildings.buildingType == '商业用房' }">selected</c:if>>商业用房</option>
                        <option class="form-control" value="公寓" <c:if test="${requestScope.buildings.buildingType == '公寓' }">selected</c:if>>公寓</option>
                        <option class="form-control" value="商铺" <c:if test="${requestScope.buildings.buildingType == '商铺' }">selected</c:if>>商铺</option>
                        <option class="form-control" value="写字楼" <c:if test="${requestScope.buildings.buildingType == '写字楼' }">selected</c:if>>写字楼</option>
                    </select>

                    <label>&nbsp;&nbsp;&nbsp;&nbsp;建筑类型：</label>
                    <select class="form-control" name="houseType">
                        <option class="form-control" value="塔楼" <c:if test="${requestScope.buildings.houseType == '塔楼' }">selected</c:if>>塔楼</option>
                        <option class="form-control" value="板楼" <c:if test="${requestScope.buildings.houseType == '板楼' }">selected</c:if>>板楼</option>
                    </select>
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control validate[required]" name="jwd" value="${requestScope.buildings.longitude },${requestScope.buildings.latitude }" placeholder="请输入经纬度" data-errormessage-value-missing="请输入经纬度" />
                    <a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_Blank"><small>不知道经纬度？点击这里来帮你！</small></a>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,min[0],custom[number]]" value="${requestScope.buildings.avgPrice }" name="buildings.avgPrice" placeholder="请输入楼盘均价" data-errormessage-value-missing="请输入楼盘均价" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required]" value="${requestScope.buildings.company }" name="buildings.company" placeholder="请输入开发公司" data-errormessage-value-missing="请输入开发公司" />
                </div>
                <div class="form-group form-inline">
                    <label>开盘时间：</label>
                    <input type="text" class="form-control" id="openDate" value="${requestScope.buildings.openDate }" name="buildings.openDate" readonly />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[integer],min[0]]" value="${requestScope.buildings.totalRooms }" name="buildings.totalRooms" placeholder="请输入总套数" data-errormessage-value-missing="请输入总套数" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required]" value="${requestScope.buildings.receptionAddress }" name="buildings.receptionAddress" placeholder="请输入接待地址" data-errormessage-value-missing="请输入接待地址" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[7],maxSize[11],custom[number]]" value="${requestScope.buildings.tel }" name="buildings.tel" placeholder="请输入售楼部电话" data-errormessage-value-missing="请输入售楼部电话" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[min[0],max[100],custom[number],min[0]]" value="${requestScope.buildings.greenRatio }" name="buildings.greenRatio" placeholder="请输入绿化率" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[min[0],max[100],custom[number],min[0]]" value="${requestScope.buildings.plotRatio }" name="buildings.plotRatio" placeholder="请输入容积率" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" value="${requestScope.buildings.propertyCompany }" name="buildings.propertyCompany" placeholder="请输入物业公司" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[custom[number],min[0]]" value="${requestScope.buildings.propertyFee }" name="buildings.propertyFee" placeholder="请输入物业费" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[custom[integer],min[0]]" value="${requestScope.buildings.carStation }" name="buildings.carStation" placeholder="请输入车位数" />
                </div>
                <div class="form-group">
                    <textarea type="text" style="resize: vertical;" rows="5" class="form-control" name="buildings.traffic" id="traffic" placeholder="请输入交通状况">${requestScope.buildings.traffic }</textarea>
                </div>
                <div class="form-group">
                    <textarea type="text" style="resize: vertical;" rows="5" class="form-control" name="buildings.equipments" id="equipments" placeholder="请输入周边配套">${requestScope.buildings.equipments }</textarea>
                </div>
                <div class="form-group form-inline">
                    <label>楼盘封面：</label>
                    <input type="file" class="form-control" name="upload" />
                </div>
                <div class="form-group">
                    <textarea type="text" style="resize: vertical;" rows="5" class="form-control" name="buildings.intro" id="intro" placeholder="请输入简介">${requestScope.buildings.intro }</textarea>
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="update();">修改</a>
        </div>
    </div>
</div>
</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jQuery.form.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path %>/plugins/layDate/laydate.js"></script>

<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="<%=path %>/js/buildings/buildings.js"></script>
<script>
    var nowDate = new Date();
    var dateStr = nowDate.getFullYear() + '-' + (nowDate.getMonth()+1) + '-' + nowDate.getDate();
    //限定可选日期
    var ins22 = laydate.render({
        elem: '#openDate'
        ,min: dateStr
        ,max: '2048-01-01'
        ,ready: function(){
            ins22.hint('日期可选值设定在 <br> '+ dateStr + ' 到 2048-01-01');
        }
    });
</script>
</html>
