<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/16
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>剪发记录</title>
    <link href="/static/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="/static/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <script src="/static/js/layer/layer.js"></script>
</head>
<body>
<div style="margin-left: 20px;margin-right: 20px;">
    <table class="table table-bordered table-hover table-condensed">
        <thead>
        <tr>
            <th style="text-align: center;width: 90px">卡号</th>
            <th style="text-align: center;width: 90px">时间</th>
            <th style="text-align: center;width: 90px">描述</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cutlog" items="${cutlogs}">
            <tr>
                <td style="text-align: center;line-height: 20px">${cutlog.cardId}</td>
                <td style="text-align: center;line-height: 20px"><fmt:formatDate value="${cutlog.cutDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                <td style="text-align: center;line-height: 20px">剪发一次</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<style type="text/css">
    th{
        text-align: center;
        vertical-align: middle;
    }
</style>

</body>
</html>
