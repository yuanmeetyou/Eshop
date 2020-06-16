<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 3478569942
  Date: 2020/6/2/0002
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <!-- 引入jQuery核心js文件 -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <!-- 引入BootStrap核心js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/Style1.css"
          rel="stylesheet" type="text/css" />
    <script language="javascript"
            src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript">
        function addProduct(){
            window.location.href = "${pageContext.request.contextPath}/admin/category";
        }
        function delProduct(pid){
            var isDel = confirm("您确认要删除吗？");
            if(isDel){
                //要删除
                location.href = "${pageContext.request.contextPath}/admin/delProduct?pid="+pid;
            }
        }
        $(function () {
            $("#is_hot option[value='${productlist.is_hot}']").prop("selected",true);
        })
        $(function () {
            $.get('${pageContext.request.contextPath}/admin/category/ProductType.jsp',function (res) {
                $.each(res,function (index,ele) {
                    $('#cid').append('<option value="'+ele.cid+'">'+ele.cname+'</option>')
                    $("#cid option[value='${productlist.cid}']").prop("selected",true);
                })
            },'json')
        })
    </script>

</head>
<body>
<br>
<form action="${pageContext.request.contextPath}/admin/products" method="post">
    <div  style="">
        <div class="panel panel-default">
            <div class="panel-body">
                    <div class="row col-md-offset-1">
                        <div class="col-md-12 ">
                            <div class="input-group " style="margin-left: -118px;padding-left: 0px;float: left;width: 20%">
                                <span class="input-group-addon" id="sizing-addon1" >商品名称</span>
                                <input type="text" class="form-control" id="ss"  value="${productlist.pname}" name="pname"   placeholder="请输入上名称" aria-describedby="sizing-addon1" style="width: 97%">
                            </div>
                            <div class="input-group" style="width: 20%;margin-left: 45px;float: left">
                                <span class="input-group-addon" id="sizing-addon2">热门</span>
                                <select class="form-control" id="is_hot" name="is_hot" style="width: 50%" >
                                    <option value="-1" >不限</option>
                                    <option value="0">热</option>
                                    <option value="1">否</option>
                                </select>
                            </div>
                            <div class="input-group " style="float: left;width: 33%;margin-left:-29px">
                                <span class="input-group-addon" id="sizing-addon3">商品类型</span>
                                <select class="form-control" name="cid" id="cid"  style="width: 38%">
                                    <option value="-1" >不限</option>
                                </select>
                            </div>
                            <div class="input-group " style="float:left;width: 30%" >
                                <button type="submit" class="btn btn-primary" style="width:100px">查询</button>
                                <button type="reset" class="btn btn-default" style="width:100px;margin-left:6.666667%">重置</button>
                            </div>
                        </div>
                    </div>

            </div>
        </div>
    </div>
</form>

        <table cellSpacing="1" cellPadding="0" width="100%" align="center"
           bgColor="#f5fafe" border="0" style="margin-top:0px">
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3"><strong>商品列表</strong>
            </TD>
        </tr>
        <tr>
            <td class="ta_01" align="right">
                <button type="button" id="add" name="add" value="添加"
                        class="button_add btn btn-primary btn-sm" onclick="addProduct()">
                    添加</button>

            </td>
        </tr>
        <tr>
            <td class="ta_01" align="center" bgColor="#f5fafe">
                <table cellspacing="0" cellpadding="1" rules="all"
                       bordercolor="gray" border="1" id="DataGrid1"
                       style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                    <tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3;text-align: center";>

                        <th align="center" width="5%">序号</th>
                        <th align="center" width="10%">商品名称</th>
                        <th align="center" width="10%">商品图片</th>
                        <th align="center" width="15%">商品信息</th>
                        <th align="center" width="10%">市场价格(￥)</th>
                        <th align="center" width="10%">商城价格（￥）</th>
                        <th align="center" width="10%">是否热门</th>
                        <th width="7%" align="center">编辑</th>
                        <th width="7%" align="center">删除</th>
                    </tr>

                    <c:forEach items="${allproduct}" var="pro"  varStatus="vs">

                        <tr onmouseover="this.style.backgroundColor = 'white'"
                            onmouseout="this.style.backgroundColor = '#F5FAFE';">
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="5%">${vs.count}</td>
                            <td style="CURSOR: hand; HEIGHT: 22px;font-size: 20px" align="center"
                                width="10%">${pro.pname }</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="10%">
                                <img width="80" height="80" src="${pageContext.request.contextPath }/${pro.pimage }">
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 30px;font-size: 17px" align="center"
                                width="20%">${pro.pdesc }</td>
                            <td style="CURSOR: hand; HEIGHT: 22px;color: red;font-size: 20px" align="center"
                                width="10%">${pro.market_price }</td>
                            <td style="CURSOR: hand; HEIGHT: 22px;color: red;font-size: 20px"  align="center";
                                width="10%">${pro.shop_price }</td>
                            <td style="CURSOR: hand; HEIGHT: 22px;color: red;font-size: 20px" align="center"
                                width="10%">${pro.is_hot ==1 ? '否' : '是' }
                            </td>
                            <td align="center" style="height: 22px" >
                                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" data-backdrop="static" onclick="update('${pro.pid}')">
                                <span style="color: coral;font-size: 20px" class="glyphicon glyphicon-pencil"></span>
                                </button>
                            </td>
                            <td align="center" style="height: 22px"  >
                                <button class="btn btn-primary btn-sm" onclick="delProduct('${pro.pid}')"><span style="color: red;font-size: 20px" class="glyphicon glyphicon-remove"></span></button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>


<link href="${pageContext.request.contextPath}/inspinia/font-awesome/css/font-awesome.min.css" rel="stylesheet"></link>
<link href="${pageContext.request.contextPath}/inspinia/css/plugins/sweetalert/sweetalert.css" rel="stylesheet"></link>
<script src="${pageContext.request.contextPath}/inspinia/js/inspinia.js"></script>
<script src="${pageContext.request.contextPath}/inspinia/js/plugins/sweetalert/sweetalert.min.js"></script>
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content" id="content">

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    function update(pid) {
        $.get('${pageContext.request.contextPath}/admin/product/update.jsp?pid='+pid,function (res) {
          $('#content').html(res);
        },'html')
    }
    //修改商品数据
    function updateFormProduct(pid) {
      var data = $('#update').serialize();
      $.post('${pageContext.request.contextPath}/admin/updateProduct?pid='+pid,data,function (res) {
          if (res.result==1){
              $('#myModal').modal('hide')
              $('#content').empty()

              swal({
                  title: "确定修改?",
                  type: "success",
                  showCancelButton: true,
                  confirmButtonText: "update!",
                  closeOnConfirm: false
              }, function () {
                  location.reload()
              });
          }
      },'json')
    }
</script>
</body>
</html>
