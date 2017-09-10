<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/27
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery1.11.1.js"></script>
</head>
<body>
<form id="form1">
    <center>
<table>
    <tr>
        <td><span>出库商品</span></td><td><select name="productname">
<c:forEach var="item" items="${products}">
    <option value="${item.id}">${item.productname}</option>
</c:forEach>
</select>
    </td>
    </tr>
    <tr><td><span>出库时间</span></td><td><input type="date" name="outdate"></td></tr>
    <tr><td><span>数量</span></td><td><input name="quantity"></td></tr>
    <tr><td> <span>经手人</span></td><td><input name="handler"></td></tr>
    <tr><td colspan="2"><input type="button" onclick="ajaxFrom()"></td></tr>
</table>
    </center>
</form>
<script type="text/javascript">
    function  ajaxFrom() {
        $.ajax({
            type:"POST",
            async:false,
            url:"${pageContext.request.contextPath}/addTakeout",
            data:$("#form1").serialize(),
            success:function (date) {
                alert(date)
            },
            error:function (date) {
                alert(date);
            }

        });
    }
</script>
</body>
</html>
