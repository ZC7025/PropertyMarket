function empPwd() {
    validate('#changePwd');
    if($('#changePwd').validationEngine('validate')) {
        $.post("/employee/updateEmpPwd",
            $("#updateEmpPwd").serialize(),
            function (data) {
                if (data.controllerResult.result === 'success') {
                    swal("修改成功","","success");
                    $(":text").val("");
                } else {
                    swal("修改失败","","error");
                }
            }, "json"
        );
    }
}