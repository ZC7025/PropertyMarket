function adminLogin() {
    $.post("/admin/login",
        $("#adminLogin").serialize(),
        function (data) {
            if (data.controllerResult.result == 'success') {
                window.location = "/admin/toBackground"
            } else {
                swal(data.controllerResult.message,"","error");
            }
        }, "json"
    );
}