/**
 * 楼栋添加
 */
function add() {
    validate('#add');
    if($('#add').validationEngine('validate')) {
        $.post(contextPath + "/build/add",
            $("#add").serialize(),
            function (data) {
                if (data.controllerResult.result === 'success') {
                    swal("添加成功", "", "success");
                    $(":text").val("");
                    $(":file").val("");
                } else {
                    swal(data.controllerResult.message, "", "error");
                }
            }, "json"
        );
    }
}

/**
 * 楼栋的修改
 */
function update() {
    validate('#update');
    if($('#update').validationEngine('validate')) {
        $.post(contextPath + "/build/update",
            $("#update").serialize(),
            function (data) {
                if (data.controllerResult.result === 'success') {
                    swal("修改成功,请重新生成房号","", "success");
                    $('#editWin').modal('hide');
                    $("#table").bootstrapTable('refresh');
                } else {
                    swal(data.controllerResult.message, "", "error");
                }
            }, "json"
        );
    }
}
/**
 * 跳转到房屋销售状态页面
 */
function roomPage() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1) {
        $.post(contextPath + "/build/checkRoom?building.id=" + select[0].id,
            function (data) {
                if (data.controllerResult.result === 'success') {
                    window.location = contextPath + "/build/roomPage?building.id=" + select[0].id;
                } else {
                    swal("请生成房号！", "", "warning");
                }
            }, "json"
        );
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 修改楼栋的模态框
 */
function show(){
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        $('#editWin').modal();//调用模态框
        $("#name").val(select[0].name);
        $("#id").val(select[0].id);
        $("#totalFloor").val(select[0].totalFloor);
        $("#totalLift").val(select[0].totalLift);
        $("#floorRooms").val(select[0].floorRooms);
        $("#totalRoom").val(select[0].totalRoom);
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 生成房号的模态框
 */
function room(){
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        $.post(contextPath + "/build/checkRoom?building.id=" + select[0].id,
            function (data) {
                if (data.controllerResult.result === 'success') {
                    swal("已生成房号！","无需重复生成","warning");
                } else {
                    $('#addWin').modal();//调用模态框
                    $("#ids").val(select[0].id);
                    $("#buildingsId").val(select[0].buildings.id);
                    $("#names").val(select[0].name);
                    $("#totalFloors").val(select[0].totalFloor);
                    $("#floorRoomss").val(select[0].floorRooms);
                    $("#totalRooms").val(select[0].totalRoom);

                    $('#houseType').empty();

                    var totalFloor = $("#totalFloors").val();
                    var floorRooms = $("#floorRoomss").val();

                    for(var i = 0;i< floorRooms; i++) {
                        $('#houseType').append("<div class='form-group form-inline'>"+
                            "<label>"+ (i+1)+"号房的户型：</label>"+
                            "<select class='houseType form-control' name='houseType" + i +"'>"+ "</select></div>");
                    }
                    var buildingsId = $('#buildingsId').val();
                    $.post(contextPath + "/house/allHouse?buildingsId=" + buildingsId,
                        function (data) {
                            for(var i= 0 ;i<data.houses.length;i++){
                                $(".houseType").append("<option value="+data.houses[i].id+">"+data.houses[i].name+"</option>");
                            }
                        }, "json"
                    );
                }
            });
    }else{
        swal("请选中一行！","","warning");
    }
}
/**
 * 生成房号
 */
function addRoom() {
    validate('#addRoom');
    if($('#addRoom').validationEngine('validate')) {
        $.post(contextPath + "/build/addRoom",
            $("#addRoom").serialize(),
            function (data) {
                if (data.controllerResult.result === 'success') {
                    $('#addWin').modal('hide');
                    swal("添加成功", "", "success");
                } else {
                    swal(data.controllerResult.message, "", "error");
                }
            }, "json"
        );
    }
}
/**
 * 生成房号时使用
 */
$("#totalFloors").blur(function () {
    var totalFloor = $("#totalFloors").val();
    var floorRooms = $("#floorRoomss").val();
    validate('#addRoom');
    if($('#addRoom').validationEngine('validate')) {
        $("#totalRooms").val(totalFloor * floorRooms);
    }
});
$("#floorRoomss").blur(function () {
    var totalFloor = $("#totalFloors").val();
    var floorRooms = $("#floorRoomss").val();
    validate('#addRoom');
    if($('#addRoom').validationEngine('validate')) {
        $("#totalRooms").val(totalFloor * floorRooms);

        $('#houseType').empty();

        for(var i = 0;i< floorRooms; i++) {
            $('#houseType').append("<div class='form-group form-inline'>"+
                "<label>"+ (i+1)+"号房的户型：</label>"+
                "<select class='houseType form-control' name='houseType" + i +"'>"+ "</select></div>");
        }
        var buildingsId = $('#buildingsId').val();
        $.post("/house/allHouse?buildingsId=" + buildingsId,
            $(),
            function (data) {
                for(var i= 0 ;i<data.houses.length;i++){
                    $(".houseType").append("<option value="+data.houses[i].id+">"+data.houses[i].name+"</option>");
                }
            }, "json"
        );
    }
});
/**
 * 修改楼栋状态
 * @param status
 */
function updateStatus(status) {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length === 1){
        if(select[0].status === status) {
            swal("不需要重复"+ (status === 1 ? "激活" : "冻结"),"","warning");
        } else {
            $.post(contextPath + "/build/updateStatus",
                {"building.id": select[0].id, "status": status},
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
 * 添加楼栋时自动生成总户数
 */
$("#totalFloor").blur(function () {
    var totalFloor = $("#totalFloor").val();
    var floorRooms = $("#floorRooms").val();
    validate('#update');
    if($('#update').validationEngine('validate')) {
        $("#totalRoom").val(totalFloor * floorRooms);
    }
});

$("#floorRooms").blur(function () {
    var totalFloor = $("#totalFloor").val();
    var floorRooms = $("#floorRooms").val();
    validate('#update');
    if($('#update').validationEngine('validate')) {
        $("#totalRoom").val(totalFloor * floorRooms);
    }
});