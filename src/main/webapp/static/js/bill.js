$(function () {
    $('#price').blur(function () {
        var price = $('#price').val();
        var discount = $('#discount').val();
        if(price != null && price != ''){
            $('#amout').val(price * discount / 100);
        }
        haircommi();
        assicommi();
    });
    $('#discount').blur(function () {
        var price = $('#price').val();
        var discount = $('#discount').val();
        $('#amout').val(price * discount / 100);
        haircommi();
        assicommi();
    });
    $('#paytype').on('change', function () {
        var paytype = $('#paytype').val();
        if (paytype == 3) {
            $('#memberIdDiv').css("display","block");
            $('#memberAmout').css("display","block");
            $('#memberNa').css("display","block");
            $('#memberPhone').css("display","block");
        } else {
            $('#memberIdDiv').css("display","none");
            $('#memberAmout').css("display","none");
            $('#memberNa').css("display","none");
            $('#memberPhone').css("display","none");
            $('#memberId').val("");
            $('#telephone').val("");
            $('button[type="submit"]').attr("disabled",false);
        }
        haircommi();
        assicommi();
    })
    $('#telephone').blur(function () {
        var amout = $('#price').val() * $('#discount').val() / 100;
        var telephone = $('#telephone').val();
        if(telephone.length < 11){
            layer.msg("请填写正确的手机号！");
        }else {
            if (!isEmpty(memberId)) {
                $.ajax({
                    type: "post",
                    async: false,
                    dateType: "json",
                    url: 'getMember?telephone=' + telephone,
                    success: function (data) {
                        if (data == null || data == "") {
                            $('button[type="submit"]').attr("disabled", true);
                            layer.msg("该手机号未注册会员卡，请重新填写！");
                        } else if (data.amout < amout) {
                            $('button[type="submit"]').attr("disabled", true);
                            layer.msg("余额不足，请先进行充值或使用其他支付方式！");
                        }
                        $('#membername').val(data.username);
                        $('#memberId').val(data.id);
                        $('#member').val(data.amout);
                    }
                });
            }
        }
    });
    $('#hairstye').change(function () {
        haircommi();
    });
    function haircommi() {
        var haircommi;
        var paytype = $('#paytype').val();
        var dis = $('#hairstye option:selected').attr("label");
        if (paytype == 3) {
            haircommi = commi(true, dis);
            $('#haircommi').val(haircommi);
        } else {
            haircommi = commi(false, dis);
            $('#haircommi').val(haircommi);
        }
    }

    $('#assistant').change(function () {
        assicommi();
    });
    function assicommi() {
        var assicommi;
        var paytype = $('#paytype').val();
        var dis = $("#assistant option:selected").attr("label");
        if (paytype == 3) {
            assicommi = commi(true, dis);
            $('#assicommi').val(assicommi);
        } else {
            assicommi = commi(false, dis);
            $('#assicommi').val(assicommi);
        }
    }

    function commi(flag, comm) {
        var arr = comm.split("~");
        var amout = $('#price').val();
        var discount = $('#discount').val();
        if (flag) {
            /*if (amout > 100) {
                return amout * 0.25 * 0.9;
            } else {
                return amout * arr[0] * 0.9 / 100;
            }*/
            return amout * discount * arr[1] * 0.9 / 10000;
        } else {
            return amout * discount * arr[0] * 0.9 / 10000;
        }
    }
})
function retn() {
    window.history.back();
}
function isEmpty(obj){
    if(typeof obj == "undefined" || obj == null || obj == ""){
        return true;
    }else{
        return false;
    }
}