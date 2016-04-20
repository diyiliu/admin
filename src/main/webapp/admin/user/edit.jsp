<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/bootstrap-table.css" rel="stylesheet">
    <link href="${ctx}/static/css/admin.css" rel="stylesheet">

    <!--Icons-->
    <script src="${ctx}/static/js/lumino.glyphs.js"></script>
</head>
<body>
<%@include file="../../sidebar.jsp"%>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="${ctx}/index.jsp"><i class="fa fa-home fa-fw"></i></a></li>
            <li class="active">用户管理</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">用户${op}</div>
                <div class="panel-body">
                    <form class="form-horizontal col-md-8" method="post">
                        <fieldset>
                            <div class="form-group <c:if test="${op eq '修改'}">hidden</c:if>">
                                <label class="col-md-3 control-label" for="name">编 号</label>
                                <div class="col-md-9">
                                    <input id="id" name="id" type="text" placeholder="Your ID" class="form-control" value="${user.id}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="name">姓  名</label>
                                <div class="col-md-9">
                                    <input id="name" name="name" type="text" placeholder="Your name" class="form-control" value="${user.name}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="age">年  龄</label>
                                <div class="col-md-9">
                                    <input id="age" name="age" type="text" placeholder="Your age" class="form-control" value="${user.age}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="email">邮  箱</label>
                                <div class="col-md-9">
                                    <input id="email" name="email" type="text" placeholder="Your email" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="message">详  情</label>
                                <div class="col-md-9">
                                    <textarea class="form-control" id="message" name="message" placeholder="Please enter your message here..." rows="5"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12 widget-right">
                                    <button type="submit" class="btn btn-default pull-right">提交</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div><!--/.row-->
</div><!--/.main-->

<script src="${ctx}/static/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script src="${ctx}/static/js/admin.js"></script>
<script>
    $(function () {
        $('ul.nav').find('#user').addClass('active');
    });
</script>
</body>
</html>
