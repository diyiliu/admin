<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - 首页</title>

    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/bootstrap-table.css" rel="stylesheet">
    <link href="${ctx}/static/css/admin.css" rel="stylesheet">

    <!--Icons-->
    <script src="${ctx}/static/js/lumino.glyphs.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>I USE LAW</span>Admin</a>
            <ul class="user-menu">
                <li class="dropdown pull-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <svg class="glyph stroked male-user">
                            <use xlink:href="#stroked-male-user"></use>
                        </svg>
                        User <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">
                            <svg class="glyph stroked male-user">
                                <use xlink:href="#stroked-male-user"></use>
                            </svg>
                            Profile</a></li>
                        <li><a href="#">
                            <svg class="glyph stroked gear">
                                <use xlink:href="#stroked-gear"></use>
                            </svg>
                            Settings</a></li>
                        <li><a href="#">
                            <svg class="glyph stroked cancel">
                                <use xlink:href="#stroked-cancel"></use>
                            </svg>
                            Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>

    </div><!-- /.container-fluid -->
</nav>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <form role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
        </div>
    </form>
    <ul class="nav menu">
        <li class="active"><a href="user.html"><i class="fa fa-user fa-fw"></i> 用户管理</a></li>
        <li><a href="widgets.html"><i class="fa fa-cloud-upload fa-fw"></i> 发布管理</a></li>
        <li><a href="widgets.html"><i class="fa fa-file fa-fw"></i> 案例管理</a></li>
        <li><a href="widgets.html"><i class="fa fa-sitemap fa-fw"></i> 组织管理</a></li>
        <li><a href="widgets.html"><i class="fa fa-key fa-fw"></i> 权限列表</a></li>
        <li class="parent ">
            <a data-toggle="collapse" href="#sub-item-1">
                <i class="fa fa-cogs fa-fw"></i> 系统配置
            </a>
            <ul class="children collapse" id="sub-item-1">
                <li>
                    <a class="" href="#">
                        Sub Item 1
                    </a>
                </li>
                <li>
                    <a class="" href="#">
                        Sub Item 2
                    </a>
                </li>
                <li>
                    <a class="" href="#">
                        Sub Item 3
                    </a>
                </li>
            </ul>
        </li>
        <li><a href="widgets.html"><i class="fa fa-tags fa-fw"></i> 日志查看</a></li>
        <li role="presentation" class="divider"></li>
        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Login Page</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="index.html"><i class="fa fa-home fa-fw"></i></a></li>
            <li class="active">用户管理</li>
        </ol>
    </div><!--/.row-->

    <!--
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">欢迎，你好！</h1>
        </div>
    </div>
    /.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">用户信息</div>
                <div class="panel-body">
                    <form class="form-horizontal col-md-8" action="" method="post">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="name">姓 名</label>
                                <div class="col-md-9">
                                    <input id="name" name="name" type="text" placeholder="Your name"
                                           class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="age">年 龄</label>
                                <div class="col-md-9">
                                    <input id="age" name="age" type="text" placeholder="Your age" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="email">邮 箱</label>
                                <div class="col-md-9">
                                    <input id="email" name="email" type="text" placeholder="Your email"
                                           class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="message">详 情</label>
                                <div class="col-md-9">
                                    <textarea class="form-control" id="message" name="message"
                                              placeholder="Please enter your message here..." rows="5"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12 widget-right">
                                    <button type="submit" class="btn btn-default btn-md pull-right">提交</button>
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

</body>
</html>
