<%--
  Created by IntelliJ IDEA.
  User: 3478569942
  Date: 2020/6/2/0002
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        body
        {
            SCROLLBAR-ARROW-COLOR: #ffffff;  SCROLLBAR-BASE-COLOR: #dee3f7;
        }
    </style>
</head>

<frameset rows="140,*,43" frameborder=0 border="0" framespacing="0">
    <frame src="${pageContext.request.contextPath}/admin/top.jsp" name="topFrame" scrolling="NO" noresize>
    <frameset cols="159,*" frameborder="0" border="0" framespacing="0">
        <frame src="${pageContext.request.contextPath}/admin/left.jsp" name="leftFrame" noresize scrolling="YES">
        <frame src="${pageContext.request.contextPath}/admin/welcome.jsp" id="mainFrame" name="mainFrame">
    </frameset>
    <frame src="${pageContext.request.contextPath}/admin/bottom.jsp" name="bottomFrame" scrolling="NO"  noresize>
</frameset>
</html>