<%@ page import="com.google.gson.Gson" %>
<%@ page import="yuan.com.eshop.service.admin.adminProjectService" %>
<%@ page import="yuan.com.eshop.bean.category" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 3478569942
  Date: 2020/6/9/0009
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   adminProjectService adminProjectService = new adminProjectService();
   List<category> findcategory = adminProjectService.findcategory();
   new Gson().toJson(findcategory,out);
%>
