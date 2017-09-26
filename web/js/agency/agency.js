/**
 * 经销商登录
 */
function login() {
    validate('#login');
    if($('#login').validationEngine('validate')) {
        $.post(contextPath + "/agency/login",
            $("#login").serialize(),
            function (data) {
                if (data.controllerResult.result == 'success') {
                    window.location = contextPath + "/agency/home";
                } else {
                    if(data.controllerResult.message == '登录失败') {
                        window.location = contextPath + "/agency/waitCheck";
                    } else {
                        swal(data.controllerResult.message,"","error");
                    }
                }
            }, "json"
        );
    }
}

/**
 * 经销商注册
 */
function reg() {
    validate('#reg');
    if($('#reg').validationEngine('validate')) {
        $.post(contextPath + "/agency/reg",
            $("#reg").serialize(),
            function (data) {
                if (data.controllerResult.result == 'success') {
                    window.location = contextPath + "/agency/waitCheck";
                } else {
                    swal(data.controllerResult.message,"","error");
                }
            }, "json"
        );
    }
}
/**
 * 经销商更改信息
 */
function update() {
    validate('#update');
    if($('#update').validationEngine('validate')) {
        $.post(contextPath + "/agency/update",
            $("#update").serialize(),
            function (data) {
                if (data.controllerResult.result == 'success') {
                    window.location = contextPath + "/agency/info";
                } else {
                    swal(data.controllerResult.message,"","error");
                }
            }, "json"
        );
    }
}
/**
 * 经销商修改密码
 */
function updatePwd() {
    validate('#updatePwd');
    if($('#updatePwd').validationEngine('validate')) {
        $.post(contextPath + "/agency/updatePwd",
            $("#updatePwd").serialize(),
            function (data) {
                if (data.controllerResult.result == 'success') {
                    swal("修改成功","","success");
                    $("input.pwd").val("");
                } else {
                    swal("原密码输入错误","","error");
                }
            }, "json"
        );
    }
}
/**
 * 经销商返回状态
 */
function showStatus() {
    if(status == 0){
        return "未审核";
    }else if(status == 1){
        return "已审核"
    }
}
/**
 * 格式化日期
 */
function formatDate(value) {
    if (value == undefined || value == null || value == '') {
        return "";
    } else {
        var date = new Date(value);
        var year = date.getFullYear().toString();
        var month = (date.getMonth() + 1);
        var day = date.getDate().toString();
        var hour = date.getHours().toString();
        var minutes = date.getMinutes().toString();
        var seconds = date.getSeconds().toString();
        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }
        if (hour < 10) {
            hour = "0" + hour;
        }
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        if (seconds < 10) {
            seconds = "0" + seconds;
        }
        return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
    }
}

function dealCheck() {
    var select= $("#table").bootstrapTable('getSelections');
    if(select.length==1) {
        var id = select[0].id;
        $.post("/agency/dealCheck?id=" + id,
            function (data) {
                if(data.controllerResult.result == 'success') {
                    //刷新页面的操作，还不可用
                    $("#table").bootstrapTable("refresh");
                }
            }, "json"
        );
        //审核的操作
    }else{
        swal("未选择行","","warning");
    }
}