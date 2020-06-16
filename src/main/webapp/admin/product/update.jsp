<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="yuan.com.eshop.service.admin.adminProjectService" %>
<%@ page import="yuan.com.eshop.bean.Productlist" %>
<%@ page import="yuan.com.eshop.bean.category" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 3478569942
  Date: 2020/6/9/0009
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    String pid = request.getParameter("pid");
    adminProjectService adminProjectService = new adminProjectService();
    Productlist productlist = adminProjectService.selectProductById(pid);
    request.setAttribute("product",productlist);
    List<category> findcategory = adminProjectService.findcategory();
    request.setAttribute("findcategory",findcategory);
%>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title">修改商品数据</h4>
</div>
<div class="modal-body">

    <form id="update" name="Form1"  >
        &nbsp;
        <table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">

            <tr>
                <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                    商品名称：
                </td>
                <td class="form-control" bgColor="#ffffff">
                    <input  type="text" name="pname" value="${product.pname}" id="userAction_save_do_logonName" class="bg"/>
                </td>
                <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                    是否热门：
                </td>
                <td class="ta_01" bgColor="#ffffff">
                    <select name="is_hot" id="is_hot" class="form-control">
                        <option value="0" ${product.is_hot==0 ? 'selected' : ''} >是</option>
                        <option value="1" ${product.is_hot==1 ? 'selected' : ''} >否</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                    市场价格：
                </td>
                <td class=" form-control" bgColor="#ffffff">
                    <input type="text" name="market_price" value="${product.market_price}" id="userAction" class="bg"/>
                </td>
                <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                    商城价格：
                </td>
                <td class="form-control" bgColor="#ffffff">
                    <input type="text" name="shop_price" value="${product.shop_price}" id="userAction_price" class="bg"/>
                </td>
            </tr>
            <tr>
                <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                    商品图片：
                </td>
                <td class="ta_01" bgColor="#ffffff" colspan="3">
                    <input type="file" name="upload" />
                </td>
            </tr>
            <tr>
                <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                    所属分类：
                </td>
                <td class="ta_01" bgColor="#ffffff" colspan="3">
                    <select name="cid" id="cid" class="form-control">
                        <option value="">--请选择--</option>
                        <c:forEach items="${findcategory}" var="findcategory">
                            <option value="${findcategory.cid}" ${product.cid==findcategory.cid ? 'selected' : ''}>${findcategory.cname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                    商品描述：
                </td>
                <td class="ta_01" bgColor="#ffffff" colspan="3">
                    <textarea name="pdesc"  rows="5" cols="45">${product.pdesc}</textarea>
                </td>
            </tr>
        </table>
    </form>

</div>
<div class="modal-footer">
    <button type="button" class="btn btn-primary" onclick="updateFormProduct('${product.pid}')">Save changes</button>
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
