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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/syntaxhighlighter/styles/shCore.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/syntaxhighlighter/styles/shThemeDefault.css"/>
</head>
<body>
<%@ include file="../include/top.jsp"%>
<%@ include file="header.jsp"%>
    <div class="body">
    	<%@ include file="left.jsp"%>
        <div class="body_right">
            <div class="blog-title">
                <h3>预览文章: <s:property value="article.articleTitle"/></h3>
              	<a href='${pageContext.request.contextPath}/editBlog?id=<s:property value="article.articleId"/>'>
              		<img src="${pageContext.request.contextPath}/images/btn_edit.png" width="16" height="16" />
              	</a>
              	<a href='${pageContext.request.contextPath}/deleteBlog?id=<s:property value="article.articleId"/>'>
              		<img src="${pageContext.request.contextPath}/images/btn_delete.png" width="16" height="16" />
              	</a>
            </div>
            <div class="blog-time">发表时间：<s:date name="article.writeTime" format="yyyy-MM-dd"/></div>
            <div class="blog-sort">
            	<h4>博客分类：</h4>
                <a href="#"><s:property value="article.articleSort"/></a>
            </div>
            <div class="blog-text">
            	<s:property value="article.articleInfo" escape="false"/>
            </div>
        </div>    
    </div>
    
	<%@ include file="../include/footer.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
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
<script>
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
</script>
</body>
</html>