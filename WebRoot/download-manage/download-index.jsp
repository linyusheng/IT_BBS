<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/download.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
</head>

<body>
	<%@ include file="../include/top.jsp"%>
    <div class="header">
        <div class="logo"><a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/images/logo.png" width="200" height="90"/></a></div>
        <div class="ad"><a href="#"><img src="${pageContext.request.contextPath}/images/qiye-tp-728-90-20140417.jpg" width="728" height="90" /></a></div>
    </div>
    <div class="page">
    	<h3>全部资料</h3>
        <table>
        	<thead>
            	<tr>
                	<td>序号</td>
                	<td width="450">资料描述</td>
                    <td>资料类型</td>
                    <td>上传者</td>
                    <td>下载IT豆</td>
                    <td>操作</td>
                    <td>上传时间</td>
                </tr>
            </thead>
            <s:form action="download" method="post" style="display:none;">
            		<s:hidden name="fileName" id="fileName" />
            </s:form>
            <tbody>
            	<s:iterator value="resourceColl" status="No">
	            	<div id='id<s:property value="resourceId"/>' style="display:none;"><s:property value="resourceId"/></div>
	            	<div id='fileName<s:property value="resourceId"/>' style="display:none;"><s:property value="resourcePath"/></div>
                <tr>
                	<td><s:property value="#No.index+1"/></td>
                    <td><s:property value="resourceName"/></td>
                    <td><s:property value="resourceType"/></td>
                    <td><a href='${pageContext.request.contextPath}/listBlog?userId=<s:property value="user.userId"/>'><s:property value="user.userName"/></a></td>
                    <td><s:property value="itBean"/></td>
                    <td><a href="javascript:void(0)" id='download<s:property value="resourceId"/>'>下载</a></td>
                    <td><s:date name="uploadTime" format="yyyy-MM-dd"/></td>
                </tr>
                <script>
				$(function(){
					$('#download'+<s:property value="resourceId"/>).click(function(){
						var id = $('#id'+<s:property value="resourceId"/>).text();
						var fileName = $('#fileName'+<s:property value="resourceId"/>).text();
						$.ajax({
								url:'downloadResource',
								data:{	id:id,
										fileName:fileName
								},
								cache : false,
								dataType : 'text',
								success : function(data){
									//若还没登陆
									if(data == "fail"){
										window.location='${pageContext.request.contextPath}/login';
										return;
									}
									//若IT豆不足
									if(data == "notEnoughItbean"){
										alert("你的IT豆不足！");
										return;
									}
									$('#fileName').val(data);
									$('form').submit();
								}
							});
					});
				})
				</script>
                </s:iterator>
            </tbody>
        </table>
    </div>
    <%@ include file="../include/footer.jsp"%>
</body>
</html>