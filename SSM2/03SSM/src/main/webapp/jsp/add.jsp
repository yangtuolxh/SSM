<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/1
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <form action="${pageContext.request.contextPath}/add" method="post">
    <table>
        <tr>
            <td>分类</td>
           <td><select name="classid">
               <c:forEach var="item" items="${classesList}">
               <option value="${item.id}">${item.cname}</option>
               </c:forEach>
           </select> </td>
        </tr>
        <tr>
            <td>标题</td>
            <td><input type="text" name="title"></td>
        </tr>
        <tr>
            <td>内容</td>
            <td><input type="text" name="content"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit"></td>
        </tr>
    </table>
    </form>
</center>
</body>
</html>
