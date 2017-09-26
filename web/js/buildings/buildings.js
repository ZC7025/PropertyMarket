/**
 * 添加楼盘
 */
function add() {
    validate('#add');
    if($('#add').validationEngine('validate')) {
            $("#add").ajaxSubmit({
                type: 'post',
                url: contextPath + '/builds/add',
                dataType : 'json',
                data: $("#add").serialize(),
                success: function(data) {
                    if(data.controllerResult.result === 'success') {
                        swal("添加成功","", "success");
                        $(":text").val("");
                        $(":file").val("");
                        $('#traffic').textbox("setValue","");
                        $('#equipments').textbox("setValue","");
                        $('#intro').textbox("setValue","");
                    } else {
                        swal("添加失败","", "error");
                    }
                },
                error: function(data) {
                    swal("添加失败","", "error");
                }
            });
            return false; // 阻止表单自动提交事件
    }
}
/**
 * 跳转到修改页面
 */
function show() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        window.location = contextPath + "/builds/updatePage?buildings.id=" + select[0].id;
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 跳转到添加楼栋的页面
 */
function addBuild() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        window.location = contextPath + "/build/addPage?buildingsId=" + select[0].id;
    }else{
        swal("请选中一行！","","warning");
    }
}
function addActivity() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        window.location = contextPath + "/activity/addPage?buildingsId=" + select[0].id;
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 跳转到添加楼盘图片的页面
 */
function addImgPage() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        window.location = contextPath + "/builds/addImgPage?buildingsId=" + select[0].id;

    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 跳转到楼盘图片的页面
 */
function imgPage() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        window.location = contextPath + "/builds/imgPage?buildingsId=" + select[0].id;
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 查看楼盘的楼栋
 */
function listBuild() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        window.location = contextPath + "/build/listPage?buildingsId=" + select[0].id;
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 查看楼盘的户型
 */
function listHouse() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        window.location = contextPath + "/house/listPage?buildingsId=" + select[0].id;
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 查看销售统计
 */
function countCharts() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        window.location = contextPath + "/sale/saleCountPage?buildingsId=" + select[0].id;
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 查看售价统计
 */
function saleCharts() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        window.location = contextPath + "/sale/saleMoneyPage?buildingsId=" + select[0].id;
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 查看楼盘留言
 */
function listMsg() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        window.location = contextPath + "/message/listPage?buildingsId=" + select[0].id;
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 查看楼盘评价
 */
function listComment() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        window.location = contextPath + "/comment/listPage?buildingsId=" + select[0].id;
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 添加户型页面
 */
function addHouse() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        window.location = contextPath + "/house/addPage?buildingsId=" + select[0].id;
    }else{
        swal("请选中一行！","","warning");
    }
}

/**
 * 修改楼盘
 * @returns {boolean}
 */
function update() {
    validate('#update');
    if($('#update').validationEngine('validate')) {
        $("#update").ajaxSubmit({
            type: 'post',
            url: contextPath + '/builds/update',
            dataType : 'json',
            data: $("#update").serialize(),
            success: function(data) {
                if(data.controllerResult.result === 'success') {
                    swal("修改成功","", "success");
                } else {
                    swal("修改失败","", "error");
                }
            },
            error: function(data) {
                swal("修改失败","", "error");
            }
        });
        return false; // 阻止表单自动提交事件
    }
}
/**
 * 添加楼盘图片
 */
function addImg() {
    $("#add").ajaxSubmit({
        type: 'post',
        url: contextPath + '/builds/addImg',
        dataType : 'json',
        data: $("#add").serialize(),
        success: function(data) {
            if(data.controllerResult.result === 'success') {
                swal("添加成功","", "success");
                $(":text").val("");
                $(":file").val("");
            } else {
                swal("请选择一张图片","", "error");
            }
        },
        error: function(data) {
            swal("添加失败","", "error");
        }
    });
    return false; // 阻止表单自动提交事件
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
            $.post(contextPath + "/builds/updateStatus",
                {"buildings.id": select[0].id, "status": status},
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

/**
 * 楼盘户型图片浏览
 * @param
 */
function viewImg() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        var id = select[0].id;
        window.location = "/buildsImg/viewImg?buildingsId=" + id;
    }else{
        swal("请选中一行！","","warning");
    }
}