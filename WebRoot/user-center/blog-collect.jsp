<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include-userCenter.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sort-collect-comment.css"/>
</head>
<body>
<%@ include file="../include/top.jsp"%>
<%@ include file="header.jsp"%>
    <div class="body">
    	<%@ include file="left.jsp"%>
        <div class="body_right">
        	<label>收藏管理</label>
            <table>
            	<thead>
                	<tr>
                		<td width="430">博客标题</td>
                        <td width="100">博主</td>
                        <td>管理</td>
                        <td>收藏时间</td>
                    </tr>
                </thead>
                <tbody>
                	<s:iterator value="collectColl">
                	<tr>
                    	<td><a href='${pageContext.request.contextPath}/showBlog?id=<s:property value="article.articleId"/>'><s:property value="article.articleTitle"/></a></td>
                        <td>
                        	<a href='${pageContext.request.contextPath}/listBlog?userId=<s:property value="article.user.userId"/>' title="<s:property value="article.user.userName"/>">
                        		<s:property value="article.user.userName"/>
                        	</a>
                        </td>
                        <td><a href='${pageContext.request.contextPath}/deleteCollect?id=<s:property value="collectId"/>'>删除</a></td>
                        <td><s:date name="collectTime" format="yyyy-MM-dd HH:MM"/></td>
                    </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
    
	<%@ include file="../include/footer.jsp"%>
</body>
</html>