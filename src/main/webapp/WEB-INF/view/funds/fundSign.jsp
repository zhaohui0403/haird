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
    <link href="../static/css/bootstrap-validator/bootstrapValidator.css" rel="stylesheet">
    <style type="text/css">
        fieldset {
            padding: 10px;
            margin: 50px 0 0 150px;
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
    <legend>开支登记</legend>
    <form action="/saveFunds" method="post" class="form-horizontal" style="margin-top: 10px">
        <input type="hidden" value="${funds.id}" name="id">
        <div class="form-group">
            <label class="col-sm-3 control-label" for="amout">开支金额：</label>
            <div class="input-group col-sm-7">
                <input type="text" name="amout" id="amout" value="${funds.amout}" placeholder="金额"
                       class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="des">资金去向：</label>
            <div class="input-group col-sm-7">
                <textarea cols="30" rows="5" name="des" id="des"  placeholder="资金去向"
                       class="form-control">${funds.des}</textarea>
            </div>
        </div>
        <div class="form-group col-sm-10" style="text-align: center">
            <button type="button" id="submit" class="btn btn-default" onclick="saveFund()">
                提交
            </button>
        </div>
    </form>
</fieldset>
<script type="text/javascript">
    function saveFund() {
        var amunt = $('#amout').val();
        var desc = $('#des').val();
        if(amunt == null || amunt == '' || desc == null || desc == ''){
            return false;
        }
        $("#submit").attr("disabled", true);
        $.ajax({
            type: "post",
            async: false,
            dateType: "json",
            url: $('.form-horizontal').attr("action"),
            data: $('.form-horizontal').serialize(),
            success: function (data) {
                parent.layer.close(parent.layer.getFrameIndex(window.name));
                parent.location.reload();
            }
        })
    }
</script>
</body>
</html>
