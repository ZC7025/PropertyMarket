function upActivity() {
    var select = $("#table").bootstrapTable('getSelections');
    if (select.length == 1) {
        var id = select[0].id;
        $("#upActivity").ajaxSubmit({
            type: 'post',
            url: '/activity/upActivity?id=' + id,
            dataType: 'json',
            data: $("#upActivity").serialize(),
            success: function (data) {
                $("#table").bootstrapTable("refresh");
            }
        });
    }
}