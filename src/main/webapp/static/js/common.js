function match(url){
    layer.prompt({title: '请输入密码：', formType: 1}, function(pass, index){
        $.ajax({
            type:"post",
            async:false,
            dateType:"json",
            url:"/match",
            data:{password:pass},
            success:function (date) {
                if(date == true){
                    window.location = url;
                    layer.close(index);
                }else{
                    layer.msg("您输入的密码有误，请重新输入！")
                }
            }
        });
    });
}
