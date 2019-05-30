<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/5
  Time: 8:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="head.jsp"/>
</head>
<body>
<div class="container" style="margin: -10px 0px 0px -20px;width: 100%">
    <div class="left" id="left">
        <jsp:include page="left.jsp"/>
    </div>
    <div style="height: 100%;float: left;border: 1px solid #999999"></div>
    <div class="right" id="right">
        <iframe name="fname" id="fname" src="/right" class="fname" allowtransparency="true"></iframe>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        var height = window.outerHeight;
        var width = window.outerWidth;
        $('.container').height(height - 130);
        $('.container').width(width - 18);
    })
</script>
<style type="text/css">
    #left {
        height: 100%;
        float: left;
        margin: 0px;
    }

    #right {
        width:85%;
        height: 100%;
        float: left;
    }
    .fname{
        margin: 0px;
        width:100%;
        height:100%;
    }
</style>
</body>
</html>
