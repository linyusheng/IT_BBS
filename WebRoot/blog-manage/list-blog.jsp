<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IT论坛</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include-blog-manage.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/list-blog.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/readmore_split.js"></script>
</head>
<body>
    <%@ include file="../include/top.jsp"%>
    <%@ include file="header.jsp"%>
    
    <div class="body">
    	<%@ include file="left.jsp"%>
        
        <div class="body_right">
        	<label>文章列表</label>
        	<s:iterator value="articleColl">
        	<div id='id<s:property value="articleId"/>' style="display:none;"><s:property value="articleId"/></div>
            <div class="blog_title">
                <h2><a href='${pageContext.request.contextPath}/showBlog?id=<s:property value="articleId"/>'><s:property value="articleTitle"/></a></h2>
                <strong>博客分类：<s:property value="articleSort"/></strong>
            </div>
            <div id='articleInfo<s:property value="articleId"/>' class="blog_text">
           		<s:property value="articleInfo" escape="false"/>
            </div>
            <script>
	            //截取博文头
				var str = $('#articleInfo'+<s:property value="articleId"/>).text();
				$('#articleInfo'+<s:property value="articleId"/>).text(str);
				$('#articleInfo'+<s:property value="articleId"/>).readmore({ substr_len: 200});
            </script>
            <div class="write_time">
            	<ul>
                	<li style="padding-left:0"><s:date name="writeTime" format="yyyy-MM-dd HH:MM"/></li>
                    <li>浏览<s:property value="article.articleReadNum"/></li>
                    <li><a href="${pageContext.request.contextPath}/showBlog?id=<s:property value="articleId"/>">评论(<s:property value="articleCommentNum"/>)</a></li>
                    <li><a href="javascript:void(0)" id="collect<s:property value="articleId"/>">收藏</a></li>
                    <li style="border:none">分类:<a href='${pageContext.request.contextPath}/category?articleType=<s:property value="articleType"/>'><s:property value="articleType"/></a></li>
                    <script>
                    $(function(){
						$('#collect'+<s:property value="articleId"/>).click(function(){
							var id = $('#id'+<s:property value="articleId"/>).text();
							$.ajax({
									url:'collect',
									data:{articleId:id},
									cache : false,
									dataType : 'text',
									success : function(data){
										//若还没登陆
										if(data == "fail"){
											window.location='${pageContext.request.contextPath}/login';
										}
										//若还没收藏
										if(data == "true"){
											alert("收藏成功！");
										}
										//若已收藏
										if(data == "false"){
											alert("你已经收藏了！");
										}
									}
								});
						});
					})	
                    </script>
                </ul>
            </div>
            </s:iterator>          
        </div>
    </div>
    
	<%@ include file="../include/footer.jsp"%>
</body>
</html>