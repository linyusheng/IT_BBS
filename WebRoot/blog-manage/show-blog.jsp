<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IT论坛</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include-blog-manage.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/show-blog.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/syntaxhighlighter/styles/shCore.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/syntaxhighlighter/styles/shThemeDefault.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
</head>
<body>
    <%@ include file="../include/top.jsp"%>
   	<%@ include file="header.jsp"%>
    <div class="body">
    	<%@ include file="left.jsp"%>
        
        <div class="body_right">
        	<s:hidden name="article.articleId" id="articleId"/>
        	<s:hidden name="user.userId" id="userId"/>
        	<div class="blog_title">
                <h2><a href='${pageContext.request.contextPath}/showBlog?id=<s:property value="article.articleId"/>'><s:property value="article.articleTitle"/></a></h2>
                <strong>博客分类：<s:property value="article.articleSort"/></strong>
            </div>
        	<div class="blog_text">
        		<s:property value="article.articleInfo" escape="false"/>
            </div>
            <div class="write_time">
            	<ul>
                	<li><s:date name="article.writeTime" format="yyyy-MM-dd HH:mm"/></li>
                    <li>浏览<s:property value="article.articleReadNum"/></li>
                    <li><a href="#">评论(<s:property value="article.articleCommentNum"/>)</a></li>
                    <li><a href="javascript:void(0)" id="collect">收藏</a></li>
                    <li style="border:none">分类:<a href='${pageContext.request.contextPath}/category?articleType=<s:property value="article.articleType"/>'><s:property value="article.articleType"/></a></li>
                </ul>
            </div>
            <div class="label_comment">评论</div>
            <div class="show_comment">
            	<s:iterator value="commentColl" status='No'>
	                <div class="comment_header">
	                	<s:property value='#No.index+1'/>楼&nbsp;&nbsp;
	                    <a href='${pageContext.request.contextPath}/loadBloger?userId=<s:property value="user.userId"/>'>
	                    	<s:property value="user.userName"/>
	                    </a>&nbsp;&nbsp;
	                    <s:date name="commentTime" format="yyyy-MM-dd HH:mm"/>
	                </div>
					<div class="comment_info">
	                	<s:property value="commentInfo" escape="false"/>
	                </div>
                </s:iterator>
            </div>
            <div class="label_comment">发表评论</div>
            <s:if test="#session.loginName != null">
            	<form action="saveComment" method="post">
	            <s:hidden name="article.articleId"></s:hidden>
	            <div class="comment">
	            	<textarea name="comment.commentInfo" id="commentEditor"></textarea>
	            </div>
	            <script>
					CKEDITOR.replace('commentEditor',
						{
							language : 'zh-cn',
							height:300,
							toolbar ://工具栏设置
							[
							['Syntaxhighlight','ShowBlocks','Blockquote'],
							['Bold','Italic','Underline','Strike'],
							['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
							['Image','Flash','Smiley','Table','SpecialChar','PageBreak'],
							['TextColor','BGColor'],
							['Styles','Format','Font','FontSize']
							
							]
						}
					);
	            </script>
	           	<div class="submit_comment">
	            	<input type="submit" value="提交评论" />
	            </div>
				</form>
            </s:if>
           	<s:else>
           		<div style="width:100%; text-align: center;"><a href="${pageContext.request.contextPath}/login"> 您还没有登录,请您登录后再发表评论</a></div>
           	</s:else>
        </div>
    </div>
    
	<%@ include file="../include/footer.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushAppleScript.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushAS3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushBash.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushColdFusion.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushCpp.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushCSharp.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushCss.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushDelphi.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushDiff.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushErlang.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushGroovy.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushJava.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushJavaFX.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushJScript.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushPerl.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushPhp.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushPlain.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushPowerShell.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushPython.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushRuby.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushSass.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushScala.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushSql.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushVb.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/syntaxhighlighter/scripts/shBrushXml.js"></script>
<script><!--
//js获取项目根路径，如： http://localhost:8080/ems
function getRootPath(){
	//获取当前网址，如： http://localhost:8080/ems/Pages/Basic/Person.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8080
    var localhostPath = curWwwPath.substring(0, pos);
    //获取带"/"的项目名，如：/ems
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return(localhostPath + projectName);
}
$(function(){
	SyntaxHighlighter.config.clipboardSwf= getRootPath()+'/js/syntaxhighlighter/scripts/clipboard.swf';
	SyntaxHighlighter.defaults['toolbar'] = false;
	SyntaxHighlighter.all();
})
$(function(){
	$('#collect').click(function(){
		var articleId = $('#articleId').val();
		$.ajax({
				url:'collect',
				data:{articleId:articleId},
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
</body>
</html>