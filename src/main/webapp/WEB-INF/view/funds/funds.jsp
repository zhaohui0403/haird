<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/7
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>财务管理</title>
    <jsp:include page="common.jsp"/>
    <style type="text/css">
        body {
            background-image: url(/img/haird.jpg);
            background-repeat: no-repeat;
            background-size: cover
        }

        #income {
            margin: 0;
            width: 48%;
            height: 82%;
            float: left
        }

        #line {
            margin: 0;
            width: 0;
            height: 82%;
            border: 1px #999999 solid;
            float: left
        }

        #expend {
            margin: 0;
            width: 48%;
            height: 82%;
            float: left;
        }
        .tableDiv{
            margin: 0;
            width: 49%;
            height: 82%;
            overflow: auto;
        }

        .AmoutDiv {
            margin-right: 10%;
            float: right;
            background-color: white;
        }

        .amout {
            width: 90px;
            height: 40px;
            text-align: center;
            line-height: 40px;
            border: 1px #797979 solid;
            float: right;
            font-size: 22px;
            font-weight: 500;
            color: red;
        }
        .tableDiv{
            width: 100%;
            height:90%;
        }
    </style>
</head>
<body>
<div>
    <div id="income">
        <div class="tableDiv">
            <table class="table table-bordered table-hover table-condensed">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>金额</th>
                    <th>描述</th>
                    <th>时间</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${inComeFunds}" var="inCome">
                    <tr>
                        <td>${inCome.id}</td>
                        <td>${inCome.amout}</td>
                        <td>${inCome.des}</td>
                        <td><fmt:formatDate value="${inCome.consdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="AmoutDiv">
            <div class="amout">${inComeAmout}</div>
            <div class="amout">总收入:</div>
        </div>
    </div>
    <div id="line">
    </div>
    <div id="expend">
        <div class="tableDiv">
            <table class="table table-bordered table-hover table-condensed">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>金额</th>
                    <th>描述</th>
                    <th>时间</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${expendFunds}" var="expend">
                    <tr>
                        <td>${expend.id}</td>
                        <td>${expend.amout}</td>
                        <td>${expend.des}</td>
                        <td><fmt:formatDate value="${expend.consdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="AmoutDiv">
            <div class="amout">${expendAmout}</div>
            <div class="amout">总支出:</div>
        </div>
    </div>
</div>
</body>
</html>
