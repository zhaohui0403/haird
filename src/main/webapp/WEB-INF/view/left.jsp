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
    <script src="/static/js/layer/layer.js"></script>
    <script src="/static/js/left.js"></script>
    <link rel="stylesheet" href="/static/css/left.css">
</head>
<body style="background-color:#4A515B">
<div>
    <button type="button" class="btn btn-primary btn-lg nav-btn" onclick="show(this)">会员管理
        <div class="down"></div>
    </button>
    <div class="nav">
        <button type="button" class="btn btn-primary btn-lg nav-tab" onclick="jump('/member')">充值卡管理</button><br>
        <button type="button" class="btn btn-primary btn-lg nav-tab" onclick="jump('hairdCard')">剪发卡管理</button>
    </div>
</div>
<div>
    <button type="button" class="btn btn-primary btn-lg nav-btn" onclick="jump('/record')">消费管理
        <div class="emp"></div>
    </button>
</div>
<div>
    <button type="button" class="btn btn-primary btn-lg nav-btn" onclick="return check('/funds')">财务管理
        <div class="emp"></div>
    </button>
</div>
<div>
    <button type="button" class="btn btn-primary btn-lg nav-btn" onclick="return check('/custom')">员工管理
        <div class="emp"></div>
    </button>
</div>
<div>
    <button type="button" class="btn btn-primary btn-lg nav-btn" onclick="jump('/rebate')">返利管理
        <div class="emp"></div>
    </button>
</div>
<div>
    <button type="button" class="btn btn-primary btn-lg nav-btn" onclick="return check('/wage')">工资管理
        <div class="emp"></div>
    </button>
</div>
<div>
    <button type="button" class="btn btn-primary btn-lg nav-btn" onclick="show(this)">密码管理
        <div class="down"></div>
    </button>
    <div class="nav">
        <button type="button" class="btn btn-primary btn-lg nav-tab" onclick="jump('/loginChange')">登录密码修改</button><br>
        <button type="button" class="btn btn-primary btn-lg nav-tab" onclick="jump('/powerChange')">权限密码修改</button>
    </div>
</div>
<div>
    <button type="button" class="btn btn-primary btn-lg nav-btn" onclick="jump('/logout')">退出登录
        <div class="emp"></div>
    </button>
</div>
</body>
</html>
