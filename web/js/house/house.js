/**
 * 展开模态框
 */
function show(){
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        $('#editWin').modal();//调用模态框
        $("#name").val(select[0].name);
        $("#id").val(select[0].id);
        $("#area").val(select[0].area);
        $("#unitPrice").val(select[0].unitPrice);
        $("#intro").val(select[0].intro);
        $("#upload").val(select[0].upload);
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 户型添加
 */
function add() {
    validate('#add');
    if($('#add').validationEngine('validate')) {
        $("#add").ajaxSubmit({
            type: 'post',
            url: contextPath + '/house/add',
            dataType : 'json',
            data: $("#add").serialize(),
            success: function(data) {
                if(data.controllerResult.result == 'success') {
                    swal("添加成功","", "success");
                    $(":text").val("");
                    $(":file").val("");
                    window.location = contextPath + "/house/listPage";
                } else {
                    swal("添加失败","", "error");
                }
            },
            error: function(data) {
                swal("添加失败","", "error");
            }
        });
        return false;
    }
}
/**
 * 更新
 * @returns {boolean}
 */
function update() {
    validate('#update');
    if($('#update').validationEngine('validate')) {
        $("#update").ajaxSubmit({
            type: 'post',
            url: contextPath + '/house/update',
            dataType : 'json',
            data: $("#update").serialize(),
            success: function(data) {
                if(data.controllerResult.result == 'success') {
                    swal("修改成功","", "success");
                    $('#editWin').modal('hide');
                    $("#table").bootstrapTable('refresh');
                } else {
                    swal("修改失败","", "error");
                }
            },
            error: function(data) {
                swal("修改失败","", "error");
            }
        });
        return false;
    }
}
/**
 * 改状态
 * @param status
 */
function updateStatus(status) {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        if(select[0].status === status) {
            swal("不需要重复"+ (status === 1 ? "激活" : "冻结"),"","warning");
        } else {
            $.post(contextPath + "/house/updateStatus",
                {"house.id": select[0].id, "status": status},
                function (data) {
                    if (data.controllerResult.result === 'success') {
                        swal((status === 1 ? "激活" : "冻结")+ "成功","", "success");
                        $("#table").bootstrapTable('refresh');
                    } else {
                        swal(data.controllerResult.message, "", "error");
                    }
                }, "json"
            );
        }
    }else{
        swal("请选中一行！","","warning");
    }
}