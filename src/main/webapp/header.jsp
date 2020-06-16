<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 3478569942
  Date: 2020/5/31/0031
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<script type="text/javascript">
    function clikfn(obj) {
         $('#serarch').val($(obj).html());
        $('#kuang').css("display","none");
    }
    function overfn(obj) {
        $(obj).css("background","#f60")
    }
    function outfn(obj) {
        $(obj).css("background","#fff")
    }
   function usersearch(res) {
        //1、获取用户搜索内容
       var content=res.value;
       //2、根据用户的内容进行模糊查询
       var con="";
       $.post(
           '${pageContext.request.contextPath}/${pageContext.request.contextPath}/user/product?method=userSearch',
           {'content':content},
           //3、对响应回来的数据进行处理
           function (data) {

               if (data.length>0){
                   for (var i=0; i<data.length;i++){
                       con+="<div style='padding:4px;cursor:pointer' onclick='clikfn(this)' onmouseover='overfn(this)' onmouseout='outfn(this)'>"+data[i].pname+"</div>";
                   }
                   //显示在界面上
                   $('#kuang').html(con);
                   $('#kuang').css("display","block");
               }
           },
       'json',
       );


   }
   $(function () {
       var son="";
       $.post("${pageContext.request.contextPath}/user/product?method=categoryList"
           ,function (data) {
               for(var i=0;i<data.length;i++){
                   son+="<li><a href='${pageContext.request.contextPath}/user/product?method=productList&cid="+data[i].cid+"'>"+data[i].cname+"</a></li>";
               }
               $('#category').html(son);
           },'json');
   })
</script>
<!--logo部分-->
<div class="container" id="logo">
    <div class="row" >
        <div class="col-lg-3 col-md-6 col-sm-4">
            <img src="${pageContext.request.contextPath}/img/logo.png" style="width: 267px;height: 169px"/>
        </div>
        <div class="col-lg-5 col-md-6 hidden-xs col-sm-8">
            <%-- <img src="img/header.png" />--%>
            <form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/user/product?method=productSearch" method="post" role="search">
                <div class="form-group" style="float:left;margin-top: 53px;position: relative">
                    <input id="serarch" name="serarch" type="text" value="${serarch}" class="form-control" placeholder="Search" style="width: 360px;font-size: 12px" onkeyup="usersearch(this)">
                    <div id="kuang" style=" padding:5px; display: none; position:absolute;z-index:1000;width:360px;background:#FFFFFF;border: 1px solid #CCCCCC">
                    <a id="" href=""></a>
                    </div>
                </div>
                <button style="float:left;margin-top:51px;width:48px;background-color: #de452b" type="submit" class="btn btn-default " ><sapn class="glyphicon glyphicon-zoom-out" style="color:#f7f7f7;height: 25px;margin-top: 4px;padding-top: 2px" ></sapn></button>
            </form>

        </div>
        <div class="col-lg-4 col-md-12 col-sm-12" style="padding-top: 69px;">
            <c:if test="${empty user}">
            <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
            <a href="${pageContext.request.contextPath}/register.jsp">注册</a>
            </c:if>
            <c:if test="${!empty user}">
                    <font style="color: red">欢迎： ${ user.username } 登陆</font>
                    <a href="#">退出</a>
                    </c:if>
                    <a href="#"><span class=""></span>我的购物车</a>
        </div>
    </div>
</div>

<!--导航栏-->
<div class="container" style="margin-top: 10px;">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/user/product?method=index">首页</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="category">
                </ul>
            </div>
        </div>
    </nav>
</div>
