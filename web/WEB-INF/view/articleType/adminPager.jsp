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

</head>
<body>
<div>
    <div id="toolbar">
        <button id="getButton" class="btn btn-primary" onclick="upBtn()">修改</button>
        <%--<button id="removeButton" class="btn btn-default">删除</button>--%>
        <button id="beUsable" class="btn btn-primary" onclick="beUsable()">激活</button>
        <button id="beDisable" class="btn btn-warning" onclick="beDisable()">冻结</button>
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
           data-url="<%=path%>/articleType/pager";
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <%--<th data-field="id" data-checkbox="true">ID</th>--%>
            <th data-field="name" >文章类型</th>
            <th data-field="des" >描述</th>
            <th data-field="status"  data-formatter=statusShow>状态</th>
        </tr>
        </thead>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="editWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="editForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        文章类型:<input name="articleType.name" type="text" class="form-control" id="name" >
                    </div>
                    <div class="form-group">
                        <label for="des">描述:</label>
                        <input type="text" name="articleType.des" class="form-control" id="des" >
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="adminUpType();">保存</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path%>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path%>/js/agency/agency.js"></script>

<script>
    function upBtn() {
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length==1) {
            $("#editWin").modal();
            $("#name").val(select[0].name);
            $("#des").val(select[0].des);
        }else{
            swal("未选中行","","warning");
        }
    }

    function beUsable() {
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length==1) {
            if(select[0].status == 1) {
                swal("已是激活状态","","warning");
            }else{
                //变为可用的操作
                var id = select[0].id;
                $.post("/articleType/beUsable?id="+id,
                    function(data) {
                        if(data.controllerResult.result == 'success') {
                            //刷新页面的操作，还不可用
                            $("#table").bootstrapTable("refresh");
                        }
                    },"json"
                );
            }
        }else{
            swal("未选择行","","warning");
        }
    }

    function beDisable() {
        var select = $("#table").bootstrapTable('getSelections');
        if (select.length == 1) {
            if (select[0].status == 0) {
                swal("已是冻结状态","","warning");
            }else{
                //变为不可用操作
                var id = select[0].id;
                $.post("/articleType/beDisable?id="+id,
                    function(data) {
                        if(data.controllerResult.result == 'success') {
                            //刷新页面的操作
                            $("#table").bootstrapTable("refresh");
                        }
                    },"json"
                );
            }
        }else{
            swal("未选择行","","warning");
        }
    }

    function statusShow(value) {
        if(value == 1){
            return "可用";
        }else if(value == 0){
            return "不可用"
        }
    }


    function adminUpType() {
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length==1) {
            var id = select[0].id;
            $.post("/articleType/adminUpType?id="+id,
                $("#editForm").serialize(),
                function(data) {
                    $("#table").bootstrapTable("refresh");
                },"json"
            );
        }else{
            swal("未选择行","","warning");
        }
    }
</script>
</body>
</html>
