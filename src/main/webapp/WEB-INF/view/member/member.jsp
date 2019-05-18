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
    <jsp:include page="common.jsp"/>
    <title>会员列表</title>
</head>
<body style="background-image:url(/img/haird.jpg);background-repeat:no-repeat;background-size:cover">
<div style="margin-left: 20px;margin-right: 20px;height:392px;overflow:auto">
    <table class="table table-bordered table-hover table-condensed">
        <thead>
        <tr>
            <th>会员卡号</th>
            <th>姓名</th>
            <th>电话</th>
            <th>性别</th>
            <th>类型</th>
            <th>推荐人</th>
            <th>注册时间</th>
            <th>余额</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="member" items="${memberList.context}">
            <tr>
                <td style="text-align: center;line-height: 36px">${member.id}</td>
                <td style="text-align: center;line-height: 36px">${member.username}</td>
                <td style="text-align: center;line-height: 36px">${member.telephone}</td>
                <td style="text-align: center;line-height: 36px">
                    <c:if test="${member.sex == 0}">男</c:if>
                    <c:if test="${member.sex == 1}">女</c:if>
                </td>
                <td style="text-align: center;line-height: 36px">
                    <c:if test="${member.customType == 1}">新顾客</c:if>
                    <c:if test="${member.customType == 0}">老顾客</c:if>
                </td>
                <td style="text-align: center;line-height: 36px">${member.referrer}</td>
                <td style="text-align: center;line-height: 36px"><fmt:formatDate value="${member.signtime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                <td style="text-align: center;line-height: 36px">${member.amout}</td>
                <td style="text-align: center">
                    <button class="btn delete" type="button" onclick="editMember(${member.id})">修改</button>
                    <button class="btn delete" type="button" onclick="recharge(${member.id})">充值</button>
                    <button class="btn delete" type="button" onclick="payLog(${member.id})">消费记录</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div id="page" style="float: right;">
    <tag:page attributename="${memberList}"/>
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
    function recharge(id) {
        layui.layer.open({
            type:2,
            title:'充值',
            fixed: false, //不固定
            maxmin: true,
            area: ['660px', '500px'],
            content: 'recharge?cardId=' + id ,
        })
    }
    function editMember(id) {
        match("editMember?id="+id);
    }
    function payLog(id) {
        layui.layer.open({
            type:2,
            title:'消费记录',
            fixed: false, //不固定
            maxmin: true,
            area: ['800px', '500px'],
            content: 'payLog?memberId=' + id ,
        })
    }
</script>

</body>
</html>
