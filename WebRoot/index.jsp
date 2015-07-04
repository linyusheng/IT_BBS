<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IT论坛</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/readmore_split.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
</head>
<body>
    <%@ include file="include/top.jsp"%>
    <div class="header">
    	<div class="logo"><a href="${pageContext.request.contextPath}/index" title="IT论坛-最棒的软件开发交流社区"><img src="images/logo.png" width="200" height="90"/></a></div>
        <div class="ad"><a href="#"><img src="images/qiye-tp-728-90-20140417.jpg" width="728" height="90" /></a></div>
    </div>
    <div class="body">
    	<div class="body_left">	
    		<div class="nav_side">
                <ul>
                    <li class="select"><a href="${pageContext.request.contextPath}/index" id="all">全部分类</a></li>
                    <li class=""><a href="${pageContext.request.contextPath}/category?typeNum=0" id="mobile">移动开发</a></li>
                    <li class=""><a href="${pageContext.request.contextPath}/category?typeNum=1" id="web">Web前端</a></li>
                    <li class=""><a href="${pageContext.request.contextPath}/category?typeNum=2" id="architecture">企业架构</a></li>
                    <li class=""><a href="${pageContext.request.contextPath}/category?typeNum=3" id="language">编程语言</a></li>
                    <li class=""><a href="${pageContext.request.contextPath}/category?typeNum=4" id="internet">互联网</a></li>
                    <li class=""><a href="${pageContext.request.contextPath}/category?typeNum=5" id="opensource">开源软件</a></li>
                    <li class=""><a href="${pageContext.request.contextPath}/category?typeNum=6" id="os">操作系统</a></li>
                    <li class=""><a href="${pageContext.request.contextPath}/category?typeNum=7" id="database">数据库</a></li>    
                    <li class=""><a href="${pageContext.request.contextPath}/category?typeNum=8" id="develop">研发管理</a></li>
                    <li class=""><a href="${pageContext.request.contextPath}/category?typeNum=9" id="industry">行业应用</a></li>
                    <li class="last"><a href="${pageContext.request.contextPath}/category?typeNum=10" id="other">非技术</a></li>
                </ul>
        	</div>
            <div class="ranking">
            	<label>博客排行榜</label>
                <ul>
                	<s:iterator value="sortUserColl" status='rank'>
                		<li>
                			<s:property value='#rank.index+1'/>.&nbsp;
                			<s:if test="#rank.index<3">
                				<a href='${pageContext.request.contextPath}/listBlog?userId=<s:property value="userId"/>' class="bold" title="<s:property value="userName"/>"><s:property value="userName"/></a>
                			</s:if>
                			<s:else>
                				<a href='${pageContext.request.contextPath}/listBlog?userId=<s:property value="userId"/>' title="<s:property value="userName"/>"><s:property value="userName"/></a>
                			</s:else>
                			
                		</li>
                	</s:iterator>
                </ul>
            </div>
		</div>
        <div class="body_center">
        	<s:form action="index" method="post" id="pagingForm">
        	<s:hidden id="currentpage" name="pageBean.currentPage"/>
        	<ul>
        		<s:iterator value="articleColl">
           	  	<li>
                	<div class="title" >
                        <p>
                        	<label>[<s:property value="articleType"/>]</label>     
                            <a href='${pageContext.request.contextPath}/showBlog?id=<s:property value="articleId"/>'><s:property value="articleTitle"/></a>
                      	</p>
                    </div>
                    <div class="text">
           	  			<a href='${pageContext.request.contextPath}/listBlog?userId=<s:property value="user.userId"/>' title="<s:property value="user.userName"/>">
           	  				<img src='${pageContext.request.contextPath}/downloadBlogPhoto?hostPhoto=<s:property value="user.photo"/>' width="48" height="48" />
           	  			</a>
                    	<div id='articleInfo<s:property value="articleId"/>'>
                    		<s:property value="articleInfo" escape="false"/>
                    	</div>
                    	<script>
                    		//截取博文头
							var str = $('#articleInfo'+<s:property value="articleId"/>).text();
							$('#articleInfo'+<s:property value="articleId"/>).text(str);
							$('#articleInfo'+<s:property value="articleId"/>).readmore({ substr_len: 200});
                    	</script>
                    </div>
                    <div class="other">
                    	<p>
                        	&nbsp;<a href='${pageContext.request.contextPath}/listBlog?userId=<s:property value="user.userId"/>' title="<s:property value="user.userName"/>"><s:property value="user.userName"/></a>&nbsp;&nbsp;
                        	<img src="images/icon_comment.gif" width="17" height="17" />
                            <a href="#">评论(<s:property value="articleCommentNum"/>)</a>&nbsp;&nbsp;
                        	<img src="images/icon_arrow.gif" width="17" height="18" />
							有<s:property value="articleReadNum"/>人浏览</a>&nbsp;&nbsp;
                            <s:date name="writeTime" format="yyyy-MM-dd HH:mm"/>
                        </p>
                    </div>
            	</li>
            	</s:iterator>
            </ul>
            <jsp:include flush="true" page="include/selectbypage.jsp"></jsp:include>
            </s:form>
        </div>
        <div class="body_right">
            <div class="search">
                <form action="findBlog" method="post" id="searchForm">
                    <input type="text" name="keyWord" placeholder="关键字" /> 
                    <input type="submit" value="搜索博客" />
                </form>
            </div>
            <div class="nav">
            	<label>快速导航栏</label>
                <a href="${pageContext.request.contextPath}/hotPost">论坛中心</a>
                <a href="${pageContext.request.contextPath}/listAllResource">资料下载</a>
            </div>
            <div class="new_blog">
            	<label style="margin-bottom:5px;">博客人气排行榜</label>
                <ul>
                	<s:iterator value="rankArticleColl" status="No">
                		<li><s:property value="#No.index+1"/>.&nbsp;<a href="${pageContext.request.contextPath}/showBlog?id=<s:property value="articleId"/>"><s:property value="articleTitle"/></a></li>
                	</s:iterator>
                </ul>
            </div>
        </div>
    
    </div>
	<%@ include file="include/footer.jsp"%>
</body>
</html>