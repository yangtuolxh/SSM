<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/1
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery1.11.1.js"></script>
<script type="text/javascript">
    function  fanhui() {
       location.href="${pageContext.request.contextPath}/selectFaqs";
    }
</script>
</head>
<body>
<table>
<tr>
    <td>分类</td>
    <td>${faqs.classes.cname}</td>
</tr>
    <tr>
        <td>时间</td>
        <td>${faqs.createdate}</td>
    </tr>
    <tr>
        <td>标题</td>
        <td>${faqs.title}</td>
    </tr>
    <tr>
        <td>内容</td>
        <td>${faqs.content}</td>
    </tr>
    <tr>
        <td colspan="2"><button value="返回" onclick="fanhui()"></button></td>
    </tr>
</table>
</body>
</html>
