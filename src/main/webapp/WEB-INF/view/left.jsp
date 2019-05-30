<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/5
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="../static/js/layer/layer.js"></script>
    <style type="text/css">
        a {
            color: black;
            text-decoration: none;
        }

        button {
            width: 200px;
        }
    </style>
</head>
<body>
<button type="button" class="btn btn-primary btn-lg "><a href="/member" target="fname"> 会员管理</a></button><br>
<button type="button" class="btn btn-primary btn-lg "><a href="javascript:void(0);" onclick="return check('/funds')">财务管理</a></button><br>
<button type="button" class="btn btn-primary btn-lg "><a href="javascript:void(0);" onclick="return check('/custom')">员工管理</a></button><br>
<button type="button" class="btn btn-primary btn-lg "><a href="/rebate" target="fname">返利管理</a></button><br>
<button type="button" class="btn btn-primary btn-lg "><a href="javascript:void(0);" onclick="return check('/wage')">工资管理</a></button><br>
<button type="button" class="btn btn-primary btn-lg "><a href="/record" target="fname">消费管理</a></button><br>
<script type="text/javascript">
    function check(url) {
        layer.prompt({title: '请输入密码：', formType: 1}, function (pass, index) {
            $.ajax({
                type: "post",
                async: false,
                dateType: "json",
                url: "/match",
                data: {password: 123456},
                success: function (date) {
                    if (date == true) {
                        layer.close(index);
                        $('#fname').get(0).src = url;
                    } else {
                        layer.msg("您输入的密码有误，请重新输入！")
                    }
                }
            });
        });
    }
</script>
</body>
</html>
