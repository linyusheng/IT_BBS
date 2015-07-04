<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>论坛中心</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/postCenter.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/syntaxhighlighter/styles/shCore.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/syntaxhighlighter/styles/shThemeDefault.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/readmore_split.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/post-manage.js"></script>
</head>

<body>
	<%@ include file="../include/top.jsp"%>
    <%@ include file="header.jsp"%>
    <div class="body">
    	<div class="body_left">
       	  <div class="problem_box">
              <div class="title" >
                	<img src="${pageContext.request.contextPath}/images/ask.gif" width="16" height="16" /> 
                    <a href="${pageContext.request.contextPath}/showPost?id=<s:property value="post.postId"/>"><s:property value="post.postName"/></a>
                    <img src="${pageContext.request.contextPath}/images/score.gif" width="10" height="9" />
                    <s:property value="post.praiseBean"/>
              </div>
              <div class="asker_info">
              	提问者：<a href="${pageContext.request.contextPath}/askProblem?userId=<s:property value="post.user.userId"/>" title="<s:property value="post.user.userName"/>"><s:property value="post.user.userName"/></a>&nbsp;&nbsp;
				提问时间：<s:date name="post.postTime" format="yyyy-MM-dd HH:mm"/> &nbsp;&nbsp;
              	<img src="${pageContext.request.contextPath}/images/comment.gif" width="16" height="16" style="vertical-align:middle;"/>
                <a href="#response">我要回答</a> 
              </div>
              <div class="info">
              	<s:property value="post.postInfo" escape="false"/>
              </div>
          </div>
          <div class="response">
              <s:if test="%{replyColl.size() == 0}">
			      目前还没有答案
			  </s:if>
			  <s:else>
	          <div class="response_title">
       	      		<img src="${pageContext.request.contextPath}/images/bluestatus.gif" width="16" height="16" style="vertical-align:middle;"/> 
                    <s:property value="replyColl.size()"/>个答案
              </div>
          	  <ul>
          	  	<s:iterator value="replyColl">
              	<li>
                	<div class="response_info">
                    	<s:property value="replyInfo" escape="false"/>
                    </div>
                    <div class="asker_info">
                    	回答者：<a href="${pageContext.request.contextPath}/answerProblem?userId=<s:property value="user.userId"/>"  title="<s:property value="user.userName"/>"><s:property value="user.userName"/></a>&nbsp;&nbsp;
						回答时间：<s:date name="replyTime" format="yyyy-MM-dd HH:mm"/> &nbsp;&nbsp;
                        <img src="${pageContext.request.contextPath}/images/comment.gif" width="16" height="16" style="vertical-align:middle;"/>
                		<a href="#response">添加评论</a>
                    </div>
                </li>
                </s:iterator>
              </ul>
              </s:else>
          </div>
          <div class="response">
          	  <form action="saveReply" method="post">
          	  <s:hidden name="post.postId" />
          	  <div class="response_title">
       	      		<img src="${pageContext.request.contextPath}/images/bluestatus.gif" width="16" height="16" style="vertical-align:middle;"/> 
                    我来回答<a name="response"></a>
              </div>
              <div class="edit_response">
              		<textarea name="reply.replyInfo" id="editor"></textarea>
              </div>
              <script>
              CKEDITOR.replace('editor',
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
              <div>
              		<input type="submit" value="提交"/>
              </div>
              </form>
          </div>
        </div>
        <%@ include file="right.jsp"%>
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