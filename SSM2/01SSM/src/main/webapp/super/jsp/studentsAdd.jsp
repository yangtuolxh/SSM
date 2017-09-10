<%@ page import="java.util.List" %>
<%@ page import="cn.exam.model.Clazz" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/8/9
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head lang="en">

    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="/super/css/public.css"/>
    <link rel="stylesheet" href="/super/css/style.css"/>
    <script  type="text/javascript">
        window.onload=function(){
//定时器每秒调用一次fnDate()
            setInterval(function(){
                fnDate();
            },1000);
        }
        //js 获取当前时间
        function fnDate(){
            var oDiv=document.getElementById("time");
            var date=new Date();
            var year=date.getFullYear();//当前年份
            var month=date.getMonth();//当前月份
            var data=date.getDate();//天
            var hours=date.getHours();//小时
            var minute=date.getMinutes();//分
            var second=date.getSeconds();//秒
            var time=year+"-"+fnW((month+1))+"-"+fnW(data)+" "+fnW(hours)+":"+fnW(minute)+":"+fnW(second);
            oDiv.innerHTML=time;
        }
        //补位 当某个字段不是两位数时补0
        function fnW(str){
            var num;
            str>=10?num=str:num="0"+str;
            return num;
        }
    </script>
</head>
<body>
<header class="publicHeader">
    <h1>超市账单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> Admin</span> , 欢迎你！</p>
        <a href="login.html">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time"></span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li ><a href="/ExamLoginServlet">班级管理</a></li>
                <li><a href="/StudentsServlet">学员管理</a></li>
                <li><a href="/StudentsServlet?action=score">成绩管理</a></li>
                <li><a href="password.html">密码修改</a></li>
                <li><a href="login.html">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>账单管理页面 >> 订单添加页面</span>
        </div>
        <div class="providerAdd">
            <form action="/StudentsServlet?action=addStudent" method="post">
                <div>
                <label for="studentName">学生姓名：</label>
                <input type="text" name="studentName" id="studentName" required>
                </div>
                <div>
                    <label for="sex">学生性别：</label>
                    <input type="text" name="sex" id="sex" required>
                </div>
                <div>
                    <label for="age">学生年龄：</label>
                    <input type="text" name="age" id="age" required>
                </div>
                <div>
                    <label for="clazzname">学生班级：</label>
                    <select name="clazzname" id="clazzname">
                        <%--<c:forEach var="item" items="clazzList">

                        <option value="${item.id}">
                           ${item.clazzname}
                        </option>
                        </c:forEach>--%>
                        <%List<Clazz> list= (List<Clazz>) request.getAttribute("clazzList");%>
                        <% for (Clazz item:list
                                ) {
                            %>
                            <option value="<%=item.getId()%>">
                               <%=item.getClazzname()%>
                            </option>
                       <% }%>
                    </select>
                </div>

                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="billList.html">返回</a>-->
                    <input type="submit" value="保存" />
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>

    </div>
</section>
<footer class="footer">
    版权归北大青鸟
</footer>
<script src="js/time.js"></script>
</body>
</html>

