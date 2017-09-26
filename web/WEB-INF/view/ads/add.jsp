<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/28
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>添加广告</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
    <link href="<%=path %>/plugins/layDate/theme/default/laydate.css" rel="stylesheet">
</head>
<body >
<div class="container">
    <div class="row" style="margin-top: 100px;">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">添加广告</h3>
            <form id="addAds" method="post" enctype="multipart/form-data" >
                <s:token/>
                <div>
                    <div class="form-group">
                        <label >标题:</label>
                        <input type="text" class="form-control validate[required]" id="title"  name="ads.title" placeholder="请输入广告标题"  />
                    </div>
                    <div class="form-group">
                       <input type="text" class="form-control validate[required] " id="content" name="ads.content" placeholder="请输入广告内容" />
                    </div>
                    <div class="form-group form-inline">
                        <label>广告图片：</label>
                        <input type="file" name="logo"/>
                    </div>
                    <div class="form-group">
                        广告连接路径：<input type="text" class="form-control validate[required]" name="ads.adUrl" placeholder="请输入广告路径"/>
                    </div>
                    <div class="form-group form-inline">
                        显示顺序:<%--<input name="ads.showOrder" class="form-control validate[required,min[1],max[2]] custom[integer]]" type="text"/>--%>
                        <select name="ads.showOrder" class="form-control validate[required]">
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                    <%--<div class="form-group">
                        <input type="text" class="form-control validate[required]" id="createdTime"  name="ads.createdTime" placeholder="请选择创建时间"/>
                    </div>--%>
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="add();">添加</a>
        </div>
    </div>
</div>

<script>
    function add() {
        validate('#addAds');
        if($('#addAds').validationEngine('validate')) {
            $("#addAds").ajaxSubmit({
                type: 'post',
                url:'/ads/addAds',
                dataType : 'json',
                data: $("#addAds").serialize(),
                success: function(data) {
                    if(data.controllerResult.result == 'success') {
                        swal("添加成功","", "success");
                        $(":text").val("");
                        $(":file").val("");
                    } else {
                        swal("添加失败","", "error");
                    }
                },

            });
        }
    }
</script>

</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jQuery.form.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="<%=path %>/plugins/layDate/laydate.js"></script>

<script>
    var nowDate = new Date();
    var dateStr = nowDate.getFullYear() + '-' + (nowDate.getMonth()+1) + '-' + nowDate.getDate();
    //限定可选日期
    var ins22 = laydate.render({
        elem: '#createdTime'
        ,min: dateStr
        ,max: '2048-01-01'
        ,/*ready: function(){
         ins22.hint('日期可选值设定在 <br> '+ dateStr + ' 到 2048-01-01');
         }*/
    });
</script>
</html>
