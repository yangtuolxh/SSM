<%@ page import="java.util.List" %>

<%@ page import="cn.happy.model.SmbmsUser" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/7/12
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/super/js/bootstrap/css/bootstrap.min.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/super/js/jQuery1.11.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/super/js/jquery.pagination.js"></script>

    <script type="text/javascript">
        jQuery.noConflict();
        jQuery(function($){
            //加载数据
            load(0);

            function  load(index) {
                $.ajax({
                    url:"${pageContext.request.contextPath}/getUserInfo",
                    type:"post",
                    data:{"pageIndex":index},
                    success:function (data) {

                        //模拟ajax去后端读取页数，获取数据并渲染列表的过程
                        $('#list-content').html('');
                        $.each(data.list,function (i,dom) {
                            alert('123'+dom.productname);
                            $('#list-content').append('<tr><td>' + dom.billcode + '</td><td>' + dom.productname + '</td></tr>');
                        });
                        //渲染分页
                        $('#pagination').pagination(data.totalRecords, {
                            current_page : index, //当前页索引
                            items_per_page : data.pageSize, //每页记录数
                            num_display_entries :10, //显示页码块数量
                            callback :load,
                            load_first_page : true,
                            prev_text : 'Previous',
                            next_text : 'Next'
                        });
                    }
                });
            }
        });
        function up(id) {
            var path="/ExamLoginServlet?action=update&id="+id;
            location.href=path;
        }
        function del(id) {
            var flag=confirm("确认删除吗？")
            if(flag){
            var path="/ExamLoginServlet?action=delete&id="+id;
            location.href=path;
            }
        }

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
            <span>账单管理页面</span>
        </div>
        <div class="search">
            <span>商品名称：</span>
            <input type="text" placeholder="请输入商品的名称"/>

            <span>供应商：</span>
            <select name="tigong" >
                <option value="">--请选择--</option>
                <option value="">北京市粮油总公司</option>
                <option value="">邯郸市五得利面粉厂</option>
            </select>

            <span>是否付款：</span>
            <select name="fukuan">
                <option value="">--请选择--</option>
                <option value="">已付款</option>
                <option value="">未付款</option>
            </select>

            <input type="button" value="查询"/>
            <a href="/ExamLoginServlet?action=add">添加订单</a>
        </div>
        <!--账单表格 样式和供应商公用-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">用户编码</th>
                <th width="20%">用户名称</th>
                <th width="10%">出生日期</th>

            </tr>
            <tbody id="list-content"></tbody>
            <tr>

            </tr>

        </table>
        <div class="pagination" id="pagination" style="margin:40px 40px 540px 440px"></div>

    </div>

</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<footer class="footer">
    版权归北大青鸟
</footer>

<script src="js/jquery.js">
$(function () {

});
</script>
<script src="js/js.js"></script>
<script src="js/time.js"></script>

</body>
</html>
