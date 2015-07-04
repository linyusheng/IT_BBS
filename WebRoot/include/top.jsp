<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="top">
    <ul>
    	<s:if test="#session.loginName != null">
    		<li style="font-weight: bold;color:#E28822;">欢迎${session.loginName}</li>
    		<li>|</li>
    		<li><a href="${pageContext.request.contextPath}/myBlog">我的博客</a></li>
    		<li>|</li>
    		<li><a href="${pageContext.request.contextPath}/personalInfo">个人主页</a></li>
    		<li>|</li>
    		<li><a href="${pageContext.request.contextPath}/logout">退出</a></li>
    	</s:if>
    	<s:else>
	        <li style="font-weight: bold;color:#E28822;">您还未登录!</li>
	        <li>[<a href="${pageContext.request.contextPath}/login">登录</a>]</li>
	        <li>[<a href="${pageContext.request.contextPath}/registerPage">注册</a>]</li>
        </s:else>
        <% 
			String url = request.getRequestURI();
			url = url.substring(url.lastIndexOf("/") + 1);
			if(url.equals("") || url.equals("index.jsp")){
			
			}else{
		%>
				<li style="float:right;"><a href='${pageContext.request.contextPath}/index'>返回首页</a></li>
		<%
			}
		%>
    </ul>
</div>