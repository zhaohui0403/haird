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
    <title>消费日志</title>
    <link href="/static/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="/static/css/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <script src="/static/js/layer/layer.js"></script>
</head>
<body>
<div style="margin-left: 20px;margin-right: 20px;">
    <table class="table table-bordered table-hover table-condensed">
        <thead>
        <tr>
            <th style="text-align: center;width: 90px">会员卡号</th>
            <th style="text-align: center;width: 90px">金额</th>
            <th style="text-align: center;width: 90px">支付方式</th>
            <th style="text-align: center;width: 90px">处理人</th>
            <th style="text-align: center;width: 90px">时间</th>
            <th style="text-align: center;width: 90px">描述</th>
            <th style="text-align: center;width: 90px">余额</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="recharge" items="${payLogs}">
            <tr>
                <td style="text-align: center;line-height: 20px">${recharge.memberid}</td>
                <td style="text-align: center;line-height: 20px">${recharge.amout}</td>
                <td style="text-align: center;line-height: 20px">
                    <c:if test="${recharge.paytype == 0}">微信</c:if>
                    <c:if test="${recharge.paytype == 1}">现金</c:if>
                    <c:if test="${recharge.paytype == 2}">支付宝</c:if>
                    <c:if test="${recharge.paytype == -1}">消费</c:if>
                </td>
                <td style="text-align: center;line-height: 20px">${recharge.handlerman}</td>
                <td style="text-align: center;line-height: 20px"><fmt:formatDate value="${recharge.paytime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                <td style="text-align: center;line-height: 20px">${recharge.description}</td>
                <td style="text-align: center;line-height: 20px">${recharge.balance}</td>
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
