<%@ page import="java.util.List" %>
<%@ page import="cn.smbms.Model.SmbmsBill" %>
<%@ page import="cn.smbms.Model.SmbmsProvider" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/7/12
  Time: 16:13
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
                <li ><a href="/Smbms_BillServlet">账单管理</a></li>
                <li><a href="providerList.html">供应商管理</a></li>
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
            <form action="/Smbms_BillServlet?action=addBill" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="billId">订单编码：</label>
                    <input type="text" name="billId" id="billId" required/>
                    <span>*请输入订单编码</span>
                </div>
                <div>
                    <label for="billName">商品名称：</label>
                    <input type="text" name="billName" id="billName" required/>
                    <span >*请输入商品名称</span>
                </div>

                <div>
                    <label for="billNum">商品数量：</label>
                    <input type="text" name="billNum" id="billNum" required/>
                    <span>*请输入大于0的正自然数，小数点后保留2位</span>
                </div>
                <div>
                    <label for="money">总金额：</label>
                    <input type="text" name="money" id="money" required/>
                    <span>*请输入大于0的正自然数，小数点后保留2位</span>
                </div>
                <div>
                    <label >供应商：</label>

                    <select name="supplier" >
                        <option value="">--请选择相应的提供商--</option>
                        <%List<SmbmsProvider> allProvider= (List<SmbmsProvider>) request.getAttribute("allProvider");%>
                        <% for (SmbmsProvider item:allProvider
                                ) {

                        %>
                        <option value="<%=item.getProname()%>"><%=item.getProname()%></option>
                        <%
                            }
                        %>
                    </select>

                    <span>*请选择供应商</span>
                </div>
                <div>
                    <label >是否付款：</label>
                    <input type="radio" name="zhifu" value="0" checked />未付款
                    <input type="radio" name="zhifu" value="1"/>已付款
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
