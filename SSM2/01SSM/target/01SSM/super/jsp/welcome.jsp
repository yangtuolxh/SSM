<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/22
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="/super/css/public.css"/>
    <link rel="stylesheet" href="/super/css/style.css"/>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/zzsc.js"></script>
    <script  type="text/javascript">
        /*     window.onload=function(){
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
         }*/
    </script>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> Admin</span> , 欢迎你！</p>
        <a href="../login.html">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <div id="zzsc"></div>
    <div style="text-align:center;clear:both;margin-top:20px">
        <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
        <script src="/follow.js" type="text/javascript"></script>
    </div>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li ><a href="${pageContext.request.contextPath}/select">用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/billShow">账单管理</a></li>
                <li><a href="/StudentsServlet?action=score">成绩管理</a></li>
                <li><a href="${pageContext.request.contextPath}/super/jsp/userList1.jsp">密码修改</a></li>
                <li><a href="/super/login.html">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <img class="wColck" src="/super/img/clock.jpg" alt=""/>
        <div class="wFont">
            <h2>Admin</h2>
            <p>欢迎来到超市账单管理系统!</p>
        </div>
    </div>
</section>
<footer class="footer">
    版权归北大青鸟
</footer>
<script src="js/time.js"></script>
</body>
</html>
