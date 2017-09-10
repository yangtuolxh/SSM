<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/22
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>系统登录 - 超市账单管理系统</title>
    <link rel="stylesheet" href="/super/css/style.css"/>
</head>
<body class="login_bg">
<section class="loginBox">
    <header class="loginHeader">
        <h1>超市账单管理系统</h1>
    </header>
    <section class="loginCont">
        <form class="loginForm" action="${pageContext.request.contextPath}/first" method="post">
            <div class="inputbox">
                <label for="user">用户名：</label>
                <input id="user" type="text" name="username" placeholder="请输入用户名" required/>
            </div>
            <div class="inputbox">
                <label for="mima">密码：</label>
                <input id="mima" type="password" name="userpassword" placeholder="请输入密码" required/>
            </div>
            <div class="subBtn">
                <input type="submit" value="登录" />
                <input type="reset" value="重置"/>
            </div>

        </form>
    </section>
</section>

</body>
</html>
