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
    <c:when test="${custom.id != null && custom.id != ''}">
    <legend>员工更改</legend>
    <form action="/updateCustom" method="post" class="form-horizontal" style="margin-top: 10px">
        <input type="hidden" value="${custom.id}" name="id">
        </c:when>
        <c:otherwise>
        <legend>员工注册</legend>
        <form action="/addCustom" method="post" class="form-horizontal" style="margin-top: 10px">
            </c:otherwise>
            </c:choose>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="customname">员工姓名：</label>
                <div class="input-group col-sm-7">
                    <input type="text" name="customname" id="customname" value="${custom.customname}" placeholder="员工姓名" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="type">类别：</label>
                <div class="input-group col-sm-7">
                    <select class="form-control" name="customtype" id="type">
                        <option value="0" <c:if test="${custom.customtype == 0}">selected</c:if>>店长</option>
                        <option value="1" <c:if test="${custom.customtype == 1}">selected</c:if>>发型师</option>
                        <option value="2" <c:if test="${custom.customtype == 2}">selected</c:if>>助理</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="commission1">非会员提成：</label>
                <div class="input-group col-sm-7">
                    <input type="text" name="commission1" value="${custom.commission1}" id="commission1" placeholder="非会员提成" class="form-control"/>
                    <span class="input-group-addon">%</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="commission2">会员提成：</label>
                <div class="input-group col-sm-7">
                    <input type="text" name="commission2" value="${custom.commission2}" id="commission2" placeholder="会员提成" class="form-control"/>
                    <span class="input-group-addon">%</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="wage">基本工资：</label>
                <div class="input-group col-sm-7">
                    <input type="text" name="wage" id="wage" value="${custom.wage}" placeholder="基本工资" class="form-control"/>
                    <span class="input-group-addon">元</span>
                </div>
            </div>
            <div class="form-group col-sm-10" style="text-align: center">
                <button type="submit" class="btn btn-default">
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
                            customname: {
                                validators: {
                                    notEmpty: {
                                        message: '姓名不能为空'
                                    },
                                }
                            },
                            commission1: {
                                validators: {
                                    notEmpty: {
                                        message: '非会员提成不能为空'
                                    },
                                }
                            },
                            commission2: {
                                validators: {
                                    notEmpty: {
                                        message: '会员提成不能为空'
                                    },
                                }
                            },
                            wage: {
                                validators: {
                                    notEmpty: {
                                        message: '员工工资不能为空'
                                    },
                                }
                            },
                        }
                    });

                });
            </script>
        </form>
</fieldset>
</body>
</html>
