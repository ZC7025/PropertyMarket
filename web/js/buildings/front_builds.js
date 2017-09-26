$(function () {
    appendMessage(1);
});

/**
 * append 留言
 */
function appendMessage(page) {
    var buildsId = $("#buildsId").val();
    $.post(contextPath + "/message/frontList",
        {"buildingsId": buildsId, "page":page},
        function (data) {
            if (data.controllerResult.result === 'success') {
                $("#messageRow").empty();
                for(var i=0,msg=data.messages;i<msg.length;i++) {
                    $("#messageRow").append("<div class='row'>"+
                    "<div class='col-md-1'>"+
                        "<img src='../"+msg[i].user.headicon+"' class='img-circle' style='width: 100%;height: 80px;'>"+
                        "</div>"+
                        "<div class='col-md-11'>"+
                        "<div class='col-md-12'><p class='text-left'><strong>"+msg[i].user.name+"</strong></p></div>"+
                        "<div class='col-md-12'><p class='text-left'>"+msg[i].content+"</p></div>"+
                        "<div class='col-md-12'><p class='text-left'><small>"+formatDate1(msg[i].leaveTime)+"</small></p></div>"+
                        "</div>"+
                        "</div>"+ replyStr(msg[i]));
                }
            } else {
                swal(data.controllerResult.message, "", "error");
            }
        }, "json"
    );
}

function replyStr(msg) {
    if(msg.reply != null) {
        var replyStr = "<div class='row'>"+
        "<div class='col-md-1'>"+
        "<img src='../"+msg.agency.logo+"' class='img-circle' style='width: 100%;height: 80px;'>"+
        "</div>"+
        "<div class='col-md-11'>"+
        "<div class='col-md-12'><p class='text-left'><strong>"+msg.agency.name+" 回复 "+ msg.user.name+"</strong></p></div>"+
        "<div class='col-md-12'><p class='text-left'>"+msg.reply+"</p></div>"+
        "<div class='col-md-12'><p class='text-left'><small>"+formatDate1(msg.replyTime)+"</small></p></div>"+
        "</div>"+
        "</div>"+
        "<hr />";
        return replyStr;
    } else {
        return "<hr />";
    }
}
/**
 * append 评价
 */
function appendComment(page) {
    var buildsId = $("#buildsId").val();
    $.post(contextPath + "/comment/frontList",
        {"buildingsId": buildsId, "page":page},
        function (data) {
            if (data.controllerResult.result === 'success') {
                $("#commentRow").empty();
                for(var i=0,comm=data.comments;i<comm.length;i++) {
                    $("#commentRow").append("<div class='row'>"+
                    "<div class='col-md-1'>"+
                        "<img src='../"+comm[i].user.headicon+"' class='img-circle' style='width: 100%;height: 80px;'>"+
                        "</div>"+
                        "<div class='col-md-11'>"+
                        "<div class='col-md-12'><p class='text-left'><strong>"+comm[i].user.name+"</strong></p></div>"+
                        "<div class='col-md-12'><p class='text-left'>"+comm[i].content+"</p></div>"+
                        "<div class='col-md-12'><p class='text-left'><small>"+formatDate1(comm[i].commentTime)+"</small></p></div>"+
                        "</div>"+
                        "</div>"+
                        "<hr />");
                }
            } else {
                swal(data.controllerResult.message, "", "error");
            }
        }, "json"
    );
}

/**
 * 留言
 */
function message() {
    var userId = $("#userId").val();
    var buildsId = $("#buildsId").val();
    var agencyId = $("#agencyId").val();
    var content = $("#message");
    validate('#messageForm');
    if($("#messageForm").validationEngine('validate')) {
        if(userId === null || userId === '') {
            swal("请先登录用户账号！","","warning");
        } else {
            $.post(contextPath + "/message/add",
                {"buildingsId": buildsId,"agencyId": agencyId,"message.content":content.val()},
                function (data) {
                    if (data.controllerResult.result === 'success') {
                        swal("留言成功","","success");
                        content.val("");
                        appendMessage(1);
                    } else {
                        swal(data.controllerResult.message, "", "error");
                    }
                }, "json"
            );
        }
    }
}

/**
 * 评论
 */
function comment() {
    var userId = $("#userId").val();
    var buildsId = $("#buildsId").val();
    var agencyId = $("#agencyId").val();
    var content = $("#comment");
    validate('#commentForm');
    if($("#commentForm").validationEngine('validate')) {
        if(userId === null || userId === '') {
            swal("请先登录用户账号！","","warning");
        } else {
            $.post(contextPath + "/comment/add",
                {"buildingsId": buildsId,"agencyId": agencyId,"comment.content":content.val()},
                function (data) {
                    if (data.controllerResult.result === 'success') {
                        swal("评价成功","","success");
                        content.val("");
                        appendComment();
                    } else {
                        swal(data.controllerResult.message, "", "error");
                    }
                }, "json"
            );
        }
    }
}

/**
 * 点赞
 */
function like() {
    var userId = $("#userId").val();
    var buildsId = $("#buildsId").val();
    if(userId === null || userId === '') {
        swal("请先登录用户账号！","","warning");
    } else {
        $.post(contextPath + "/like/addOrDel",
            {"buildsId": buildsId},
            function (data) {
                if (data.controllerResult.result === 'success') {
                    if(data.controllerResult.message === '取消成功') {
                        $(".click").attr("src","");
                        $(".click").attr("src","../img/unclick.svg");
                    } else {
                        $(".click").attr("src","");
                        $(".click").attr("src","../img/clicked.svg");
                    }
                } else {
                    swal(data.controllerResult.message, "", "error");
                }
            }, "json"
        );
    }
}

function appointment() {
    var userId = $("#userId").val();
    var buildsId = $("#buildsId").val();
    if(userId === null || userId ==''){
        swal("请先登录用户账号！","","warning");
    }else{
        window.location = "/appointment/appointmentByEmployee?buildsId="+buildsId;
    }
}

function delAppointment() {
    var appointmentId = $("#appointmentId").val();
    swal({
            title: "你要取消预约吗？",
            text: "",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "是的",
            cancelButtonText:"点错了",
            closeOnConfirm: false
        },
        function(){
            $.post(contextPath + "/appointment/delAppointment",
                {"appointmentId": appointmentId},
                function (data) {
                    if (data.controllerResult.result === 'success') {
                        $("#delAppButton").hide();
                        $("#appButton").show();
                        swal("您已取消预约","","success");
                    } else {
                        swal(data.controllerResult.message, "", "error");
                    }
                }, "json"
            )
        });
}