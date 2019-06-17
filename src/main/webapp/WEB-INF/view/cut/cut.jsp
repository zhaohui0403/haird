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
    <script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
    <link href="/static/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="/static/css/bootstrap-validator/bootstrapValidator.css" rel="stylesheet">
    <script src="/static/js/bootstrap/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap/bootstrap.min.js"></script>
    <link href="/static/css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet" />
    <script src="/static/js/laydate/laydate.js"></script>
    <script src="/static/js/layer/layer.js"></script>
    <script src="/static/js/bill.js"></script>
    <script src="/static/js/common.js"></script>
    <style type="text/css">
        fieldset {
            padding: 10px;
            margin: 50px;
            color: #333;
            border: #06c solid 1px;
        }

        legend {
            color: #06c;
            padding: 5px 10px;
            font-weight: 100;
            text-align: center;
        }
        .form-group{
            /*border: 1px solid red;*/
            width: 440px;
            margin: 10px;
            float: left;
            text-align: center;
        }
        .col-sm-4{
            font-size: 14px;
            text-align: right;
            line-height: 36px;
        }
        .form{
            border-radius: 20px;
        }
    </style>
</head>
<body>
<fieldset>
    <legend>剪发</legend>
    <form action="/save" method="post" class="form" role="form" style="margin-top: 10px">
        <input type="hidden" class="form-control" id="cardId" name="cardId"
                       value="${cardId}" >

        <input type="hidden" class="form-control" id="price" name="price"
               value="${amout}">

        <input type="hidden" class="form-control" id="discount" name="discount"
               value="100">

        <div class="form-group">
            <label class="col-sm-4 control-label" for="hairstye">发型师:</label>
            <div class="col-sm-7 input-group" >
                <select class="form-control" name="hairstye" id="hairstye" >
                    <c:forEach var="custom1" items="${custom1}">
                        <option value="${custom1.id}" label="${custom1.commission1}~${custom1.commission2}">${custom1.customname}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <br>

        <div class="form-group">
            <label class="col-sm-4 control-label" for="haircommi">发型师提成:</label>
            <div class="col-sm-7 input-group">
                <input type="text" class="form-control" id="haircommi" name="haircommi"
                       placeholder="会员卡号" value="0" readonly >
                <span class="input-group-addon">元</span>
            </div>
        </div>
        <br>

        <div class="form-group">
            <label class="col-sm-4 control-label" for="assistant">助理:</label>
            <div class="col-sm-7 input-group">
                <select class="form-control" name="assistant" id="assistant" >
                    <c:forEach var="custom2" items="${custom2}">
                        <option value="${custom2.id}" label="${custom2.commission1}~${custom2.commission2}">${custom2.customname}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <br>

        <div class="form-group">
            <label class="col-sm-4 control-label" for="assicommi">助理提成:</label>
            <div class="col-sm-7 input-group">
                <input type="text" class="form-control" id="assicommi" name="assicommi"
                       placeholder="助理提成" value="0" readonly >
                <span class="input-group-addon">元</span>
            </div>
        </div>
        <br>
        <div class="form-group">
            <button type="button" class="btn btn-default" onclick="save()">
                确定
            </button>
            <button type="button" class="btn btn-default" onclick="retn()">
                返回
            </button>
        </div>
    </form>
</fieldset>
<script type="text/javascript">
    function save() {
        $("#submit").attr("disabled", true);
        $.ajax({
            type: "post",
            async: false,
            dateType: "json",
            url: "/save",
            data: $('.form').serialize(),
            success: function (data) {

                setTimeout(function () {
                    parent.layer.close(parent.layer.getFrameIndex(window.name));
                    parent.location.reload();
                }, 1500);

            }
        })
    }
</script>
</body>
</html>
