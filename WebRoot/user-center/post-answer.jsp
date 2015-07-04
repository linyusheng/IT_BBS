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
        	<label>我的问答</label>
            <div class="post_tab">
            	<ul>
                	<li><a href="${pageContext.request.contextPath}/myAsk">提问(<s:property value="postColl.size()"/>)</a></li>
                    <li class="on"><a href="${pageContext.request.contextPath}/myAnswer">回答(<s:property value="replyColl.size()"/>)</a></li>
                </ul>
            </div>
            <table>
            	<thead>
                	<tr>
                		<td>标题</td>
                        <td width="80">状态</td>
                        <td width="60">答案数</td>
                        <td width="75">提问时间</td>
                    </tr>
                </thead>
                <tbody>
                	<s:iterator value="replyColl">
                	<tr>
                    	<td><a href="${pageContext.request.contextPath}/showPost?id=<s:property value="post.postId"/>"><s:property value="post.postName"/></a></td>
                        <td>
                        	<s:if test="%{post.postStatus == null}">
                        		<img src="${pageContext.request.contextPath}/images/ask.gif" width="16" height="16" style="vertical-align:middle;"/> 待处理
                        	</s:if>
                        	<s:else>
                        		<img src="${pageContext.request.contextPath}/images/greenright.gif" width="16" height="16" style="vertical-align:middle;"/> 已解决
                        	</s:else>
                        	
                        	</td>
                        <td><s:property value="post.answerNum"/></td>
                        <td><s:date name="post.postTime" format="yyyy-MM-dd"/></td>
                    </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
    
	<%@ include file="../include/footer.jsp"%>
</body>
</html>