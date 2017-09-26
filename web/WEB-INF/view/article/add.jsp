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
<head onload="allType();">
    <title>添加文章</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
    <link href="<%=path %>/plugins/layDate/theme/default/laydate.css" rel="stylesheet">
</head>
<body onload="allType()">
<div class="container">
    <div class="row" style="margin-top: 100px;">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">添加文章</h3>
            <form id="addType" method="post" enctype="multipart/form-data" >
                <s:token/>
                <div>
                    <div class="form-group">
                        <input type="text" class="form-control validate[required]" id="title"  name="article.title" placeholder="请输入文章标题"  />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control validate[required]" id="abstracts" name="article.abstracts" placeholder="请输入文章摘要" />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control validate[required]" id="content" name="article.content" placeholder="请输入文章内容" />
                    </div>
                    <div class="form-group form-inline">
                        <label>文章图片：</label>
                        <input type="file" name="logo"/>
                    </div>
                    <div class="form-group form-inline">
                        <label>文章类型:</label>
                        <select class="form-control" id="type" name="article.articleType.id"></select>
                    </div>
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="add();">添加</a>
        </div>
    </div>
</div>

<script>


    function allType(){
        $.post("/articleType/allType",
            function (data) {
                for (var i = 0; i < data.articleTypes.length; i++) {
                    $("#type").append("<option value =" + data.articleTypes[i].id + ">" + data.articleTypes[i].name + "</option>");
                }
            }, "json"
        );
    }

    function add() {
        validate('#addType');
        if($('#addType').validationEngine('validate')) {
            $("#addType").ajaxSubmit({
                type: 'post',
                url:'/article/addArticle?',
                dataType : 'json',
                data: $("#addType").serialize(),
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
        ,ready: function(){
            ins22.hint('日期可选值设定在 <br> '+ dateStr + ' 到 2048-01-01');
        }
    });
</script>
</html>
