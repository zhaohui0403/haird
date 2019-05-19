<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/7
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
    <link href="/static/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="/static/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="/static/css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet"/>
    <script src="/static/js/bootstrap/bootstrapValidator.min.js"></script>
    <link href="/static/css/bootstrap-validator/bootstrapValidator.css" rel="stylesheet">
    <script src="/static/js/layer/layer.js"></script>
    <style type="text/css">
        fieldset {
            padding: 10px;
            margin: 50px;
            width: 500px;
            color: #333;
            border: #06c solid 1px;
        }

        legend {
            color: #06c;
            padding: 5px 10px;
            font-weight: 100;
            text-align: center;
        }
    </style>
</head>
<body style="background-image:url(/img/haird.jpg);background-repeat:no-repeat;background-size:cover">
<fieldset>
    <c:choose>
    <c:when test="${member.id != null && member.id != ''}">
    <legend>会员修改</legend>
    <form action="/updateMember" method="post" class="form-horizontal" style="margin-top: 10px">
        <input type="hidden" value="${member.id}" name="id">
        </c:when>
        <c:otherwise>
        <legend>会员注册</legend>
        <form action="/addMember" method="post" class="form-horizontal" style="margin-top: 10px">
            </c:otherwise>
            </c:choose>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="username">姓名：</label>
                <div class="input-group col-sm-7">
                    <input type="text" name="username" id="username" value="${member.username}" placeholder="姓名"
                           class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="telephone">电话：</label>
                <div class="input-group col-sm-7">
                    <input type="text" name="telephone" id="telephone" value="${member.telephone}" placeholder="电话"
                           class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="sex">性别：</label>
                <div class="input-group col-sm-7">
                    <select class="form-control" name="sex" id="sex">
                        <option value="0" <c:if test="${member.sex == 0}">selected</c:if>>男</option>
                        <option value="1" <c:if test="${member.sex == 1}">selected</c:if>>女</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="customType">性别：</label>
                <div class="input-group col-sm-7">
                    <select class="form-control" name="customType" id="customType">
                        <option value="0" <c:if test="${member.customType == 0}">selected</c:if>>老客户</option>
                        <option value="1" <c:if test="${member.customType == 1}">selected</c:if>>新客户</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="referrer">推荐人：</label>
                <div class="input-group col-sm-7">
                    <input type="text" name="referrer" value="${member.referrer}" id="referrer"
                           placeholder="推荐人会员卡号" class="form-control" <c:if test="${member.referrer != null && member.referrer != ''}">disabled</c:if>/>
                </div>
            </div>
            <div class="form-group col-sm-10" style="text-align: center">
                <button type="button" class="btn btn-default" id="submit" onclick="submitMember()">
                    提交
                </button>
            </div>
            <script type="text/javascript">
                //使用表单验证，div的class必须为form-group
                $(function () {
                    $('form').bootstrapValidator({
                        message: 'This value is not valid',
                        feedbackIcons: {
                            valid: 'glyphicon glyphicon-ok',
                            invalid: 'glyphicon glyphicon-remove',
                            validating: 'glyphicon glyphicon-refresh'
                        },
                        fields: {
                            username: {
                                validators: {
                                    notEmpty: {
                                        message: '姓名不能为空'
                                    },
                                }
                            },
                            telephone: {
                                validators: {
                                    notEmpty: {
                                        message: '电话号码不能为空'
                                    },
                                    stringLength: {
                                        min: 11,
                                        max: 11,
                                        message: '请输入11位手机号码'
                                    },
                                    regexp: {
                                        regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                                        message: '请输入正确的手机号码'
                                    },
                                    threshold :  11 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                                    remote: {
                                        url: 'checkTel',//验证地址
                                        message: '该电话号码已被注册',//提示消息
                                        delay :  1000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置3秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                                        type: 'POST',//请求方式
                                        //自定义提交数据，默认值提交当前input value
                                        /*data: function (validator) {
                                         return {
                                         whatever: $('text[name=userName]').val()
                                         };
                                         }*/
                                    }
                                }
                            },
                        }
                    });
                });
            </script>
        </form>
</fieldset>
<script type="text/javascript">
    $(function () {

    })
    function submitMember() {
        var name = $("#username").val();
        var photo = $("#telephone").val();
        var check = $("#telephone").parent().children("small[style='']").html();
        if(name == null || name == ''|| photo == null || photo == '' || typeof check != "undefined"){
            return false;
        }
        $("#submit").attr("disabled", true);
        $.ajax({
            type:"post",
            async:false,
            dateType:"json",
            url:$('.form-horizontal').attr("action"),
            data:$('.form-horizontal').serialize(),
            success:function (date) {
                if(date != null && date != '' && ${member.id == null } ){
                    layer.msg("注册成功，会员卡号为：" + date);
                }
                setTimeout(function(){
                    window.location = "/member";
                },3000);

            }

        });
    }
    function isEmpty(obj){
        if(typeof obj == "undefined" || obj == null || obj == ""){
            return true;
        }else{
            return false;
        }
    }
</script>
</body>
</html>
