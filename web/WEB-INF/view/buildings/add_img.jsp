<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/9/1
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加楼盘图片</title>
    <%@include file="../master/style.inc.jsp"%>
</head>
<body>
<div class="container">
    <div class="row" style="margin-left:5%;margin-top:30px">
        <a href="<%=path %>/builds/listPage" class="btn btn-primary">返回列表</a>
    </div>
    <div class="row">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">添加楼盘图片</h3>
            <form id="add">
                <div class="form-group">
                    <input type="hidden" name="buildingsId" value="${requestScope.buildingsId }"/>
                </div>
                <div class="form-group">
                    <label onclick="$('#upload').click();">点击添加图片</label>
                    <div id="preview" class="col-lg-3" onclick="$('#upload').click();">
                        <img id="imghead" border="0" src="<%=path %>/img/headDefault.png" onclick="$('#upload').click();" width="100%">
                    </div>
                    <input type="file" onchange="previewImage(this, '#upload')" style="display: none;" name="upload" id="upload">
                </div>
                <div class="form-group">
                    <textarea type="text" class="form-control" name="buildingsImg.imgDes" placeholder="请输入图片简介"></textarea>
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="addImg();">添加</a>
        </div>
    </div>
</div>
</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jQuery.form.min.js"></script>
<script src="<%=path %>/js/common/changeImg.js"></script>
<script src="<%=path %>/js/buildings/buildings.js"></script>
</html>
