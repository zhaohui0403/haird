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
    <title>充值</title>
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
<body>
<fieldset>
    <legend>充值</legend>
    <form action="/charge" method="post" class="form-horizontal" style="margin-top: 10px">
        <div class="form-group">
            <label class="col-sm-3 control-label" for="memberid">会员卡号：</label>
            <div class="input-group col-sm-7">
                <input type="text" name="memberid" id="memberid" value="${cardId}"
                       class="form-control" readonly style="width: 280px"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="amout">充值金额：</label>
            <div class="input-group col-sm-7">
                <input type="text" name="amout" id="amout" class="form-control" style="width: 280px"/>
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
            <label class="col-sm-3 control-label" for="handlerman">处理人：</label>
            <div class="input-group col-sm-7">
                <select class="form-control" name="handlerman" id="handlerman" style="width: 280px">
                    <c:forEach var="cus" items="${custom}">
                        <option value="${cus.id}">${cus.customname}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group col-sm-10" style="text-align: center">
            <button type="button" class="btn btn-default" onclick="charge()" id="submit">
                充值
            </button>
            <button type="button" class="btn btn-default" onclick="ret()">返回</button>
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
                        amout: {
                            validators: {
                                notEmpty: {
                                    message: '充值金额不能为空'
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
    function charge() {
        $("#submit").attr("disabled", true);
        var amunt = $('#amout');
        if(amunt == null || amunt == ''){
            return false;
        }
        $.ajax({
            type: "post",
            async: false,
            dateType: "json",
            url: $('.form-horizontal').attr("action"),
            data: $('.form-horizontal').serialize(),
            success: function (data) {

                layer.msg("充值成功,当前余额：" + data);
                setTimeout(function () {
                    parent.layer.close(parent.layer.getFrameIndex(window.name));
                    parent.location.reload();
                }, 3000);

            }
        })
    }
    function ret() {
        parent.layer.close(parent.layer.getFrameIndex(window.name));
    }
</script>
</body>
</html>
