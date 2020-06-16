<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
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
        .goods-list-v2 {
            margin-bottom: 20px;
            height: auto;
            position: relative;
            z-index: 1;
            _zoom: 1;
        }
        .goods-list-v2 .gl-warp {
            width: 840px;
            height: auto;
            margin-right: -40px;
        }
        .gl-item{
            width: 220px;
            position: absolute;
            z-index: 1;
            left: 0;
            top: 0;
            background: #fff;
            border: 1px solid #fff;
            padding: 38px 9px 10px;
            transition: border-color .1s ease;
        }
    </style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<!--轮播图-->
<div class="container">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <a href=""><img src="${pageContext.request.contextPath}/img/4.jpg" alt="..." ></a>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <a href=""><img src="${pageContext.request.contextPath}/img/5.jpg" alt="..."></a>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <a href=""> <img src="${pageContext.request.contextPath}/img/12.jpg" alt="..."></a>
                <div class="carousel-caption">
                    ...
                </div>
            </div>
            <div class="item">
                <a href=""><img src="${pageContext.request.contextPath}/img/13.jpg" alt="..." > </a>
                <div class="carousel-caption">
                    ...
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

<!--热门商品-->
<div class="container" style="margin-top: 10px;">
    <!--上面文字内容-->
    <div class="row">
				<span  style="font-size: 30px;padding-left: 33px;">
					热门商品&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg" />
				</span>
    </div>
    <!--图片内容-->
    <div class="row" style="">
        <div class="col-md-2 col-sm-2 hidden-sm hidden-xs" style="height: 400px;">
            <img src="${pageContext.request.contextPath}/img/big01.jpg" height="100%"/>
        </div>
        <div class="col-md-10 col-sm-10" style="padding-left: 10px;">
            <div class="row">
                <div class="col-md-6 hidden-xs hidden-sm" style="height: 200px;width: 490px;">
                    <a href="${pageContext.request.contextPath}/user/product?method=shopping&pid=${hotpro.pid}"><img src="${pageContext.request.contextPath}/img/middle01.jpg" height="100%" width="100%"/></a>
                </div>
                <div>
                    <c:forEach items="${hotProduct }" var="hotPro">
                        <div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
                            <a href="${pageContext.request.contextPath}/user/product?method=shopping&pid=${hotPro.pid}">
                                <img src="${pageContext.request.contextPath }/${hotPro.pimage }" width="130" height="130" style="display: inline-block;">
                            </a>
                            <p style="height: 25px"><a href="product_info.html" style='color:#666'>${hotPro.pname }</a></p>
                            <p><font color="#E4393C" style="font-size:16px">&yen;${hotPro.shop_price }</font></p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<!--广告图片-->
<div class="container" style="margin-top: 10px;">
    <div class="row">
        <div class="hidden-md hidden-sm hidden-xs " style="padding-left: 14px;">
            <img src="${pageContext.request.contextPath}/img/ad.jpg" style="width: 98%;"/>
        </div>
    </div>
</div>

<!--最新商品-->
<div class="container" style="margin-top: 10px;">
    <!--上面文字内容-->
    <div class="row">
				<span id="" style="font-size: 30px;padding-left: 33px;">
					最新商品&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg" />
				</span>
    </div>
    <!--图片内容-->
    <div class="row">
        <div class="col-md-2 col-sm-2 hidden-sm hidden-xs" style="height: 400px;">
            <img src="${pageContext.request.contextPath}/img/big01.jpg" height="100%"/>
        </div>
        <div class="col-md-10 col-sm-10" style="padding-left: 10px;">
                <div class="col-md-6  img-responsive" style="height: 200px;width: 490px;">
                    <a href="#"><img src="${pageContext.request.contextPath}/img/middle01.jpg" height="100%" width="100%"/></a>
                </div>
            <c:forEach items="${newProduct}" var="newPro">
                <div class="col-md-2" style="text-align:center;height:200px;width:153px;padding:8px 0px;">
                    <a href="${pageContext.request.contextPath}/user/product?method=shopping&pid=${newPro.pid}">
                        <img src="${pageContext.request.contextPath }/${newPro.pimage }" width="130" height="130" style="display: inline-block;">
                    </a>
                    <p style="height: 25px"><a href="product_info.html" style='color:#666'>${newPro.pname }</a></p>
                    <p><font color="#E4393C" style="font-size:16px">&yen;${newPro.shop_price }</font></p>
                </div>

            </c:forEach>
        </div>
    </div>
</div>

<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>