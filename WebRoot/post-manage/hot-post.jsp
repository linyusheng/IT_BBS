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
        	<div class="select_ask">
            	<ul>
                	<li class="on">热门问题</li>
                    <li><a href="${pageContext.request.contextPath}/activePost">待解决问题</a></li>
                    <li><a href="${pageContext.request.contextPath}/solvedPost">已解决问题</a></li>
                </ul>
            </div>
            <s:form action="hotPost" method="post" id="pagingForm">
			<s:hidden id="currentpage" name="pageBean.currentPage"/>
	            <%@ include file="list-post.jsp"%>
	            <jsp:include flush="true" page="../include/selectbypage.jsp"></jsp:include>
            </s:form>
        </div>
        <%@ include file="right.jsp"%>
    </div>
    
    <%@ include file="../include/footer.jsp"%>
</body>
</html>