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
    <title>剪发卡列表</title>
</head>
<body style="background-image:url(/img/haird.jpg);background-repeat:no-repeat;background-size:cover">
<div style="margin-left: 20px;margin-right: 20px;height:392px;overflow:auto">
    <table class="table table-bordered table-hover table-condensed">
        <thead>
        <tr>
            <th>卡号</th>
            <th>姓名</th>
            <th>电话</th>
            <th>描述</th>
            <th>剩余次数</th>
            <th>有效性</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hairdCard" items="${cardList.context}">
            <tr>
                <td style="text-align: center;line-height: 36px">${hairdCard.cardId}</td>
                <td style="text-align: center;line-height: 36px">${hairdCard.username}</td>
                <td style="text-align: center;line-height: 36px">${hairdCard.telephone}</td>
                <td style="text-align: center;line-height: 36px">${hairdCard.amout}元${hairdCard.times}次</td>
                <td style="text-align: center;line-height: 36px">${hairdCard.lastTimes}</td>
                <td style="text-align: center;line-height: 36px">
                    <c:if test="${hairdCard.status == 1}">
                        有效
                    </c:if>
                    <c:if test="${hairdCard.status == 0}">
                        无效
                    </c:if>
                </td>
                <td style="text-align: center">
                    <button class="btn delete" type="button" onclick="editCard(${hairdCard.id})">修改</button>
                    <button class="btn delete" type="button" onclick="hairdcut(${hairdCard.id})">剪发</button>
                    <button class="btn delete" type="button" onclick="cutlog(${hairdCard.id})">剪发记录</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div id="page" style="float: right;">
    <tag:page attributename="${cardList}"/>
</div>
<style type="text/css">
    th {
        text-align: center;
        vertical-align: middle;
    }

    div {
        margin: 0px;
        padding: 0px;
    }

</style>
<script type="text/javascript">
    $(function () {
    });

    function editCard(id) {
        match("getCard?id=" + id);
    }
    function hairdcut(id) {
        layui.layer.open({
            type: 2,
            title: '剪发',
            fixed: false, //不固定
            maxmin: true,
            area: ['800px', '540px'],
            content: 'cut?id=' + id,
        })
    }
    function cutlog(id) {
        layui.layer.open({
            type: 2,
            title: '消费',
            fixed: false, //不固定
            maxmin: true,
            area: ['700px', '500px'],
            content: 'cutLog?id=' + id,
        })
    }
</script>

</body>
</html>
