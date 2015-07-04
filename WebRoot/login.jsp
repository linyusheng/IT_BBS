<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel="stylesheet" type="text/css" href="css/include.css"/>
<link rel="stylesheet" type="text/css" href="css/login.css"/>
<script type="text/javascript" src="js/jquery-qtip/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery-qtip/jquery.qtip-1.0.0-rc3.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
    <div class="body">
	  	<div class="title">
            <div class="logo">
                <a href="index"><img src="images/logo.png" width="200" height="90" /></a>
            </div>
            <div class="label">欢迎登录</div>
      	</div>
      	<div class="border">
      		<div class="border_header"></div>
            <div class="form">
            	<ul>
                <s:form action="login" method="post" id="loginForm">
                	<li class="left">账号</li>
                    <li class="right"><input type="text" name="userName" size="35" placeholder="用户名" id="userName"/></li>

                    <li class="left">密码</li>
                    <li class="right"><input type="password" name="password" size="35" maxlength="20" id="password"/></li>
                    
                    <li class="left"></li>
                    <li class="right">
	                    <input type="submit" value="登 录" />
	                    <input type="button" value="注 册" onclick="location.href='registerPage'"/>
	                </li>
	                
                </s:form>
                </ul>
            </div>
      	</div>
	</div> 	
	<%@ include file="include/footer.jsp"%>
</body>
</html>