<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>论坛中心</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/postCenter.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/post-manage.js"></script>
</head>

<body>
	<%@ include file="../include/top.jsp"%>
    <%@ include file="header.jsp"%>
    <div class="body">
    	<div class="return">
        	<a href="${pageContext.request.contextPath}/hotPost">回到问答首页</a>
        </div>
   	  <div class="body_center">
       	  	<div class="ask_header">
       	  		<img src="${pageContext.request.contextPath}/images/ask.gif" width="16" height="16" style="vertical-align:middle;"/> 
                <strong style="color:#006699;">提问</strong>
                &nbsp;&nbsp;请详细填写您的问题说明
            </div>
            <div class="ask_body">
            	<form action="savePost" method="post" id="postForm">
            	<ul>
                	<li class="left">标题：</li>
                    <li class="right">
                    	<input name="post.postName" type="text" size="80"/>
                    </li>
                    
                    <li class="left">问答豆：</li>
                    <li class="right">
                    	<s:select name="post.praiseBean" list="{0,1,2,3,4,5,6,7,8,9,10}"></s:select>
                    </li>
                    
                    <li class="left">详细描述：</li>
                    <li class="right">
                    	<textarea name="post.postInfo" id="editor"></textarea>
                    </li>
                    
                    <li class="left"></li>
                    <li class="right">
                    	<input type="submit" value="提交"/>
                    </li>
                </ul>
                </form>
            </div>
      </div>
    </div>
    
    <%@ include file="../include/footer.jsp"%>
    <script>
		CKEDITOR.replace('editor',
			{
				language : 'zh-cn',
				width:673,
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
</body>
</html>