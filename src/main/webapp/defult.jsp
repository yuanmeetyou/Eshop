<%--
  Created by IntelliJ IDEA.
  User: 3478569942
  Date: 2020/6/14/0014
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  response.sendRedirect(request.getContextPath()+"/user/product?method=index");
%>
</body>
</html>
