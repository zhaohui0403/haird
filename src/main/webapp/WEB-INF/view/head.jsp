<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/2
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object user = request.getSession().getAttribute("user");
%>
<html>
<head>
    <title>head</title>
    <meta http-equiv="context-type" content="text/html;charset=utf-8">
    <script type="text/javascript" src="/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
    <link href="/static/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="/static/css/bootstrap-validator/bootstrapValidator.css" rel="stylesheet">
    <script src="/static/js/bootstrap/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap/bootstrap.min.js"></script>
    <link href="/static/css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link href="/static/css/pages/login.css" rel="stylesheet"/>
    <style type="text/css">
        h1 {
            color: #FFFFFF;
            margin-top: 0px;
            font-size: 54px;
        }
    </style>
    <script type="text/javascript">
        if (top.location !== self.location) {
            top.location = self.location;
        }
        $(function () {
            var user = '<%=user%>';
            if (user == null) {
                top.href = "/login";
            }
        });
    </script>
</head>
<body>
<div>
    <div style="background-color: #333333;margin: 0px;text-align: center">
        <h1>管理系统</h1>
    </div>
</div>
</body>
</html>
