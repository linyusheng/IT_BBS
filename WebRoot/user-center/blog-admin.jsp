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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script>
$(function(){
	$('tbody tr').hover(
		function(){
			var index = $('tbody tr').index(this);
			$('tbody tr:eq('+index+') td').css('background','#EFFAFF');
		},
		function(){
			var index = $('tbody tr').index(this);
			$('tbody tr:eq('+index+') td').css('background','#FFF');
		}
	);
	$('form').submit(function(){
		var keyword = $('input[type="text"]').val();
		if(keyword == ""){
			alert("请输入关键字！");
			return false;
		}
		return true;
	});
	
})
</script>
</head>
<body>
<%@ include file="../include/top.jsp"%>
<%@ include file="header.jsp"%>
    <div class="body">
    	<%@ include file="left.jsp"%>
        <div class="body_right">
        	<s:if test="%{searchaArticleColl != null}">
        		<label>搜索结果列表</label>
        	</s:if>
        	<s:else>
        		<s:if test="%{sortName != null}">
        			<label><s:property value="sortName"/>分类文章列表</label>
        		</s:if>
        		<s:else>
        			<label>最新博客文章列表</label>
        		</s:else>
        	</s:else>
            <div class="sort">
            	<p>查找博客 : </p>
                <form action="searchBlog" method="post">
                	<input type="text" name="titleKey" placeholder="标题关键字" size="30" style="height:22px;"/>
                    <input type="submit" value="提交" />
                </form>
            </div>
            <table>
            	<thead>
                	<tr>
                		<td width="380">标题</td>
                        <td width="75">发表时间</td>
                        <td>分类</td>
                        <td>浏览</td>
                        <td>回复</td>
                        <td width="60">管理</td>
                    </tr>
                </thead>
                <tbody>
                	<!-- 搜索结果 -->
                	<s:if test="%{searchaArticleColl != null}">
                		<s:iterator value="searchaArticleColl">
	                	<tr>
	                    	<td><a href="${pageContext.request.contextPath}/readBlog?articleId=<s:property value="articleId"/>"><s:property value="articleTitle"/></a></td>
	                        <td><s:date name="writeTime" format="yyyy-MM-dd"/></td>
	                        <td><s:property value="articleSort"/></td>
	                        <td><s:property value="articleReadNum"/></td>
	                        <td><s:property value="articleCommentNum"/></td>
	                        <td>
	                        	<a href='${pageContext.request.contextPath}/editBlog?id=<s:property value="articleId"/>'>编辑</a>
	                        	<a href='${pageContext.request.contextPath}/deleteBlog?id=<s:property value="articleId"/>'>删除</a>
	                        </td>
	                    </tr>
	                    </s:iterator>
                	</s:if>
                	<!-- 最新列表 -->
                	<s:else>
                		<s:iterator value="articleColl">
	                	<tr>
	                    	<td><a href="${pageContext.request.contextPath}/readBlog?articleId=<s:property value="articleId"/>"><s:property value="articleTitle"/></a></td>
	                        <td><s:date name="writeTime" format="yyyy-MM-dd"/></td>
	                        <td><s:property value="articleSort"/></td>
	                        <td><s:property value="articleReadNum"/></td>
	                        <td><s:property value="articleCommentNum"/></td>
	                        <td>
	                        	<a href='${pageContext.request.contextPath}/editBlog?id=<s:property value="articleId"/>'>编辑</a>
	                        	<a href='${pageContext.request.contextPath}/deleteBlog?id=<s:property value="articleId"/>'>删除</a>
	                        </td>
	                    </tr>
						</s:iterator>
                	</s:else>
                </tbody>
            </table>
        </div>
    </div>
    
	<%@ include file="../include/footer.jsp"%>
</body>
</html>