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
    <title>办卡</title>
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
            margin: 50px auto;
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
<body style="background-image:url(/img/haird.jpg);background-repeat:no-repeat;background-size:cover;text-align: center">
<fieldset>
    <c:choose>
    <c:when test="${hairdCard.id != null && hairdCard.id != ''}">
    <legend>剪发卡修改</legend>
    <form action="/updateCard" method="post" class="form-horizontal" style="margin-top: 10px">
        <input type="hidden" value="${hairdCard.id}" name="id">
        </c:when>
        <c:otherwise>
        <legend>剪发卡办理</legend>
        <form action="/addCard" method="post" class="form-horizontal" style="margin-top: 10px">
            </c:otherwise>
            </c:choose>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="username">姓名：</label>
                <div class="input-group col-sm-7">
                    <input type="text" name="username" id="username" value="${hairdCard.username}" placeholder="姓名"
                           class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label" for="telephone">电话：</label>
                <div class="input-group col-sm-7">
                    <input type="text" name="telephone" id="telephone" value="${hairdCard.telephone}" placeholder="电话"
                           class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label" for="amout">金额：</label>
                <div class="input-group col-sm-7">
                    <input type="text" name="amout" id="amout" value="${hairdCard.amout}" placeholder="金额"
                           class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label" for="paytype">支付方式：</label>
                <div class="input-group col-sm-7">
                    <select class="form-control" name="paytype" id="paytype" style="width: 280px">
                        <option value="0">微信</option>
                        <option value="1">现金</option>
                        <option value="2">支付宝</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label" for="times">次数：</label>
                <div class="input-group col-sm-7">
                    <input type="text" name="times" id="times" value="${hairdCard.times}" placeholder="次数"
                           class="form-control"/>
                </div>
            </div>
            <c:if test="${hairdCard.cardId != null && hairdCard.cardId != ''}">
                <input type="hidden" name="cardId" value="${hairdCard.cardId}"/>
            </c:if>

            <div class="form-group col-sm-10" style="text-align: center">
                <button type="button" class="btn btn-default" id="submit" onclick="sub()">
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
                                }
                            },
                            amout: {
                                validators: {
                                    notEmpty: {
                                        message: '金额不能为空'
                                    },
                                }
                            },
                            times: {
                                validators: {
                                    notEmpty: {
                                        message: '次数不能为空'
                                    },
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

    });
    function sub() {
        var name = $("#username").val();
        var photo = $("#telephone").val();
        var amout = $("#amout").val();
        var times = $("#times").val();
        var check = $("#telephone").parent().children("small[style='']").html();
        if (isEmpty(name) || isEmpty(photo) || isEmpty(amout) || isEmpty(times) || typeof check != "undefined") {
            return false;
        }
        $("#submit").attr("disabled", true);
        $.ajax({
            type: "post",
            async: false,
            dateType: "json",
            url: $('.form-horizontal').attr("action"),
            data: $('.form-horizontal').serialize(),
            success: function (date) {
                if (date != null && date != '' && ${hairdCard.id == null }) {
                    layer.msg("办卡成功，卡号为：" + date);
                } else if (${hairdCard.id != null }) {
                    layer.msg("修改成功！");
                }
                setTimeout(function () {
                    window.location = "/hairdCard";
                }, 3000);

            }

        });
    }
    function isEmpty(obj) {
        if (typeof obj == "undefined" || obj == null || obj == "") {
            return true;
        } else {
            return false;
        }
    }
</script>
</body>
</html>
