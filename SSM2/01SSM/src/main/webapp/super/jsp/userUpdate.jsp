<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/23
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/super/js/jQuery1.11.1.js"></script>
    <script  type="text/javascript">

        //ajax添加
        function ajaxForm(){
            //alert($('#form1').serialize());//a=11111a&b=2+name+%3D+b&c=3+name+%3D+c&d=4+name+%3D+d&e=5&f=%E6%88%91%E6%98%AFcheckbox
            //document.write($('#form1').serialize());
            $.ajax({
                type:"POST",
                async:false,//异步请求  默认为true,设置为false的话,suncess之后，才会继续执行  下面的js
                //data:"name="+123,
                data:$('#form2').serialize(),// 你的form表单ID
                url:"${pageContext.request.contextPath}/updateUser",
                success:function(date){
                    alert(date);
                },
                error:function(date){
                    alert(date);
                }

            });
            alert(123);
            $("input[type='text']").val("");
            $("input[type='password']").val("");
            $("input[type='date']").val("");
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
                <li ><a href="${pageContext.request.contextPath}/select">用户管理</a></li>
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
            <form id="form2">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <input type="hidden" name="id" value="${smbmsUser.id}">
                <div class="">
                    <label for="usercode">用户编码：</label>
                    <input type="text" name="usercode" id="usercode"onkeyup="value=value.replace(/[^\d]/g,'')" value="${smbmsUser.usercode}" required/>
                    <span>*请输入订单编码</span>
                </div>
                <div>
                    <label for="username">用户名称：</label>
                    <input type="text" name="username" id="username" value="${smbmsUser.username}" required/>
                    <span >*请输入商品名称</span>
                </div>

                <div>
                    <label for="userpassword">用户密码：</label>
                    <input type="password" name="userpassword" id="userpassword"value="${smbmsUser.userpassword}" required/>
                    <span>*请输入大于0的正自然数，小数点后保留2位</span>
                </div>
                <div>


                    性别<input type="radio" name="gender" value="1" <c:if test="${smbmsUser.gender==1}"> checked="checked"</c:if>>男

                    <input type="radio" name="gender" value="2" <c:if test="${smbmsUser.gender==2}"> checked="checked"</c:if>>女<br>


                    <span>*请输入大于0的正自然数，小数点后保留2位</span>
                </div>
                <div>
                    <label for="birthday">出生日期：</label>
                    <input type="date" name="birthday" id="birthday" value="${smbmsUser.birthday}" required/>
                    <span>*请输入大于0的正自然数，小数点后保留2位</span>
                </div>
                <div>
                    <label for="phone">电话：</label>
                    <input type="text" name="phone" id="phone" onkeyup="value=value.replace(/[^\d]/g,'')"  value="${smbmsUser.phone}" required/>
                    <span>*请输入大于0的正自然数，小数点后保留2位</span>
                </div>
                <div>
                    <label for="address">地址：</label>
                    <input type="text" name="address" id="address" value="${smbmsUser.address}" required/>
                    <span >*请输入商品名称</span>
                </div>
                <div>

                            <input type="radio" name="usertype" value="1" <c:if test="${smbmsUser.usertype==1}"> checked="checked"</c:if>>管理员


                            <input type="radio" name="usertype" value="2"<c:if test="${smbmsUser.usertype==2}"> checked="checked"</c:if>>经理


                            <input type="radio" name="usertype" value="3"<c:if test="${smbmsUser.usertype==3}"> checked="checked"</c:if>>员工





                </div>


                <div class="providerAddBtn">
                   <%--点击ajaxFrom（）方法--%>
                    <input type="button" value="保存" onclick="ajaxForm()" />
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

