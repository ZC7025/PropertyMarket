var contextPath = "";
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
        $('#editWin').modal();//调用模态框
        $("#name").val(select[0].name);
        $("#leader").val(select[0].leader);
        $("#address").val(select[0].address);
        $("#intro").val(select[0].intro);
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
        if(select[0].status == 1) {
            swal("已是激活状态","","warning");
        }else{
            //变为可用的操作
            var id = select[0].id;
            $.post(contextPath + "/agency/beUsable?id="+id,
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

function detail() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        layer.open({
            type: 2,
            title: '经销商详情',
            shadeClose: true,
            shade: false,
            maxmin: true,
            area: ['1000px', '450px'],
            content: '/agency/detail?agency.id='+select[0].id
        });
    } else {
        swal("请选中一行！","","warning");
    }
}

function beDisable() {
    var select = $("#table").bootstrapTable('getSelections');
    if (select.length == 1) {
        if (select[0].status == 0) {
            swal("已是冻结状态");
        }else{
            //变为不可用操作
            var id = select[0].id;
            $.post(contextPath + "/agency/beDisable?id="+id,
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

function adminUpAgency() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length==1) {
        var id = select[0].id;
        $.post("agency/adminUpAgency?id="+id,
        $("#editForm").serialize(),
        function(data){
            $("#table").bootstrapTable("refresh");
        },"json"
        );
    }else{
        swal("未选择行","","warning");
    }
}