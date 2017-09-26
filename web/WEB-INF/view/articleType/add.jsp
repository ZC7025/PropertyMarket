<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/28
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加文章类型</title>
    <%@include file="../master/style.inc.jsp"%>
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
</head>
<body>
<div class="container">
    <div class="row" style="margin-top: 100px;">
        <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
            <h3 class="text-center">添加文章类型</h3>
            <form id="addArticle" method="post" >
                <div>
                    <div class="form-group">
                        <input type="text" class="form-control validate[required]" id="name"  name="articleType.name" placeholder="请输入文章类型"  />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control validate[required]" id="des" name="articleType.des" placeholder="请输入类型描述" />
                    </div>
                </div>
            </form>
            <a class="btn btn-primary col-xs-12 col-sm-12 col-md-12 col-lg-12" href="javascript:void(0);" onclick="add();">添加</a>
        </div>
    </div>
</div>

<script>
    function add() {
        validate('#addArticle');
        if($('#addArticle').validationEngine('validate')) {
            $.post("/articleType/addType",
                $("#addArticle").serialize(),
                function (data) {
                    if (data.controllerResult.result == 'success') {
                        swal("添加成功","", "success");
                        $(":text").val("");
                    } else {
                        swal("添加失败","", "error");
                    }
                }, "json"
            );
        }
    }
</script>

</body>
<%@include file="../master/script.inc.jsp"%>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path %>/js/common/validationEngine.js"></script>
</html>
