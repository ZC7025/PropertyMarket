/**
 *  回复模态框
 */
function show() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        $('#editWin').modal();//调用模态框
        $("#id").val(select[0].id);
        $("#content").text(select[0].content);
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 回复
 */
function reply() {
    validate('#update');
    if($('#update').validationEngine('validate')) {
        $.post(contextPath + "/message/reply",
            $("#update").serialize(),
            function (data) {
                if (data.controllerResult.result === 'success') {
                    swal("回复成功","", "success");
                    $("#reply").val("");
                    $('#editWin').modal('hide');
                    $("#table").bootstrapTable('refresh');
                } else {
                    swal(data.controllerResult.message, "", "error");
                }
            }, "json"
        );
    }
}

function remove() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        $.post(contextPath + "/message/remove",
            {"message.id": select[0].id },
            function (data) {
                if (data.controllerResult.result === 'success') {
                    swal("删除成功","", "success");
                    $("#table").bootstrapTable('refresh');
                } else {
                    swal(data.controllerResult.message, "", "error");
                }
            }, "json"
        );
    }else{
        swal("请选中一行！","","warning");
    }
}

/**
 * 修改评价的模态框
 */
function show1(){
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        $('#editWin').modal();//调用模态框
        $("#content").val(select[0].content);
        $("#id").val(select[0].id);
    }else{
        swal("请选中一行！","","warning");
    }
}

function update() {
    $.post(contextPath + "/message/update",
        $("#update").serialize(),
        function (data) {
            if (data.controllerResult.result === 'success') {
                swal("修改成功","", "success");
                $('#editWin').modal('hide');
                $("#table").bootstrapTable('refresh');
            } else {
                swal(data.controllerResult.message, "", "error");
            }
        }, "json"
    );
}