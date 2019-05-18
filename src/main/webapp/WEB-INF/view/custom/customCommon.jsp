<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/5
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
    <link href="/static/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="/static/css/bootstrap-validator/bootstrapValidator.css" rel="stylesheet">
    <script src="/static/js/bootstrap/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap/bootstrap.min.js"></script>
    <link href="/static/css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="/static/css/pages/login.css" rel="stylesheet" />
    <style type="text/css">
        a{
            color: black;
            text-decoration:none;
        }
        .form-group{
            width: 300px;
        }
        .col-sm-3{
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
</head>
<body>
<form class="form-inline" role="form" action="/custom" method="post" style="border:1px solid #999999">
    <div class="form-group">
        <label class="col-sm-3" for="name">名称:</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="name" name="customname"
                   placeholder="员工名称">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3" for="type">类别:</label>
        <div class="col-sm-4">
        <select class="form-control" name="customtype" id="type">
            <option value="0">请选择</option>
            <option value="0">店长</option>
            <option value="1">发型师</option>
            <option value="2">助理</option>
        </select>
        </div>
    </div>
    <button type="submit" class="btn btn-default">搜索</button>
    <button class="btn btn-default"><a target="fname" href="/customSign">注册</a></button>
</form>
<hr>
</body>
</html>
