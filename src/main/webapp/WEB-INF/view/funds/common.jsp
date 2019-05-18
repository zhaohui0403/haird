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
    <link href="/static/css/pages/login.css" rel="stylesheet" />
    <script src="/static/js/laydate/laydate.js"></script>
    <script src="/static/js/layer/layer.js"></script>
    <%--<script src="/static/js/layui/layui.js"></script>--%>
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
            font-size: 16px;
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
        })
    </script>
</head>
<body>
<form class="form-inline" role="form" action="/funds" method="post" style="border:1px solid #999999">

    <div class="form-group">
        <label class="col-sm-4" for="startTime">开始时间:</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="startTime" name="startTime"
                   placeholder="开始时间">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-4" for="endTime">结束时间:</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="endTime" name="endTime"
                   placeholder="结束时间">
        </div>
    </div>
    <button type="button" class="btn btn-default" onclick="sub()">搜索</button>
    <button type="button" class="btn btn-default" onclick="signFund()">开支</button>
</form>
<script type="text/javascript">
    var date = new Date();
    laydate.render({
        elem:'#startTime',//元素
        btns: ['clear','now','confirm'],//按钮
        lang: 'cn'//语言
        ,theme: 'molv'//背景
        ,value: '<fmt:formatDate value="${funds.startTime}" pattern="yyyy-MM-dd"/>'//初始值
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
        ,value: '<fmt:formatDate value="${funds.endTime}" pattern="yyyy-MM-dd"/>'
        ,event: 'focus'
        ,done: function(date) {
            $("#endTime").val(date);
        }
    })

    function signFund() {
        layer.open({
            type:2,
            title:'开支',
            fixed: false, //不固定
            maxmin: true,
            area: ['780px', '500px'],
            content: '/fundSign'
        })
    }
    function sub() {
        $('form').submit;
    }
</script>
<hr>
</body>
</html>
