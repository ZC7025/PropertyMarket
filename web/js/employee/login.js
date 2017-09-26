function employeeLogin() {
    validate('#employeeLogin');
    if($('#employeeLogin').validationEngine('validate')) {
        $.post("/employee/login",
            $("#employeeLogin").serialize(),
            function (data) {
                if (data.controllerResult.result == 'success') {
                    window.location = "/employee/toBackground"
                } else {
                   swal(data.controllerResult.message,"","error");
                }
            }, "json"
        );
    }
}