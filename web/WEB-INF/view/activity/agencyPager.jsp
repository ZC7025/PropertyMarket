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
        <button id="getButton" class="btn btn-primary" onclick="show1()">修改</button>
        <button class="btn btn-primary" onclick="detail()">查看详情</button>
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
           data-url="<%=path%>/activity/agencyPager"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="title" >活动名称</th>
            <th data-field="address" >地址</th>
            <th data-field="content" >内容</th>
            <th data-field="startTime"  data-formatter=formatDate>开始时间</th>
            <th data-field="endTime"  data-formatter=formatDate>结束时间</th>
            <th data-field="status"  data-formatter=statusShow>状态</th>
            <th data-field="buildingsName" >楼盘名称</th>
        </tr>
        </thead>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="editWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="upActivity" method="post" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input name="activity.title" type="text" class="form-control" id="title" placeholder="请输入活动标题" >
                        <input name="activity.id" type="hidden" class="form-control" id="id" >
                    </div>
                    <div class="form-group">
                        <input type="text" name="activity.address" class="form-control" id="address" placeholder="请输入活动地址" >
                    </div>
                    <div class="form-group">
                        <input type="text" name="activity.content" class="form-control" id="content" placeholder="请输入活动内容" >
                    </div>
                    <div class="form-group form-inline">
                        <label>活动图片:</label>
                        <input class="form-control" type="file" name="logo" />
                    </div>
                    <div>
                        <label>起止时间：</label>
                    </div>
                    <div class="form-group">
                        <input type="text" name="activityTime" class="form-control" id="activityTime" readonly />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="upActivity();">保存</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="<%=path%>/plugins/jquery.min.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>
<!--bootstrap table-->
<script src="<%=path%>/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="<%=path%>/plugins/bootstrap-table/ga.js"></script>
<script src="<%=path%>/plugins/bootstrap/bootstrap-table-zh-CN.min.js"></script>
<!--弹窗-->
<script src="<%=path%>/plugins/sweet-alert/sweet-alert.min.js"></script>
<script src="<%=path %>/plugins/layer/layer.js"></script>
<!--日期-->
<script src="<%=path %>/plugins/layDate/laydate.js"></script>
<!--为了ajaxSubmit形式-->
<script src="<%=path %>/plugins/jQuery.form.min.js"></script>
<!--自定义格式化日期-->
<script src="<%=path%>/js/agency/agency.js"></script>
<script>

    function detail() {
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length === 1){
            layer.open({
                type: 2,
                title: '楼栋详情',
                shadeClose: true,
                shade: false,
                maxmin: true,
                area: ['1000px', '450px'],
                content: '/activity/personInfor?id='+select[0].id
            });
        } else {
            swal("请选中一行！","","warning");
        }
    }

    function upActivity() {
        var select = $("#table").bootstrapTable('getSelections');
        if (select.length == 1) {
            var id = select[0].id;
            $("#upActivity").ajaxSubmit({
                type: 'post',
                url: '/activity/upActivity?id=' + id,
                dataType: 'json',
                data: $("#upActivity").serialize(),
                success: function (data) {
                    swal("修改成功","","success");
                    $("#table").bootstrapTable("refresh");
                }
            });
        }
    }
</script>
<script>
    var $table = $('#table'),
        $removeButton = $('#removeButton');
    $(function () {
        $removeButton.click(function () {
            var select= $("#table").bootstrapTable('getSelections');
            if(select.length == 0){
                swal("请选择数据","","warning");
            }else{
                var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
                    return row.id;
                });
                $table.bootstrapTable('remove', {
                    field: 'id',
                    values: ids
                });
            }
        });
    });

    function show1(){
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length==1){
            $("#editWin").modal();
            $("#title").val(select[0].title);
            $("#id").val(select[0].id);
            $("#address").val(select[0].address);
            $("#content").val(select[0].content);
            $("#activityTime").val(select[0].startTime + " 到 "+ select[0].endTime);
        }else{
            swal("请选择一行数据进行编辑","","warning");
        }
    }

    function statusShow(value) {
        if(value == 1){
            return "可用";
        }else if(value == 0){
            return "不可用"
        }
    }

    function beUsable() {
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length==1) {
            if (select[0].status == 1) {
                swal("已是激活状态");
            } else {
                //变为可用的操作
                var id = select[0].id;
                $.post("/activity/beUsable?id=" + id,
                    function (data) {
                        if (data.controllerResult.result == 'success') {
                            swal("激活成功","","success");
                            $("#table").bootstrapTable("refresh");
                        }
                    }, "json"
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
            } else {
                //变为不可用操作
                var id = select[0].id;
                $.post("/activity/beDisable?id=" + id,
                    function (data) {
                        if (data.controllerResult.result == 'success') {
                            swal("冻结成功","","success");
                            $("#table").bootstrapTable("refresh");
                        }
                    }, "json"
                );
            }
        }else{
            swal("未选择行","","warning");
        }
    }

</script>
<script>
    var nowDate = new Date();
    var dateStr = nowDate.getFullYear() + '-' + (nowDate.getMonth()+1) + '-' + nowDate.getDate();
    //限定可选日期
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

</body>
</html>
