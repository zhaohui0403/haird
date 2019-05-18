<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/3
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <meta http-equiv="context-type" content="text/html;charset=utf-8">
    <jsp:include page="head.jsp"/>
</head>
<script type="text/javascript">
    $(function () {
        $('form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 5,
                            max: 18,
                            message: '用户名长度必须在6到18位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '用户名只能包含大写、小写、数字和下划线'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                    }
                }
            }
        });
    })
</script>

<style type="text/css">
    .help-block {
        color:red
    }
</style>
<body style="background-color: #999999">
<div id="login-container">
    <div id="login-content" class="clearfix">
        <form action="/submit" method="post"/>
        <fieldset>
            <div class="form-group">
                <label class="control-label" for="username">Username</label>
                <div class="controls">
                    <input type="text" name="username" id="username"/>
                </div>
            </div>

            <div class="control-group" style="color: red">
                <c:if test="${status != 1}">
                    ${msg}
                </c:if>
            </div>

            <div class="form-group">
                <label class="control-label" for="password">Password</label>
                <div class="controls">
                    <input type="password" name="password" id="password"/>
                </div>
            </div>
        </fieldset>

        <div class="form-group" style="margin-left: 150px;position: absolute">
            <button type="submit" class="btn btn-warning btn-large">
                Login
            </button>
        </div>
        </form>
    </div>
</div>
</body>
</html>
