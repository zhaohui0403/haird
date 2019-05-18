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
            width: 1000px;
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
<body style="background-image:url(/img/haird.jpg);background-repeat:no-repeat;background-size:cover">
<fieldset>
    <legend>开具消费单</legend>
    <form action="/commit" method="post" class="form" role="form" style="margin-top: 10px">
        <div class="form-group">
            <label class="col-sm-4" for="contype">消费类型:</label>
            <div class="col-sm-7 input-group">
                <select class="form-control" name="contype" id="contype" >
                    <option value="0" >洗吹造型</option>
                    <option value="1" >洗剪吹造型</option>
                    <option value="2" >烫发</option>
                    <option value="3" >染发</option>
                    <option value="4" >烫染</option>
                    <option value="5" >外卖</option>
                    <option value="6">办卡</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-4 control-label" for="price">原价:</label>
            <div class="col-sm-7 input-group">
                <input type="text" class="form-control" id="price" name="price"
                       placeholder="原价" >
                <span class="input-group-addon">元</span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-4 control-label" for="discount">折扣:</label>
            <div class="col-sm-7 input-group">
                <input type="text" class="form-control" id="discount" name="discount"
                       placeholder="折扣" value="100" >
                <span class="input-group-addon">%</span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-4 control-label" for="paytype">支付类型:</label>
            <div class="col-sm-7 input-group" >
                <select class="form-control" name="paytype" id="paytype" >
                    <option value="0" >微信</option>
                    <option value="1" >现金</option>
                    <option value="2" >支付宝</option>
                    <option value="3" >会员卡</option>
                </select>
            </div>
        </div>
        <div class="form-group" id="memberPhone" style="display: none">
            <label class="col-sm-4 control-label" for="telephone">手机号:</label>
            <div class="col-sm-7 input-group">
                <input type="text" class="form-control" id="telephone" name="telephone"
                       placeholder="手机号" >
            </div>
        </div>

        <div class="form-group" id="memberNa" style="display: none">
            <label class="col-sm-4 control-label" for="membername">姓名:</label>
            <div class="col-sm-7 input-group">
                <input type="text" class="form-control" id="membername" name="membername"
                       placeholder="姓名" readonly>
            </div>
        </div>

        <div class="form-group" id="memberIdDiv" style="display: none">
            <label class="col-sm-4 control-label" for="memberId">会员卡号:</label>
            <div class="col-sm-7 input-group">
                <input type="text" class="form-control" id="memberId" name="memberId"
                       placeholder="会员卡号" readonly>
            </div>
        </div>

        <div class="form-group" id="memberAmout" style="display: none">
            <label class="col-sm-4 control-label" for="member">会员卡余额:</label>
            <div class="col-sm-7 input-group">
                <input type="text" class="form-control" id="member" name="member" readonly>
                <span class="input-group-addon">元</span>
            </div>
        </div>

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

        <div class="form-group">
            <label class="col-sm-4 control-label" for="haircommi">发型师提成:</label>
            <div class="col-sm-7 input-group">
                <input type="text" class="form-control" id="haircommi" name="haircommi"
                       placeholder="会员卡号" value="0" readonly >
                <span class="input-group-addon">元</span>
            </div>
        </div>

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

        <div class="form-group">
            <label class="col-sm-4 control-label" for="assicommi">助理提成:</label>
            <div class="col-sm-7 input-group">
                <input type="text" class="form-control" id="assicommi" name="assicommi"
                       placeholder="助理提成" value="0" readonly >
                <span class="input-group-addon">元</span>
            </div>
        </div>

        <div style="text-align: right;width: 90%;margin-top: 50px;">
            <label style="color: red;font-size: 20px">应收:</label>
            <input type="text" id="amout" name="amout" placeholder="实收" value="0" readonly style="width: 50px;height: 34px">
            <button type="submit" class="btn btn-default">
                确定
            </button>
            <button type="button" class="btn btn-default" onclick="retn()">
                返回
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
                        memberId:{
                            validators:{
                                notEmpty:{
                                    message:' '
                                },
                                stringLength:{
                                    min: 5,
                                    max: 5,
                                    message: ' '
                                }
                            }
                        },
                        price:{
                            validators:{
                                notEmpty:{
                                    message:' '
                                }
                            }

                        }
                    }
                });

            });
        </script>
    </form>
</fieldset>
</body>
</html>
