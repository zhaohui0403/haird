<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/8
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="/static/js/bill.js"></script>
    <jsp:include page="common.jsp"/>
    <title>消费记录</title>
</head>
<body style="background-image:url(/img/haird.jpg);background-repeat:no-repeat;background-size:cover">
<div style="margin-left: 20px;margin-right: 20px;height:392px;overflow:auto">
    <table class="table table-bordered table-hover table-condensed">
        <thead>
        <tr>
            <th>消费类型</th>
            <th>支付方式</th>
            <th>会员卡号</th>
            <th>消费金额(￥)</th>
            <th>发型师</th>
            <th>发型师提成(￥)</th>
            <th>助理</th>
            <th>助理提成(￥)</th>
            <th>消费时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="record" items="${page.context}">
            <tr>
                <td style="text-align: center;line-height: 36px">
                    <c:if test="${record.contype == 0}">洗吹造型</c:if>
                    <c:if test="${record.contype == 1}">洗剪吹造型</c:if>
                    <c:if test="${record.contype == 2}">烫发</c:if>
                    <c:if test="${record.contype == 3}">染发</c:if>
                    <c:if test="${record.contype == 4}">烫染</c:if>
                    <c:if test="${record.contype == 5}">外卖</c:if>
                </td>
                <td style="text-align: center;line-height: 36px">
                    <c:if test="${record.paytype == 0}">微信</c:if>
                    <c:if test="${record.paytype == 1}">现金</c:if>
                    <c:if test="${record.paytype == 2}">支付宝</c:if>
                    <c:if test="${record.paytype == 3}">会员卡</c:if>
                </td>
                <td style="text-align: center;line-height: 36px"><c:if test="${!empty record.memberId}">${record.memberId}</c:if></td>
                <td style="text-align: center;line-height: 36px">${record.amout}</td>
                <td style="text-align: center;line-height: 36px">${record.hairstye}</td>
                <td style="text-align: center;line-height: 36px">${record.haircommi}</td>
                <td style="text-align: center;line-height: 36px">${record.assistant}</td>
                <td style="text-align: center;line-height: 36px">${record.assicommi}</td>
                <td style="text-align: center;line-height: 36px"><fmt:formatDate value="${record.contime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                <td style="text-align: center">
                    <button class="btn delete" type="button" onclick="del(${record.id})">删除</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div id="page" style="float: right;">
    <tag:page attributename="${page}"/>
</div>
<style type="text/css">
    th{
        text-align: center;
        vertical-align: middle;
    }
</style>
<script type="text/javascript">
    $(function () {
    })
    function del(id) {
        match("delRecord?id="+id);
    }
</script>

</body>
</html>
