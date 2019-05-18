<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/8
  Time: 23:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
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
    <link rel="stylesheet" href="/static/js/layui/css/layui.css"  media="all">
    <script src="/static/js/common.js"></script>
    <style type="text/css">
        a{
            color: black;
            text-decoration:none;
        }
        .form-group{
            width: 320px;
        }
        .col-sm-4{
            font-size: 8px;
            text-align: right;
            line-height: 36px;
        }
        .form-inline{
            padding: 20px 0px 20px 0px;
            border-radius: 20px;
        }
        .btn-default{
            margin-top: -6px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            <%--alert(${record.contype})--%>
        })
    </script>
</head>
<body>
<form class="form-inline" role="form" action="/record" method="post" style="border:1px solid #999999">
    <div class="form-group">
        <label class="col-sm-4" for="contype">消费类型:</label>
        <div class="col-sm-4">
            <select class="form-control" name="contype" id="contype" style="width: 196px">
                <option value="" <c:if test="${record.contype == \"\"}">selected</c:if>>请选择</option>
                <option value="0" <c:if test="${record.contype != \"\" &&  record.contype == 0}">selected</c:if>>洗吹造型</option>
                <option value="1" <c:if test="${record.contype != \"\" && record.contype == 1}">selected</c:if>>洗剪吹造型</option>
                <option value="2" <c:if test="${record.contype != \"\" && record.contype == 2}">selected</c:if>>烫发</option>
                <option value="3" <c:if test="${record.contype != \"\" && record.contype == 3}">selected</c:if>>染发</option>
                <option value="4" <c:if test="${record.contype != \"\" && record.contype == 4}">selected</c:if>>烫染</option>
                <option value="5" <c:if test="${record.contype != \"\" && record.contype == 5}">selected</c:if>>外卖</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-4" for="paytype">支付类型:</label>
        <div class="col-sm-4" >
            <select class="form-control" name="paytype" id="paytype" style="width: 196px">
                <option value="" <c:if test="${record.paytype == \"\"}">selected</c:if>>请选择</option>
                <option value="0" <c:if test="${record.paytype != \"\" && record.paytype == 0}">selected</c:if>>微信</option>
                <option value="1" <c:if test="${record.paytype != \"\" && record.paytype == 1}">selected</c:if>>现金</option>
                <option value="2" <c:if test="${record.paytype != \"\" && record.paytype == 2}">selected</c:if>>支付宝</option>
                <option value="3" <c:if test="${record.paytype != \"\" && record.paytype == 3}">selected</c:if>>会员卡</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-4" for="hairstye">发型师:</label>
        <div class="col-sm-4" >
            <select class="form-control" name="hairstye" id="hairstye" style="width: 196px">
                <option value="">请选择</option>
                <c:forEach var="custom1" items="${custom1}">
                    <option value="${custom1.id}">${custom1.customname}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <button type="submit" id="search" class="btn btn-default">搜索</button>

    <div class="form-group">
        <label class="col-sm-4" for="assistant">助理:</label>
        <div class="col-sm-4">
            <select class="form-control" name="assistant" id="assistant"  style="width: 196px">
                <option value="">请选择</option>
                <c:forEach var="custom2" items="${custom2}">
                    <option value="${custom2.id}">${custom2.customname}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-4" for="startTime">开始时间:</label>
        <div class="col-sm-4" >
            <input type="text" class="form-control" id="startTime" name="startTime"
                   placeholder="开始时间" style="width: 196px">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-4" for="endTime">结束时间:</label>
        <div class="col-sm-4" >
            <input type="text" class="form-control" id="endTime" name="endTime"
                   placeholder="结束时间" style="width: 196px">
        </div>
    </div>

    <input type="hidden"  name="index" value="${record.index}">
    <input type="hidden"  name="size" value="${record.size}">

    <button class="btn btn-default"><a target="fname" href="/bill">开单</a></button>
</form>
<script type="text/javascript">
    var date = new Date();
    laydate.render({
        elem:'#startTime',//元素
        btns: ['clear','now','confirm'],//按钮
        lang: 'cn'//语言
        ,theme: 'molv'//背景
        ,value: '<fmt:formatDate value="${record.startTime}" pattern="yyyy-MM-dd"/>'//初始值
        ,event: 'focus'//弹出方式
        ,done: function(date) {
            $("#startTime").val(date);
        }
    })
    laydate.render({
        elem:'#endTime',
        btns: ['clear','now','confirm'],
        lang: 'cn'
        ,theme: 'molv'
        ,value: '<fmt:formatDate value="${record.endTime}" pattern="yyyy-MM-dd"/>'
        ,event: 'focus'
        ,done: function(date) {
            $("#endTime").val(date);
        }
    })
</script>
<hr>
</body>
</html>
