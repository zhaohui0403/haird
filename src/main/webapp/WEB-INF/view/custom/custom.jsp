<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/6
  Time: 0:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <jsp:include page="customCommon.jsp"/>
    <script src="../static/js/layer/layer.js"></script>
    <script src="../static/js/common.js"></script>
    <script type="text/javascript">
        $(function () {

        })
        function deleteCustom(id) {
            match("deleteCustom?id=" + id);
        }
        function editCustom(id) {
            match("editCustom?id="+id);
        }
    </script>
</head>
<body style="background-image:url(/img/haird.jpg);background-repeat:no-repeat;background-size:cover">
    <div style="margin-left: 20px;margin-right: 20px">
        <table class="table table-bordered table-hover table-condensed">
            <thead>
            <tr>
                <th>员工姓名</th>
                <th>员工类型</th>
                <th>非会员提成</th>
                <th>会员提成</th>
                <th>基本工资</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="custom" items="${customList}">
                <tr>
                    <td style="text-align: center;line-height: 36px">${custom.customname}</td>
                    <td style="text-align: center;line-height: 36px">
                        <c:if test="${custom.customtype == 0}">店长</c:if>
                        <c:if test="${custom.customtype == 1}">发型师</c:if>
                        <c:if test="${custom.customtype == 2}">助理</c:if>
                    </td>
                    <td style="text-align: center;line-height: 36px">${custom.commission1}</td>
                    <td style="text-align: center;line-height: 36px">${custom.commission2}</td>
                    <td style="text-align: center;line-height: 36px">${custom.wage}</td>
                    <td style="text-align: center">
                        <button class="btn delete" type="button" onclick="editCustom(${custom.id})">修改</button>
                        <button class="btn delete" type="button" onclick="deleteCustom(${custom.id})">删除</button>
                    </td>
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
