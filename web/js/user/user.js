var $table = $('#table'),
    $removeButton = $('#removeButton');

$(function () {
    $removeButton.click(function () {
        var select= $("#table").bootstrapTable('getSelections');
        if(select.length == 0){
            alert("请选择数据","","warning");
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


function statusShow(value) {
    if(value == 1){
        return "可用";
    }else if(value == 0){
        return "不可用"
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
            $.post("/user/beDisable?id="+id,
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

function beUsable() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length==1) {
        if(select[0].status == 1) {
            swal("已是激活状态","","warning");
        }else{
            //变为可用的操作
            var id = select[0].id;
            $.post("/user/beUsable?id="+id,
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

function NullToString(value){
    if(value === null){
        return "";
    }else{
        return value;
    }
}