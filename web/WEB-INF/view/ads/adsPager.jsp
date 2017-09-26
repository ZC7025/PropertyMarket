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
    <link href="<%=path %>/plugins/layDate/theme/default/laydate.css" rel="stylesheet">

</head>
<body>
<div>
    <div id="toolbar">
        <button id="getButton" class="btn btn-primary" onclick="show1()">修改</button>
        <button id="beUsable" class="btn btn-primary" onclick="beUsable()">显示</button>
        <button id="beDisable" class="btn btn-warning" onclick="beDisable()">隐藏</button>
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
           data-url="<%=path%>/ads/pager"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="title" >广告名称</th>
            <th data-field="content" >内容</th>
            <th data-field="showOrder" data-formatter=showOrder>广告顺序</th>
            <th data-field="createdTime"  data-formatter=formatDate>创建时间</th>
            <th data-field="showStatus"  data-formatter=statusShow>状态</th>
        </tr>
        </thead>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="editWin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="upAds" method="post" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                       <input name="ads.title" type="text" class="form-control" id="title" placeholder="请输入广告标题">
                    </div>
                    <div class="form-group">
                        <input type="text" name="ads.content" class="form-control" id="content" placeholder="请输入广告内容">
                    </div>
                    <div class="form-group form-inline">
                        广告图片：<input type="file" class="form-control" name="logo" />
                    </div>
                    <div class="form-group">
                        <input type="text" name="ads.adUrl" class="form-control" id="adUrl" placeholder="请输入广告URL">
                    </div>

                    <div class="form-group form-inline">
                        显示顺序:
                        <select name="ads.showOrder" class="form-control validate[required]">
                            <option value="1">首页上</option>
                            <option value="2">首页下</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="upAds();">保存</button>
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
<!--日期-->
<script src="<%=path %>/plugins/layDate/laydate.js"></script>
<!--为了ajaxSubmit形式-->
<script src="<%=path %>/plugins/jQuery.form.min.js"></script>
<!--自定义格式化日期-->
<script src="<%=path%>/js/agency/agency.js"></script>
<script>
    function upAds() {
        var select = $("#table").bootstrapTable('getSelections');
        if (select.length == 1) {
            var id = select[0].id;
            $("#upAds").ajaxSubmit({
                type: 'post',
                url: '/ads/upAds?id=' + id,
                dataType: 'json',
                data: $("#upAds").serialize(),
                success: function (data) {
                    $("#table").bootstrapTable("refresh");
                    $(":file").val();
                }
            });
        }
    }
</script>
<script>
function show1(){
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length==1){
            $("#editWin").modal();
            $("#title").val(select[0].title);
            $("#content").val(select[0].content);
            $("#adUrl").val(select[0].adUrl);
            $("#showOrder").val(select[0].showOrder);
            $("#createdTime").val(select[0].createdTime);
        }else{
            swal("请选择一行数据进行编辑","","warning");
        }
    }

    function statusShow(value) {
        if(value == 1){
            return "显示";
        }else if(value == 0){
            return "隐藏"
        }
    }

    function showOrder(value) {
        if(value == 1){
            return "首页上";
        }else if(value == 2){
            return "首页下";
        } else {
            return "无";
        }
    }

    function beUsable() {
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length==1) {
            if(select[0].showStatus == 1) {
                swal("已是显示状态","","warning");
            }else{
                //变为可用的操作
                var id = select[0].id;
                $.post("/ads/beUsable?id="+id+"&showOrder="+select[0].showOrder,
                    function(data) {
                        if(data.controllerResult.result === 'success') {
                            //刷新页面的操作，还不可用
                            swal("显示成功！","","success");
                            $("#table").bootstrapTable("refresh");
                        } else{
                            swal("已有广告显示在此广告位！","","error");
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
            if (select[0].showStatus == 0) {
                swal("已是隐藏状态","","warning");
            }else{
                //变为不可用操作
                var id = select[0].id;
                $.post("/ads/beDisable?id="+id,
                    function(data) {
                        if(data.controllerResult.result == 'success') {
                            //刷新页面的操作
                            swal("隐藏成功！","","success");
                            $("#table").bootstrapTable("refresh");
                        }
                    },"json"
                );
            }
        }else{
            swal("未选择行","","warning");
        }
    }
</script>
</body>
</html>
