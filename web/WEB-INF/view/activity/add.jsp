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
    <title>添加活动</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
    <link href="<%=path %>/plugins/layDate/theme/default/laydate.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row" style="margin-top: 100px;">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">添加活动</h3>
            <form id="addActivity" method="post" enctype="multipart/form-data" >
                <div>
                    <input type="hidden" id="buildingsId" name="buildingsId" value="${requestScope.buildingsId }">
                    <div class="form-group">
                        <input type="text" class="form-control validate[required]" id="title"  name="activity.title" placeholder="请输入活动标题"  />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control validate[required]" id="address" name="activity.address" placeholder="请输入活动地址" />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control validate[required]" id="content" name="activity.content" placeholder="请输入活动内容" />
                    </div>
                    <div class="form-group form-inline">
                        <label>活动图片：</label>
                        <input type="file" class="form-control" name="logo"/>
                    </div>
                    <div class="form-group">
                        <input type="text" id="activityTime" class="form-control validate[required]" name="activityTime" placeholder="请选择起止时间" readonly/>
                    </div>
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
<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="<%=path %>/plugins/layDate/laydate.js"></script>

<script>
    var nowDate = new Date();
    var dateStr = nowDate.getFullYear() + '-' + (nowDate.getMonth()+1) + '-' + nowDate.getDate();

    var ins22 = laydate.render({
        elem: '#activityTime'
        ,type: 'datetime'
        ,min: dateStr
        ,max: '2048-01-01'
        ,range: '到'
        ,format: 'yyyy-MM-dd HH:mm:ss'
        ,ready: function(){
            ins22.hint('起止日期可选值设定在 <br> '+ dateStr + ' 到 2048-01-01');
        }
    });

</script>
<script>
    function add() {
        validate('#addActivity');
        if($('#addActivity').validationEngine('validate')) {
            $("#addActivity").ajaxSubmit({
                type: 'post',
                url:'/activity/addActivity',
                dataType : 'json',
                data: $("#addActivity").serialize(),
                success: function(data) {
                    if(data.controllerResult.result == 'success') {
                        swal("添加成功","", "success");
                        $(":text").val("");
                        $(":file").val("");
                    } else {
                        swal("添加失败","", "error");
                    }
                }
            });
        }
    }
</script>
</html>
