<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--http://java.sun.com/jsp/jstl/core--%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="/super/css/public.css"/>
    <link rel="stylesheet" href="/super/css/style.css"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/super/js/jQuery1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/super/js/jquery.pagination.js"></script>
<script type="text/javascript">
    $(function(){

        /*批量删除*/
        //全选操作
        $("#all").click(function(){
            if(this.checked){
                $("[type='checkbox'].ace").prop("checked", true);
            }else{
                $("[type='checkbox'].ace").prop("checked", false);
            }
        });

        //获取选中的id
        $("#getValue").click(function(){
            var vals="";
            $("[type='checkbox'].ace").each(function(){
                if($(this).prop("checked")==true){
                    vals += $(this).val()+",";
                }
            });
            alert(vals);

            if(vals.length>0){
                $.ajax({
                    type:"POST",
                    async:false,//异步请求  默认为true,设置为false的话,suncess之后，才会继续执行  下面的js
                    //data:"name="+123,
                    data:{ "vars": vals },// 你的form表单ID
                    //请求控制器
                    url:"${pageContext.request.contextPath}/deleteUser",
                    traditional: true,
                    //返回值（用于判断）
                    success:function(date){
                        alert(date);
                    },
                    error:function(date){
                        alert(date);
                    }

                });
                location.reload();
            }else{
                alert("请至少选中一项！");
            }
        });
    });






    //分页
    // 当前第几页数据
    var currentPage = ${pageNum};
    // 总页数
    var totalPage = ${lastPage};

    function submitForm(actionUrl){
        var formElement = document.getElementById("stuForm");
        formElement.action = actionUrl;
        formElement.submit();
    }
    // 第一页
    function firstPage(){
        if(currentPage == 1){
            alert("已经是第一页数据");

            return false;
        }else{
            submitForm("/select?pn=1");
            return true;
        }
    }
    // 下一页
    function nextPage(){
        if(currentPage == totalPage){
            alert("已经是最后一页数据");
            return false;
        }else{
            submitForm("/select?pn=" + (currentPage+1));

            return true;
        }
    }
    // 上一页
    function previousPage(){
        if(currentPage == 1){
            alert("已经是第一页数据");
            return false;
        }else{
            submitForm("/select?pn=" + (currentPage-1));

            return true;
        }
    }
function  up(id) {
    var path="${pageContext.request.contextPath}/aUser?id="+id;
    location.href=path;

}
</script>
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
        <span id="time">2015年1月1日 11:11  星期一</span>
        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
    </section>
<!--主体内容-->
    <section class="publicMian ">
        <div class="left">
            <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
            <nav>
                <ul class="list">
                    <li><a href="billList.html">账单管理</a></li>
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
                <span>用户管理页面</span>
            </div>
            <form method="post" id="stuForm" action="/fenye">
            <div class="search">
                <span>用户名：</span>
                <input type="text" placeholder="请输入用户名" name="userName"/>
                <input type="submit" value="查询"/>
                <a href="#" id="getValue">删除用户</a>
                <a href="${pageContext.request.contextPath}/super/jsp/userAdd.jsp">添加用户</a>
            </div>
            <!--用户-->
            </form>
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">


                    <%--全选按钮--%>
                    <th width="10%">全选<span/><input type="checkbox"  id="all"></th>

                    <th width="10%">用户编码</th>
                    <th width="20%">用户名称</th>
                    <th width="10%">性别</th>
                    <th width="10%">年龄</th>
                    <th width="10%">电话</th>
                    <th width="10%">用户类型</th>
                    <th width="30%">操作</th>
                </tr>

               <c:forEach var="item" items="${page}">
                <tr>
                    <%--单选框--%>
                    <td><input type="checkbox" class="ace"value="${item.id}"></td>
                    <td>${item.usercode}</td>
                    <td>${item.username}</td>
                    <td>
                        <c:if test="${item.gender eq 1}">男</c:if>
                        <c:if test="${item.gender eq 2}">女</c:if>
                    </td>

                    <td>${item.gender}</td>
                    <td>${item.phone}</td>
                    <td>
                        <c:if test="${item.usertype eq 1}">系统管理员</c:if>
                        <c:if test="${item.usertype eq 2}">经理</c:if>
                        <c:if test="${item.usertype eq 3}">普通用户</c:if>
                    </td>
                    <td>
                        <a href="userView.html"><img src="img/read.png" alt="查看" title="查看"/></a>
                        <a href="javascript:up(${item.id})"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="#" class="removeUser"><img src="img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
               </c:forEach>
            </table>
            <div>
                当前第：${pageNum}页 总共：${lastPage}页，总共：${pageTotal}条记录
                <a href="#" onclick="firstPage()">首页</a>
                <a href="#" onclick="previousPage();">上一页</a>
                <a href="#" onclick="nextPage();">下一页</a>
                <a href="/select?pn=${lastPage}">尾页</a>
            </div>
        </div>

    </section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

    <footer class="footer">
        版权归北大青鸟
    </footer>

<script src="js/jquery.js"></script>
<script src="js/js.js"></script>
<script src="js/time.js"></script>

</body>
</html>