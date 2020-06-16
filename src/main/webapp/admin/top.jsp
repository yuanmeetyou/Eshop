<%--
  Created by IntelliJ IDEA.
  User: 3478569942
  Date: 2020/6/2/0002
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv='content-type' content='text/html;charset=utf-8'/>
    <style type="text/css">
         #back{
             background-repeat: no-repeat;
             background-size: 100%;
         }
        #user{
            float: right;
            padding-right: 60px;
            padding-top: 15px;
        }
    </style>
    <link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css">
</head>
<body background="${pageContext.request.contextPath}/img/admin/top.jpg" id="back">
<div  id="user">
    <img src="${pageContext.request.contextPath}/img/admin/log.jpg" style="width: 50px;height: 50px"><font size="5px" style="padding-bottom: 10px"> 张三</font>
</div>
<%--<table width="100%" height="70%"  border="0" cellspacing="0" cellpadding="0">

    &lt;%&ndash;<tr >
        <td  >
         <img src="${pageContext.request.contextPath}/img/admin/top.jpg" width="100%">
        </td>
    </tr>&ndash;%&gt;
</table>--%>
</body>
</html>
<%--
<tr>
    <td height="30" valign="bottom" background="${pageContext.request.contextPath}/img/mis_01.jpg">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="85%" align="left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td width="15%">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="16"
                                background="${pageContext.request.contextPath}/img/images/mis_05b.jpg">
                                <img src="${pageContext.request.contextPath}/img/images/mis_05a.jpg"
                                        width="6" height="18">
                            </td>
                            <td width="155" valign="bottom"
                                background="${pageContext.request.contextPath}/img/images/mis_05b.jpg">
                                用户名：
                                <font color="blue">zhangsan</font>
                            </td>
                            <td width="10" align="right"
                                background="${pageContext.request.contextPath}/img/images/mis_05b.jpg">
                                <img src="${pageContext.request.contextPath}/img/images/mis_05c.jpg" width="6" height="18">
                            </td>
                        </tr>
                    </table>
                </td>
                <td align="right" width="5%">
                </td>
            </tr>
        </table>
    </td>
</tr>--%>
