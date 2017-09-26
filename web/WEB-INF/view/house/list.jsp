<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/8/30
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>户型列表</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/examples.css">
    <link rel="stylesheet" href="<%=path %>/plugins/sweet-alert/sweet-alert.css"/>
    <link rel="stylesheet" href="<%=path%>/plugins/layer/skin/default/layer.css">
    <link rel="stylesheet" href="<%=path%>/plugins/jquery-validationEngine/validationEngine.jquery.css">
</head>
<body>
<div>
    <div id="toolbar">
        <c:if test="${requestScope.admins == 'admins'}">
            <a href="<%=path %>/builds/buildingsPager" class="btn btn-primary">楼盘列表</a>
        </c:if>
        <c:if test="${requestScope.agencys == 'agencys'}">
            <a href="<%=path %>/builds/listPage" class="btn btn-primary">楼盘列表</a>
        </c:if>
        <button class="btn btn-primary" onclick="detail();">查看详情</button>
        <button id="getButton" class="btn btn-primary" onclick="show()">修改</button>
        <button id="active" class="btn btn-primary" onclick="updateStatus(1);">激活</button>
        <button id="free" class="btn btn-warning" onclick="updateStatus(0);">冻结</button>
    </div>
    <table id="table"
           data-toggle="table"
           data-show-columns="false"
           data-toolbar="#toolbar"
           data-height="520"
           data-click-to-select="true"
           data-cookie="true"
           data-cookie-id-table="saveId"
           data-pagination="true"
           data-search="false"
           data-url="<%=path%>/house/list"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-checkbox="true"></th>
            <th data-field="id" data-visible="false"></th>
            <th data-field="name">户型名称</th>
            <th data-field="area">面积</th>
            <th data-field="unitPrice">参考单价</th>
            <th data-field="logo" data-visible="false"></th>
            <th data-field="intro">简介</th>
            <th data-field="buildings.name">所属楼盘</th>
            <th data-field="status" data-formatter="formatStatus">状态</th>
            <th data-field="createdTime" data-formatter="formatDate">创建时间</th>
        </tr>
        </thead>
    </table>
</div>
<!-- Modal -->
<div class="modal fade" id="editWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="update">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">户型名称</label>
                        <input type="text" class="form-control validate[required]" name="house.name" id="name" >
                        <input type="hidden" class="form-control" name="house.id" id="id" >
                    </div>
                    <div class="form-group">
                        <label for="area">面积</label>
                        <input type="text" class="form-control validate[required] custom[number]" name="house.area" id="area" >
                    </div>
                    <div class="form-group">
                        <label for="unitPrice">参考单价</label>
                        <input type="text" class="form-control validate[required] custom[number]" name="house.unitPrice" id="unitPrice" >
                    </div>
                    <div class="form-group">
                        <label for="intro">简介</label>
                        <textarea type="text" class="form-control" name="house.intro" id="intro" ></textarea>
                    </div>
                    <div class="form-group">
                        <div id="preview" class="col-lg-3" onclick="$('#upload').click();">
                            <c:if test="${requestScope.house.logo == null}">
                                <img id="imghead" border="0" src="<%=path %>/img/headDefault.png" onclick="$('#upload').click();" width="100%">
                            </c:if>
                            <c:if test="${requestScope.house.logo != null}">
                                <img id="imghead" border="0" src="<%=path %>/${requestScope.house.logo}" onclick="$('#upload').click();" width="100%">
                            </c:if>
                        </div>
                        <input type="file" onchange="previewImage(this, '#upload')" style="display: none;" name="upload" id="upload">
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="javascript:void(0);" type="button" class="btn btn-default" data-dismiss="modal">关闭</a>
                    <a href="javascript:void(0);" type="button" class="btn btn-primary" onclick="update();">保存</a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path %>/plugins/jQuery.form.min.js"></script>
<script src="<%=path %>/js/main.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>
<script src="<%=path %>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path %>/plugins/layer/layer.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine.min.js"></script>
<script src="<%=path %>/plugins/jquery-validationEngine/jquery.validationEngine-zh_CN.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path %>/js/common/validationEngine.js"></script>
<script src="<%=path %>/js/common/changeImg.js"></script>
<script src="<%=path %>/js/house/house.js"></script>
<script>
    function detail() {
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length === 1){
            layer.open({
                type: 2,
                title: '户型详情',
                shadeClose: true,
                shade: false,
                maxmin: true, //开启最大化最小化按钮
                area: ['1000px', '450px'],
                content: '/house/detail?house.id='+ select[0].id
            });
        } else {
            swal("请选中一行！","","warning");
        }
    }
</script>
</html>
