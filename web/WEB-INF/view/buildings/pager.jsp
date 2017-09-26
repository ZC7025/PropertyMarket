<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title></title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="<%=path%>/plugins/bootstrap-table/examples.css">
    <link rel="stylesheet" href="<%=path%>/plugins/sweet-alert/sweet-alert.css">
    <link rel="stylesheet" href="<%=path%>/plugins/layer/skin/default/layer.css">
    <link href="<%=path %>/plugins/layDate/theme/default/laydate.css" rel="stylesheet">

</head>
<body>
<div>
    <div id="toolbar">
        <button type="button" class="btn btn-primary" onclick="detail();">查看详情</button>
        <button id="beDisable" class="btn btn-primary" onclick="listHouse()">户型信息</button>
        <button id="viewImg" class="btn btn-primary" onclick="viewImg()">查看图片</button>
    </div>
    <table id="table"
           data-toggle="table"
           data-show-columns="false"
           data-height="520"
           data-toolbar="#toolbar"
           data-click-to-select="false"
           data-cookie="true"
           data-cookie-id-table="saveId"
           data-pagination="true"
           data-search="false"
           data-url="<%=path%>/builds/pager"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="id" data-visible="false"></th>
            <th data-field="name" >楼盘名称</th>
            <th data-field="area" >所属区域</th>
            <th data-field="address" >地址</th>
            <th data-field="createdTime"  data-formatter=formatDate>开始时间</th>
            <th data-field="agency.name" >经销商名称</th>
        </tr>
        </thead>
    </table>
</div>

<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<!--bootstrap table-->
<script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path %>/plugins/layer/layer.js"></script>
<!--弹窗-->
<script src="<%=path%>/plugins/sweet-alert/sweet-alert.min.js"></script>
<!--日期-->
<script src="<%=path %>/plugins/layDate/laydate.js"></script>
<!--为了ajaxSubmit形式-->
<script src="<%=path %>/plugins/jQuery.form.min.js"></script>
<!--自定义格式化日期-->
<script src="<%=path%>/js/agency/agency.js"></script>
<!--自定义-->
<script src="<%=path %>/js/buildings/buildings.js"></script>


<script>

    function listHouse() {
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length === 1){
            window.location = "/house/listPage?buildingsId=" + select[0].id;
        }else{
            swal("请选中一行！","","warning");
        }
    }

    function detail() {
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length === 1){
            layer.open({
                type: 2,
                title: '楼盘详情',
                shadeClose: true,
                shade: false,
                maxmin: true,
                area: ['1000px', '450px'],
                content: '/builds/personInfo?id='+select[0].id
            });
        } else {
            swal("请选中一行！","","warning");
        }
    }

</script>
</body>
</html>
