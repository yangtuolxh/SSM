<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/27
  Time: 11:21
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
<center>
<table>
    <tr>
        <td>商品序列</td>
        <td>商品名称</td>
        <td>商品库存</td>
    </tr>
    <c:forEach items="${products}" var="item">
    <tr>
        <td>${item.id}</td>
        <td>${item.productname}</td>
        <td>${item.quantity}</td>
    </tr>
    </c:forEach>
    <tr>
        <td colspan="3"><button onclick="skipAdd()"value="出库"></button></td>
    </tr>
</table>
</center>
<script type="text/javascript">
    function  skipAdd() {
        var path="${pageContext.request.contextPath}/skipAdd";
        location.href=path;
    }
</script>
</body>
</html>
