var contextPath = '';

$("#search ul li").click(function(){
    $(this).addClass("selected").siblings().removeClass("selected");
    var searchType = $(".selected").text();
    if(searchType === '文章') {
        $("#searchTxt").val("");
        $("#search_ul").empty().hide();
        autoSearch('article','personInfor','id');
    }
    if(searchType === '户型') {
        $("#searchTxt").val("");
        $("#search_ul").empty().hide();
        autoSearch('house','detail','house.id');
    }
    if(searchType === '活动') {
        $("#searchTxt").val("");
        $("#search_ul").empty().hide();
        autoSearch('activity','personInfor','id');
    }
    if(searchType === '楼盘') {
        $("#searchTxt").val("");
        $("#search_ul").empty().hide();
        autoSearch('builds','personInfo','id');
    }
});

$(function () {
    $("#search ul li:first").addClass("selected");
    autoSearch('builds','personInfo','id');
});

function autoSearch(value,path,idType) {
    var search = $("#searchTxt");
    $(search).keyup(function () {
        if(search.val().trim() !== "") {
            $.post(contextPath + "/"+value+"/search",
                {"searchStr":search.val()},
                function (data) {
                    if (data.controllerResult.result === 'success') {
                        var searchsList = data.searches;
                        if(searchsList.length>0) {
                            $("#search_ul").empty().show();
                            for(var i=0;i<searchsList.length;i++) {
                                $("#search_ul").append("<a style=' text-decoration: none; color: #060606;' href='../"+value+"/"+path+"?"+idType+"="+searchsList[i].id+"'><li style='list-style: none; padding-left: 15px;  font-size: 20px;'>"+searchsList[i].name+"</li></a>");
                            }
                        }else{
                            $("#search_ul").empty().hide();
                        }
                    } else {
                        alert(data.controllerResult.message);
                    }
                }, "json"
            );
        }else{
            $("#search_ul").empty().hide();
        }
    });
}

$(document).click(function () {
    $("#search_ul").empty().hide();
});