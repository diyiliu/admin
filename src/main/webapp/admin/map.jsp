<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>Admin - 首页</title>

    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/admin.css" rel="stylesheet">

    <!--Icons-->
    <script src="${ctx}/static/js/lumino.glyphs.js"></script>
</head>
<body>
<%@include file="../sidebar.jsp"%>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="${ctx}/index.jsp"><i class="fa fa-home fa-fw"></i></a></li>
            <li class="active">首页</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div id="container" tabindex="0" style="height: 100%"></div>
    </div><!--/.row-->
</div>
<!-- script -->
<script src="${ctx}/static/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script src="${ctx}/static/js/admin.js"></script>

<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=e6f07e683b599f2d9e4c7f79073d1c7b"></script>
<script type="text/javascript">
    var map = new AMap.Map('container',{
        resizeEnable: true,
        zoom: 10,
        center: [116.39,39.9]
    });
</script>
</body>
</html>
