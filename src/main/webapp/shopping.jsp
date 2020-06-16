<%--
  Created by IntelliJ IDEA.
  User: 3478569942
  Date: 2020/6/7/0007
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="yuan.com.eshop.bean.Productlist" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
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
    <script>
        function addCart() {
            var number = $("#number").val();
            location.href="${pageContext.request.contextPath}/user/product?method=addProductToCart&pid=${shopping.pid}&number="+number ;
        }
    </script>
</head>
<body>
    <jsp:include page="/header.jsp"></jsp:include>

    <div class="container">
        <div class="row">
            <div
                    style="border: 1px solid #e4e4e4; width: 930px; margin-bottom: 10px; margin: 0 auto; padding: 10px; margin-bottom: 10px;">
                <a href="./index.htm">首页&nbsp;&nbsp;&gt;</a> <a href="./蔬菜分类.htm">蔬菜&nbsp;&nbsp;&gt;</a>
                <a>无公害蔬菜</a>
            </div>

            <div style="margin: 0 auto; width: 950px;">
                <div class="col-md-6">
                    <img style="opacity: 1; width: 270px; height: 310px" title=""
                         class="medium"
                         src="${pageContext.request.contextPath }/${shopping.pimage}">
                </div>

                <div class="col-md-6">
                    <div>
                        <strong style="font-size: 25px;margin-top: 15px">${shopping.pdesc}</strong>
                    </div>


                    <div style="margin: 10px 0 10px 0;">
                        亿家价: <strong style="color: #ef0101;">￥：${shopping.shop_price}</strong> &nbsp;&nbsp;参 考 价：
                        <del>￥${shopping.market_price}</del>
                    </div>

                    <div style="margin: 10px 0 10px 0;">
                        促销: <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)"
                               style="background-color: #f07373;">限时抢购</a>
                    </div>

                    <div
                            style="padding: 10px; border: 1px solid #e7dbb1; width: 330px; margin: 15px 0 10px 0;; background-color: #fffee6;">
                        <div style="margin: 5px 0 10px 0;">白色</div>

                        <div
                                style="border-bottom: 1px solid #faeac7; margin-top: 20px; padding-left: 10px;">
                            购买数量: <input id="number" name="quantity" value="1"
                                         maxlength="4" size="10" type="text">
                        </div>

                        <div style="margin: 20px 0 10px 0;; text-align: center;">
                            <button onclick="addCart()">
                                <input style="background: url('${pageContext.request.contextPath}/images/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0); height: 36px; width: 127px;" value="加入购物车" type="button">
                            </button>

                           &nbsp;收藏商品
                        </div>
                    </div>
                   <%-- <div>
                        <a href="${pageContext.request.contextPath}/productListByCid?cid=${cid }&currentPage=${currentPage}">返回列表页面</a>
                    </div>--%>
                </div>
            </div>
            <div class="clear"></div>
            <div style="width: 950px; margin: 0 auto;">

                <%--<div
                        style="background-color: #d3d3d3; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
                    <strong>  </strong>
                </div>--%>
                <div style="margin-top: 10px; width: 900px;">
                    <table class="table table-bordered">
                        <tbody>
                        <tr class="active">
                            <th colspan="2">基本参数</th>
                        </tr>
                        <tr>
                            <th width="10%">级别</th>
                            <td width="30%">标准</td>
                        </tr>
                        <tr>
                            <th width="10%">标重</th>
                            <td>500</td>
                        </tr>
                        <tr>
                            <th width="10%">浮动</th>
                            <td>200</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div style="background-color: #d3d3d3; width: 900px;">
                    <table class="table table-bordered">
                        <tbody>
                        <tr class="active">
                            <th><strong>商品评论</strong></th>
                        </tr>
                        <tr class="warning">
                            <th>暂无商品评论信息 <a>[发表商品评论]</a></th>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div style="background-color: #d3d3d3; width: 900px;">
                    <table class="table table-bordered">
                        <tbody>
                        <tr class="active">
                            <th><strong>商品咨询</strong></th>
                        </tr>
                        <tr class="warning">
                            <th>暂无商品咨询信息 <a>[发表商品咨询]</a></th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>


    <!-- 引入footer.jsp -->
    <jsp:include page="/footer.jsp"></jsp:include>

    </body>
</html>
