<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="header">
     <p>
     	<a href="${pageContext.request.contextPath}/listBlog?userId=<s:property value="user.userId"/>">
     		<s:if test='%{user.nickName == null || user.nickName == ""}'>
     			<s:property value="user.userName"/>
     		</s:if>
     		<s:else>
     			<s:property value="user.nickName"/>
     		</s:else>
     	</a>
     </p>
</div>