<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/bootstrap-table.css" rel="stylesheet">
    <link href="${ctx}/static/css/datepicker/datepicker.css" rel="stylesheet">
    <link href="${ctx}/static/css/summernote/summernote.css" rel="stylesheet">
    <link href="${ctx}/static/css/admin.css" rel="stylesheet">

    <!--Icons-->
    <script src="${ctx}/static/js/lumino.glyphs.js"></script>
</head>
<body>
<%@include file="../../sidebar.jsp"%>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="index.html"><i class="fa fa-home fa-fw"></i></a></li>
            <li class="active">发布管理</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">发布信息</div>
                <div class="panel-body">
                    <form class="form-horizontal col-md-10" id="form" action="" method="post">

                        <div class="form-group">
                            <label for="date">发布 日期</label>
                            <input class="form-control datepicker" id="date" name="article.releaseDate">
                        </div>

                        <div class="form-group">
                            <label for="title">标 题</label>
                            <input type="text" placeholder="Your title" class="form-control" id="title" name="article.title">
                        </div>

                        <div class="form-group">
                            <label for="summary">摘 要</label>
                            <textarea class="form-control" id="summary" name="article.summary"
                                      placeholder="Please enter your summary here..." rows="3"></textarea>
                        </div>

                        <div class="form-group hidden">
                            <textarea id="content" name="article.content"></textarea>
                        </div>

                        <div class="form-group">
                            <label for="summary">正 文</label>
                            <div id="summernote"></div>
                        </div>

                        <div>
                            <div class="col-md-12">
                                <button type="button" class="btn btn-default pull-right" onclick="save();">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div><!--/.row-->
</div><!--/.main-->

<script src="${ctx}/static/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script src="${ctx}/static/js/datepicker/bootstrap-datepicker.js"></script>
<script src="${ctx}/static/js/datepicker/bootstrap-datepicker.zh-CN.js"></script>
<script src="${ctx}/static/js/summernote/summernote.js"></script>
<script src="${ctx}/static/js/summernote/summernote-zh-CN.js"></script>
<script>
    $(function () {
        $('ul.nav').find('#release').addClass('active');

        $('.datepicker').datepicker({
            language: 'zh-CN',
            todayBtn: 'linked',
            format: 'yyyy-mm-dd'
        });

        $('#summernote').summernote({
            lang: 'zh-CN',
            height: 350,
            focus: true
        });
    });

    function save(){
        var content = $('#summernote').summernote('code');
        $('#content').val(content);
        $('#form').submit();
    }
</script>
</body>
</html>
