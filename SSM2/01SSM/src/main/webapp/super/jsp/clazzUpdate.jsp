<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/8/9
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
<!--头部-->
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
                <li id="active"><a href="/ExamLoginServlet">班级管理</a></li>
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
            <span>账单管理页面 >> 订单修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="/ExamLoginServlet?action=updateClazz" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <input type="hidden" name="hidden1" value="<%=request.getAttribute("id")%>"/>
                </div>
                <div class="">
                    <label for="clazzname">订单编码：</label>
                    <input type="text" name="clazzname" id="clazzname" placeholder="322"/>
                    <span>*</span>
                </div>

                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="billList.html">返回</a>-->
                    <input type="submit" value="保存"/>
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
