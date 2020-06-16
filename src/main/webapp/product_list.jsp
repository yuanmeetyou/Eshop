<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="yuan.com.eshop.bean.Productlist" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>

<%--
  Created by IntelliJ IDEA.
  User: 3478569942
  Date: 2020/5/31/0031
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网上商城</title>
    <!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes"/>
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <!-- 引入Bootstrap核心样式文件 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">

    <!-- 引入jQuery核心js文件 -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <!-- 引入BootStrap核心js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        .form-control{
            font-size: 30px;
            height: 40px;

        }
        .form-group{
            margin-top: 15px;
        }
    </style>
</head>

<body>
<!-- 引入header.jsp -->
<jsp:include page="/header.jsp"></jsp:include>
<div class="row" style="width: 1210px; margin: 0 auto;">
    <c:forEach items="${prductlist }" var="product">
        <div class="col-md-2" style="height:280px">
        <a href="${pageContext.request.contextPath}/user/product?method=shopping&pid=${product.pid}">
            <img src="${pageContext.request.contextPath}/${product.pimage }" width="170" height="170" style="display: inline-block;">
        </a>
        <br><br>
            <p style="text-align: center;height: 25px" >
                <a href="${pageContext.request.contextPath}/user/product?method=shopping&pid=${product.pid}" style='color: green'>${product.pname }</a>
            </p>
        <p style="text-align: center">
            <font color="#FF0000" >￥：${product.shop_price }</font>
        </p>
    </div>
    </c:forEach>
 </div>
<%--<!--商品浏览记录-->
<div
        style="width: 1210px; margin: 0 auto; padding: 0 9px; border: 1px solid #ddd; border-top: 2px solid #999; height: 246px;">

    <h4 style="width: 50%; float: left; font: 14px/30px 微软雅黑">浏览记录</h4>
    <div style="width: 50%; float: right; text-align: right;">
        <a href="">more</a>
    </div>
    <div style="clear: both;"></div>

    <div style="overflow: hidden;">

        <ul style="list-style: none;">
            <li
                    style="width: 150px; height: 216px; float: left; margin: 0 8px 0 0; padding: 0 18px 15px; text-align: center;"><img
                    src="products/1/cs10001.jpg" width="130px" height="130px" /></li>
        </ul>

    </div>
</div>--%>


<!-- 引入footer.jsp -->
<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>
