<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/28
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加楼盘</title>
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
            <h3 class="text-center">添加楼盘</h3>
            <form id="add" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control validate[required]" name="buildings.name" placeholder="请输入楼盘名" data-errormessage-value-missing="请输入楼盘名" />
                </div>
                <div class="form-group form-inline">
                    <div id="distpicker"> <%--所属区域--%>
                        <fieldset disabled>
                            <div class="form-group">
                                <label class="sr-only" for="province">Province</label>
                                <select class="form-control" id="province"></select>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="city">City</label>
                                <select class="form-control" id="city"></select>
                            </div>
                        </fieldset>
                        <div class="form-group">
                            <label class="sr-only" for="district">District</label>
                            <select class="form-control" id="district" name="district"></select>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary" id="reset" type="button">重置</button>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required]" name="buildings.address" placeholder="请输入地址" data-errormessage-value-missing="请输入地址" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[number],min[0]]" id="area" name="buildings.floorArea" placeholder="请输入占地面积" data-errormessage-value-missing="请输入占地面积" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[number],min[0]]" name="buildings.buildingArea" placeholder="请输入建筑面积" data-errormessage-value-missing="请输入建筑面积" />
                </div>
                <div class="form-group form-inline">
                    <label>房源类型：</label>
                    <select class="form-control" name="buildingType">
                        <option class="form-control" value="商品房" selected>商品房</option>
                        <option class="form-control" value="商业用房">商业用房</option>
                        <option class="form-control" value="公寓">公寓</option>
                        <option class="form-control" value="商铺">商铺</option>
                        <option class="form-control" value="写字楼">写字楼</option>
                    </select>

                    <label>&nbsp;&nbsp;&nbsp;&nbsp;建筑类型：</label>
                    <select class="form-control" name="houseType">
                        <option class="form-control" value="塔楼" selected>塔楼</option>
                        <option class="form-control" value="板楼">板楼</option>
                    </select>
                </div>
                <div class="form-group form-inline">
                    <input type="text" class="form-control validate[required]" name="jwd" placeholder="请输入经纬度,以英文逗号分隔" data-errormessage-value-missing="请输入经纬度" style="width: 266px;" />
                    <a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_Blank"><small>不知道经纬度？点击这里来帮你！</small></a>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[number],min[0]]" name="buildings.avgPrice" placeholder="请输入楼盘均价" data-errormessage-value-missing="请输入楼盘均价" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required]" name="buildings.company" placeholder="请输入开发公司" data-errormessage-value-missing="请输入开发公司" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="请选择开盘日期" id="openDate" name="buildings.openDate" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,custom[integer],min[0]]" name="buildings.totalRooms" placeholder="请输入总套数" data-errormessage-value-missing="请输入总套数" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required]" name="buildings.receptionAddress" placeholder="请输入接待地址" data-errormessage-value-missing="请输入接待地址" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[required,minSize[7],maxSize[11],custom[number]]" name="buildings.tel" placeholder="请输入售楼部电话" data-errormessage-value-missing="请输入售楼部电话" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[max[100],min[0],custom[number]]" name="buildings.greenRatio" placeholder="请输入绿化率" data-errormessage-value-missing="请输入绿化率" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[max[100],min[0],custom[number]]" name="buildings.plotRatio" placeholder="请输入容积率" data-errormessage-value-missing="请输入容积率" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="buildings.propertyCompany" placeholder="请输入物业公司" data-errormessage-value-missing="请输入物业公司" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[min[0],custom[number]]" name="buildings.propertyFee" placeholder="请输入物业费" data-errormessage-value-missing="请输入物业费" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control validate[min[0],custom[integer]]" name="buildings.carStation" placeholder="请输入车位数" data-errormessage-value-missing="请输入车位数" />
                </div>
                <div class="form-group">
                    <textarea type="text" style="resize: vertical;" rows="5" class="form-control" name="buildings.traffic" id="traffic" placeholder="请输入交通状况" data-errormessage-value-missing="请输入交通状况"></textarea>
                </div>
                <div class="form-group">
                    <textarea type="text" style="resize: vertical;" rows="5" class="form-control" name="buildings.equipments" id="equipments" placeholder="请输入周边配套" data-errormessage-value-missing="请输入周边配套"></textarea>
                </div>
                <div class="form-group form-inline">
                    <label>楼盘封面：</label>
                    <input type="file" class="form-control" name="upload" />
                </div>
                <div class="form-group">
                    <textarea type="text" style="resize: vertical;" rows="5" class="form-control" name="buildings.intro" id="intro" placeholder="请输入简介" data-errormessage-value-missing="请输入简介"></textarea>
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="add();">添加</a>
        </div>
    </div>
</div>
</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jQuery.form.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path %>/plugins/distpicker/distpicker.data.js"></script>
<script src="<%=path %>/plugins/distpicker/distpicker.js"></script>
<script src="<%=path %>/plugins/distpicker/main.js"></script>
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
