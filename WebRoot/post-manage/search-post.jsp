<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>论坛中心</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/postCenter.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/readmore_split.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/post-manage.js"></script>
</head>

<body>
	<%@ include file="../include/top.jsp"%>
    <%@ include file="header.jsp"%>
    <div class="body">
    	<div class="body_left">
        	<div class="search_label">
            	搜索到"<s:property value="postColl.size()"/>"个结果
            </div>
            <s:if test='%{postColl.size() == 0}'>
            	<div class="no_result">很遗憾，没有找到您想要的，换个关键词再试试？</div>
            </s:if>
            <s:form action="findPost" method="post" id="pagingForm">
			<s:hidden id="currentpage" name="pageBean.currentPage"/>
	            <%@ include file="list-post.jsp"%>
	            <s:if test="%{postColl.size() != 0}">
	            	<jsp:include flush="true" page="../include/selectbypage.jsp"></jsp:include>
	            </s:if>     
            </s:form>
        </div>
        <%@ include file="right.jsp"%>
    </div>
    
    <%@ include file="../include/footer.jsp"%>
</body>
</html>