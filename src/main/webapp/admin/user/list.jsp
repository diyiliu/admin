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
<%@include file="../../sidebar.jsp" %>

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
                <div class="panel-heading">用户列表</div>
                <div class="panel-body">
                    <div class="alert alert-warning" style="display: none;">
                        <a href="#" class="close" onclick="parentNode.style.display='none'">&times;</a>
                        <strong>警告！</strong><span></span>
                    </div>
                    <div id="toolbar" class="btn-group">
                        <button id="btn_add" type="button" class="btn btn-default">
                            <span class="fa fa-plus fa-fw" aria-hidden="true"></span>新增
                        </button>
                        <button id="btn_edit" type="button" class="btn btn-default">
                            <span class="fa fa-pencil fa-fw" aria-hidden="true"></span>修改
                        </button>
                        <button id="btn_delete" type="button" class="btn btn-default">
                            <span class="fa fa-times fa-fw" aria-hidden="true"></span>删除
                        </button>
                    </div>
                    <form id="form">
                        <table id="userList"></table>
                        <input name="id" class="hidden">
                    </form>
                </div>
            </div>
        </div>
    </div><!--/.row-->
</div><!--/.main-->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title text-danger" id="myModalLabel">提 示</h4>
            </div>
            <div class="modal-body">
                <span></span>
            </div>
            <div class="modal-footer">
                <a class="btn btn-default" data-dismiss="modal">取 消</a>
                <a class="btn btn-primary" name="confirm">确 定</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script src="${ctx}/static/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script src="${ctx}/static/js/bootstrap-table.js"></script>
<script src="${ctx}/static/js/admin.js"></script>

<script>
    $(function () {
        $('ul.nav').find('#user').addClass('active');

        var $table = $('#userList').bootstrapTable({
            url: '${ctx}/user/list.htm',
            showRefresh: true,
            search: true,
            pagination: true,
            clickToSelect: true,
            toolbar: '#toolbar',
            sidePagination: 'server',
            columns: [
                {field: "state", title: "", titleTooltip: "全选", checkbox: true},
                {field: "id", title: "ID"},
                {field: "name", title: "姓名"},
                {field: "age", title: "年龄"}
            ]
        });

        $('#toolbar :button').on('click', function () {
            var btn_id = this.id;
            var selects = $table.bootstrapTable('getSelections');

            if (btn_id == 'btn_add') {

                location.href = '${ctx}/user/create.htm';
            }

            if (btn_id == 'btn_edit') {
                if (selects.length != 1) {
                    $('.alert').find('span').text('请选择一个选项。');
                    $('.alert').show();
                    return;
                }

                var item = selects[0];
                location.href = '${ctx}/user/update.htm?id=' + item['id'];
            }

            if (btn_id == 'btn_delete') {
                if (selects.length < 1) {
                    $('.alert').find('span').text('请至少选择一个选项。');
                    $('.alert').show();
                    return;
                }
                var ids = '';
                for (var i = 0; i < selects.length; i++){
                    var item = selects[i];
                    ids += item['id'] + ',';
                }

                $('#form').find('input[name=\'id\']').val(ids);
                $('#form').attr('action', '${ctx}/user/delete.htm')
                        .attr('method', 'POST');

                $('.alert').hide();
                $('#myModal').find('.modal-body span').text('删除选中列?');
                $('#myModal').find('.modal-footer a[name=\'confirm\']').attr('href', 'javascript:$(\'#form\').submit();');
                $('#myModal').modal('show');
            }
        });
    });
</script>
</body>
</html>
