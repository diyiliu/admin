<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>表单</title>
</head>
<body>
<form action="${ctx}/test/form.htm" method="post">
    <table>
        <tr>
            <td>id</td>
            <td><input name="id"></td>
        </tr>
        <tr>
            <td>name</td>
            <td><input name="name"></td>
        </tr>
        <tr>
            <td>age</td>
            <td><input name="age"></td>
        </tr>
        <tr>
            <td>phone</td>
            <td><input name="phone"></td>
        </tr>
        <tr>
            <td>email</td>
            <td><input name="email"></td>
        </tr>
        <tr>
            <td>address</td>
            <td><input name="address"></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="a[0]" value="1"></td>
            <td><input type="checkbox" name="a[1]" value="1"></td>
            <td><input type="checkbox" name="a[2]" value="1"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="提交"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="button" onclick="javascript:toSubmit();" value="submit"></td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="${ctx}/static/js/jquery-2.1.4.js"></script>
<script type="text/javascript">

    function toSubmit() {

        $.ajax({
            url: "${ctx}/test/form.htm",
            type: "POST",
            data: {id: $("input[name='id']").val(), name: $("input[name='name']").val()},
            dataType: "json",
            success: function (result) {

                console.log(result);
            }
        });
    }

</script>
</body>
</html>
