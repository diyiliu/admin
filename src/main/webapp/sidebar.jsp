<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
        <li id="user"><a href="${ctx}/admin/user/list.jsp"><i class="fa fa-user fa-fw"></i> 用户管理</a></li>
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
</body>
</html>
