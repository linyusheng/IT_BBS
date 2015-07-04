<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<link rel="stylesheet" type="text/css" href="css/include.css"/>
<link rel="stylesheet" type="text/css" href="css/register.css"/>
<script type="text/javascript" src="js/jquery-qtip/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery-qtip/jquery.qtip-1.0.0-rc3.min.js"></script>
<script type="text/javascript" src="js/register.js"></script>
</head>
<body>
    <div class="body">
	  	<div class="title">
            <div class="logo">
                <a href="index"><img src="images/logo.png" width="200" height="90" /></a>
            </div>
            <div class="label">欢迎注册</div>
      	</div>
      	<div class="border">
      		<div class="border_header"></div>
            <div class="form">
            	<ul>
                <s:form action="register" method="post" id="registerForm">
                	<li class="left">用户名</li>
                    <li class="right">
                    	<input type="text" name="user.userName" id="userName" size="35" placeholder="全站唯一" maxlength="26"/>
                    </li>
                        
                    <li class="left">密码</li>
                    <li class="right">
                    	<input type="password" name="user.password" id="password" size="35" maxlength="20" placeholder="6-20个字符"/>
                    </li>
                    
                    <li class="left">确认密码</li>
                    <li class="right">
                    	<input type="password" name="confirmPassword" id="confirmPassword" size="35" maxlength="20"/>
                    </li>
                    
                    <li class="left"></li>
                    <li class="right">
	                    <input type="checkbox" id="checkbox" checked="checked"/>
                        <label>我已经阅读并同意&nbsp;<a href="#">注册条款</a></label>
                        <div id="checkboxTip">请选择同意注册条款</div>
                    </li>
                    
                    <li class="left"></li>
                    <li class="right">
                    	<input type="submit" value="注 册" />
                  		已经注册，现在<a href="login">登录</a>
                  	</li>
                </s:form>
                </ul>
            </div>
      	</div>
	</div> 	
	<%@ include file="include/footer.jsp"%>
</body>
</html>