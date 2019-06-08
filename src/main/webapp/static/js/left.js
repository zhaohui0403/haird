function check(url) {
    layer.prompt({title: '请输入密码：', formType: 1}, function (pass, index) {
        $.ajax({
            type: "post",
            async: false,
            dateType: "json",
            url: "/match",
            data: {password: pass},
            success: function (date) {
                if (date == true) {
                    layer.close(index);
                    $('#fname').get(0).src = url;
                } else {
                    layer.msg("您输入的密码有误，请重新输入！")
                }
            }
        });
    });
}

function jump(url) {
    if(url == "/logout"){
        if (top.location !== self.location) {
            top.location = self.location;
        }
        top.location.href = "/login";
    }
    $('#fname').get(0).src = url;
}

function show(e) {
    // var cla = $(this).children("div").attr("class");
    var cla = $(e).children(":first").prop("class");
    if(cla == "down"){
        $(e).children(":first").attr("class","up");
        $(e).next().show();
    }else {
        $(e).children(":first").attr("class","down");
        $(e).next().hide();
    }
}