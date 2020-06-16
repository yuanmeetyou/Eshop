<%--
  Created by IntelliJ IDEA.
  User: 3478569942
  Date: 2020/5/20/0020
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <meta http-equiv='content-type' content='text/html;charset=utf-8'/>
    <script type='text/javascript' src='jquery-1.7.2.js'></script>
    <script type='text/javascript'>
        var code ; //在全局定义验证码

        function createCode(){
            code = "";
            var codeLength = 4;//验证码的长度
            var checkCode = document.getElementById("code");
            var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',
                'S','T','U','V','W','X','Y','Z');//随机数
            for(var i = 0; i < codeLength; i++) {//循环操作
                var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）
                code += random[index];//根据索引取得随机数加到code上
            }
            checkCode.value = code;//把code值赋给验证码
        }
        //校验验证码
        function validate(){

            var password=document.getElementById("password").value;
            var password1=document.getElementById("password1").value;
            var phone = document.getElementById("phone").value;

            if(password!=password1){
                alert("密码前后不同！");
                return false;
            }
            else if (password.length<8){
                alert("密码至少为8位！");
                return false;
            }
            if (phone=="" ){
                alert("手机号码不能为空");
                return false;
            }else if (phone.length!=11){
                alert("手机号码应为11位");
                return false;
            }
            else {
                return true;
            }
            var inputCode = document.getElementById("input").value.toUpperCase(); //取得输入的验证码并转化为大写
            if(inputCode.length <= 0) { //若输入的验证码长度为0
                alert("请输入验证码！"); //则弹出请输入验证码
                return false;
            }else if(inputCode != code ) { //若输入的验证码与产生的验证码不一致时
                alert("验证码输入错误！@_@"); //则弹出验证码输入错误
                createCode();//刷新验证码
                document.getElementById("input").value = "";//清空文本框
                return false;
            }else { //输入正确时
                return true;
            }
        }
    </script>
    <style type='text/css'>
        #code{
            font-family:Arial,宋体;
            font-style:italic;
            color:blue;
            size:12px;
            border:0;
            padding:2px 3px;
            letter-spacing:8px;
            font-weight:bolder;
        }
    </style>
</head>
<body onload='createCode()'>
<table border=0><tr><th width=200 height=30></th><th ><img src="img/logo.png" style="width: 50px;height: 50px"></th></tr></table>
<table border=0><tr><th width=700 height=400></th><th>
    <form action="${pageContext.request.contextPath}/user/product?method=register" method="post">
        <table border=0 height=400 >
            <tr><th height=65><font  size='4'>用 户 名</font></th><th><input type="text" style="height:40px" placeholder="请输入用户名" size=40 name="username" id="username" class="username"></th></tr>
            <tr><th height=65><font  size='4'>密    码<th><input type="password" style="height:40px" placeholder="密码长度为6~18字符" size=40 id="pass" name="pass" class="pass"></th></tr>
            <tr><th height=65><font  size='4'>确认密码<th><input type="password" style="height:40px" placeholder="请重新输入密码" size=40 id="upass" name="upass" class="upass"></th></tr>
            <tr><th height=65><font  size='4'>真实姓名</font></th><th><input type="text" style="height:40px" placeholder="请输入用真实姓名" size=40 name="realname" id="realname" class="realname"></th></tr>
            <tr><th height=65><font  size='4'>联系方式<th><input type="text" style="height:40px" placeholder="+86" size=40 name="phone" id="phone" class="phone"></th></tr>
            <tr><div><th><font  size='4'>验 证 码<th>
                <input type = "text" id = "input" style="height:40px;width:220px"/>
                <input type="button" id="code" onclick="createCode()" style="height:40px;width:80px" title='点击更换验证码' />
                <!--<input type = "button"  style="height:40px"  value = "验证" onclick = "validate()"/> -->
            </th>
            </div>  </tr>

            <tr><th colspan=2 height=65><input type="checkbox"><font size='2' color='red' required/><a href="law.jsp"><font color="red">我已阅读并同意相关条例</font></a></th></tr>
            <tr><th colspan=2 height=65><input type='submit' style="background-color:red;height:55px;width:160px;font-size:25px;color:white;border:none" value='注册'id='l' onclick = "return validate()" ></th></tr>

        </table>
    </form></th></tr></table>

</body>
</html>
