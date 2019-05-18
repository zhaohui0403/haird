$(function () {
    $("#switch_login").click(function(){
        $('#switch_wxLogin').removeClass("switch_btn_focus").addClass('switch_btn');
        $('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
        $('#login-content').css("display","block");
        $('#wxLogin').css("display","none");
    });
    $('#switch_wxLogin').click(function(){

        $('#switch_wxLogin').removeClass("switch_btn").addClass('switch_btn_focus');
        $('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
        $('#wxLogin').css('display','block');
        $('#login-content').css('display','none');
    });
});