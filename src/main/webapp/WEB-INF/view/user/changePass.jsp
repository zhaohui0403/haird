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
    <c:if test="${username == 'user'}">
        <legend>权限密码修改</legend>
    </c:if>
    <c:if test="${username == 'admin'}">
        <legend>登录密码修改</legend>
    </c:if>
    <form action="/update" method="post" class="form-horizontal" style="margin-top: 10px">
        <input type="hidden" name="username" value="${username}"/>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="oldPass">原始密码：</label>
            <div class="input-group col-sm-7">
                <input type="password" name="oldPass" id="oldPass" class="form-control" style="width: 280px"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="password">新密码：</label>
            <div class="input-group col-sm-7">
                <input type="password" name="password" id="password" class="form-control" style="width: 280px"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="confirm">确认密码：</label>
            <div class="input-group col-sm-7">
                <input type="password" name="confirm" id="confirm" class="form-control" style="width: 280px"/>
            </div>
        </div>

        <div class="form-group col-sm-10" style="text-align: center">
            <button type="submit" class="btn btn-default">确定</button>
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
                        oldPass: {
                            message: '用户名验证失败',
                            validators: {
                                notEmpty: {
                                    message: '请填写原始密码！'
                                },
                                //ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                                remote: {
                                    url: 'checkPass',//验证地址
                                    message: '原始密码错误！',//提示消息
                                    delay: 1000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置3秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                                    type: 'POST',//请求方式
                                    //自定义提交数据，默认值提交当前input value
                                    data: function (validator) {
                                         return {
                                            username:$("input[name='username']").val(),
                                            password:$("#oldPass").val()
                                         };
                                    }
                                },
                            }
                        },
                        password: {
                            message: '密码无效',
                            validators: {
                                notEmpty: {
                                    message: '密码不能为空'
                                },
                            }
                        },
                        confirm: {
                            message: '密码无效',
                            validators: {
                                notEmpty: {
                                    message: '请确认密码！'
                                },
                                identical: {//相同
                                    field: 'password',
                                    message: '两次密码不一致'
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
    function ret() {
        window.history.back();
    }
</script>
</body>
</html>
