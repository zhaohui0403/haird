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
    <link href="/static/css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet"/>
    <script src="/static/js/laydate/laydate.js"></script>
    <link rel="stylesheet" href="/static/js/layui/css/layui.css" media="all">
    <script src="/static/js/common.js"></script>
    <script src="/static/js/layer/layer.js"></script>
    <script src="/static/js/layui/layui.js" charset="utf-8"></script>
    <style type="text/css">
        a {
            color: black;
            text-decoration: none;
        }

        .form-group {
            width: 320px;
        }

        .col-sm-4 {
            font-size: 8px;
            text-align: right;
            line-height: 36px;
        }

        .form-inline {
            padding: 20px 0px 20px 0px;
            border-radius: 20px;
        }

        .btn-default {
            margin-top: -6px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
        })
    </script>
</head>
<body style="background-image:url(/img/haird.jpg);background-repeat:no-repeat;background-size:cover">
<form class="form-inline" role="form" action="/wage" method="post" style="border:1px solid #999999">

    <div class="form-group">
        <label class="col-sm-4" for="id">员工:</label>
        <div class="col-sm-4">
            <select class="form-control" name="id" id="id" style="width: 196px">
                <option value="">请选择</option>
                <c:forEach var="custom" items="${custom}">
                    <option value="${custom.id}" <c:if test="${!empty wage.id && wage.id == custom.id}">selected</c:if>>${custom.customname}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-4" for="startTime">开始时间:</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="startTime" name="startTime"
                   placeholder="开始时间" style="width: 196px">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-4" for="endTime">结束时间:</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="endTime" name="endTime"
                   placeholder="结束时间" style="width: 196px">
        </div>
    </div>

    <input type="hidden" name="index" value="0">
    <input type="hidden" name="size" value="100">
    <button type="submit" id="search" class="btn btn-default">搜索</button>

</form>
<hr>
<div style="margin-left: 20px;margin-right: 20px;height:392px;overflow:auto">
    <table class="table table-bordered table-hover table-condensed">
        <thead>
        <tr>
            <th style="text-align: center">员工</th>
            <th style="text-align: center">工资</th>
            <th style="text-align: center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="wage" items="${wages}">
            <tr>
                <td style="text-align: center">${wage.customname}</td>
                <td style="text-align: center">${wage.amout}</td>
                <td style="text-align: center">
                    <button class="btn delete" type="button" onclick="detail(${wage.id})">明细</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
</div>
<script type="text/javascript">
    laydate.render({
        elem: '#startTime',//元素
        btns: ['clear', 'now', 'confirm'],//按钮
        lang: 'cn'//语言
        , theme: 'molv'//背景
        , value: '<fmt:formatDate value="${wage.startTime}" pattern="yyyy-MM-dd"/>'//初始值
        , event: 'focus'//弹出方式
        , done: function (date) {
            $("#startTime").val(date);
        }
    })
    laydate.render({
        elem: '#endTime',
        btns: ['clear', 'now', 'confirm'],
        lang: 'cn'
        , theme: 'molv'
        , value: '<fmt:formatDate value="${wage.endTime}" pattern="yyyy-MM-dd"/>'
        , event: 'focus'
        , done: function (date) {
            $("#endTime").val(date);
        }
    })
    function detail(id) {
        layer.open({
            type: 2,
            title: '消费记录',
            fixed: false, //不固定
            maxmin: true,
            area: ['800px', '500px'],
            content: 'detail?id=' + id,
        })
    }
</script>
<hr>
</body>
</html>
