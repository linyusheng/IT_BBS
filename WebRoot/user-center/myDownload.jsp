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
</head>
<body>
<%@ include file="../include/top.jsp"%>
<%@ include file="header.jsp"%>
    <div class="body">
    	<%@ include file="left.jsp"%>
        <div class="body_right">
        	<div class="topic">
            	<h3>我的下载记录</h3>
                <a href="${pageContext.request.contextPath}/uploadResources">我要上传</a >
            </div>
        	
            <table style="margin-bottom: 15px;">
            	<thead>
                	<tr>
                		<td>序号</td>
                        <td width="450">资料描述</td>
                        <td>资料类型</td>
                        <td>操作</td>
                        <td>下载时间</td>
                    </tr>
                </thead>
                <tbody>
                	<s:iterator value="downloadColl" status="No">
                	<tr>
                    	<td><s:property value="#No.index+1"/></td>
                        <td><s:property value="resource.resourceName"/></td>
                        <td><s:property value="resource.resourceType"/></td>
                        <td><a href="${pageContext.request.contextPath}/deleteRecord?id=<s:property value="downloadId"/>">删除</a></td>
                        <td><s:date name="downloadTime" format="yyyy-MM-dd"/></td>
                    </tr>
                    </s:iterator>
                </tbody>
            </table>
            <s:if test="%{downloadColl.size() == 0}">
            	<div style="text-align: center;font-size:16px;">还没有下载记录！</div>
            </s:if>
            <s:else>
            	<s:form action="myDownload" method="post" id="pagingForm">
				<s:hidden id="currentpage" name="pageBean.currentPage"/>
	            <jsp:include flush="true" page="../include/selectbypage.jsp"></jsp:include>
            </s:form>
            </s:else>
        </div>
    </div>
    
	<%@ include file="../include/footer.jsp"%>
	<script>
		//分页查询
		function searchForPage(page) {
			$('#currentpage').val(page);
			if ($('#currentpage').val() != null) {
				$('#pagingForm').submit();
			} else {
				alert("当前页面值不能为空!");
			}
		}
	</script>
</body>
</html>