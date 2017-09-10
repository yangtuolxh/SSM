<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/1
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery1.11.1.js"></script>
    <script type="text/javascript">


        function sel1(id) {
            var path="${pageContext.request.contextPath}/selectContent?id="+id;
            location.href=path;
        }

    </script>
</head>
<body>
<center>
<h1>常见问题检索</h1>
    <form method="post" action="${pageContext.request.contextPath}/selectAFaqs">
    请输入查询关键字<input type="text" name="cname"><input type="submit" value="查询" ></form><a href="${pageContext.request.contextPath}/selectClasses" >添加常见问题</a>
    <div id="div2">
        <h1 id="h11"></h1>
    </div>
<div id="div1">
    检索结果
    <table>
        <tr>
          <td>编号</td>
          <td>标题</td>
          <td>分类</td>
          <td>创建时间</td>

        </tr>
        <c:forEach var="item" items="${faqsList}">
        <tr>
            <td>${item.id}</td>
            <td><a href="javascript:sel1(${item.classes.id})">${item.title}</a></td>
            <td>${item.classes.cname}</td>
            <td>${item.createdate}</td>
        </tr>
        </c:forEach>
    </table>
</div>
</center>
</body>
</html>
