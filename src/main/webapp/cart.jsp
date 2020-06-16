<%--
  Created by IntelliJ IDEA.
  User: 3478569942
  Date: 2020/6/15/0015
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="yuan.com.eshop.bean.Productlist" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>轻松购物车</title>
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
<jsp:include page="header.jsp"></jsp:include>
<!-- 判断购物车中是否有商品 -->
    <div class="container">
        <div class="row">

            <div style="margin-top:10px;width:1168px;">
                <strong class="btn-danger" style="font-size:16px;margin:5px 0;">订单详情</strong>
                <div class="container btn-danger" style="margin-left: 10px;width: 1144px">
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <div class="row clearfix">
                                <div class="col-md-2 column">
                                    图片
                                </div>
                                <div class="col-md-2 column">
                                    商品
                                </div>
                                <div class="col-md-2 column">
                                    单价
                                </div>
                                <div class="col-md-2 column">
                                    数量
                                </div>
                                <div class="col-md-2 column">
                                    小计
                                </div>
                                <div class="col-md-2 column">
                                    操作
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    <c:forEach items="${cart.items}" var="entry">
                        <div class="container" style="margin-top: 10px;margin-left: -9px;height: 71px">
                            <div class="row clearfix">
                                <div class="col-md-12 column">
                                    <div class="row clearfix">
                                        <div class="col-md-2 column">
                                            <input type="hidden" name="id" value="22">
                                            <img src="${pageContext.request.contextPath }/${entry.value.productlist.pimage}" width="70" height="60">
                                        </div>
                                        <div class="col-md-2 column">
                                            <a target="_blank">${entry.value.productlist.pname}</a>
                                        </div>
                                        <div class="col-md-2 column">
                                            ￥${entry.value.productlist.shop_price}
                                        </div>
                                        <div class="col-md-2 column">
                                                ${entry.value.number }
                                        </div>
                                        <div class="col-md-2 column">
                                            <span class="subtotal">￥${entry.value.minTotal }</span>
                                        </div>
                                        <div class="col-md-2 column">
                                            <a href="javascript:;" onclick="delProFromCart('${entry.value.productlist.pid}')" class="delete">删除</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                        </div>

            </div>
        </div>

        <div style="margin-right:130px;">
            <div style="text-align:right;">
                <em style="color:#ff6600;">
                    登录后确认是否享有优惠&nbsp;&nbsp;
                </em> 赠送积分: <em style="color:#ff6600;">${cart.total }</em>&nbsp; 商品金额: <strong style="color:#ff6600;">￥${cart.total }元</strong>
            </div>
            <div style="text-align:right;margin-top:10px;margin-bottom:10px;">
                <a href="javascript:;" onclick="clearCart()" id="clear" class="clear">清空购物车</a>
                <a href="order_info.htm">
                    <input type="submit" width="100" value="提交订单" name="submit" border="0" style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
							height:35px;width:100px;color:white;">
                </a>
            </div>
        </div>

    </div>

<%--<c:if test="${empty cart.cartItems }">
    <div>
        <img alt="" src="${pageContext.request.contextPath }/images/cart-empty.png">
        <a href="${pageContext.request.contextPath }">返回首页</a>
    </div>
</c:if>--%>

<!-- 引入footer.jsp -->
<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>
