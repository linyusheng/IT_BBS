<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/include-userCenter.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/add-blog.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script>
$(function(){
	$('#selectSort').change(function(e) {
		$('#blogSort').val($('#selectSort').val());
    });
	//表单验证
	$("form").submit(function(){
		var blogTitle = $('#blogTitle').val();	//博客标题
		var allSort = $('#allSort').val();		//全站分类
		var blogSort = $('#blogSort').val();	//博客分类
		var editor = CKEDITOR.instances.editor.getData();//博客正文
		var blogLabel = $('#blogLabel').val();	//博客标签
		
		if(blogTitle == "" || blogTitle == null){
			alert("请输入博客标题！")
			return false;
		}
		if(allSort == "" || allSort == null){
			alert("请选择全站分类！");
			return false;
		}
		if(blogSort == "" || blogSort == null){
			alert("博客分类不能为空！");
			return false;
		}
		if(editor == "" || editor == null){
			alert("博客正文不能为空！");
			return false;
		}
		return true;
	});
})
</script>
</head>
<body>
<%@ include file="../include/top.jsp"%>
<%@ include file="header.jsp"%>
    <div class="body">
    	<%@ include file="left.jsp"%>
        <div class="body_right">
        	<form action="saveBlog" method="post">
        	<s:hidden name="article.articleId" />
        	<ul>
            	<li>
                    <h4>博客标题</h4>
                    <input type="text" name="article.articleTitle" value="<s:property value="article.articleTitle"/>" size="60" id="blogTitle" autofocus="autofocus"/>
                </li>
                <li>
                	<h4>全站分类</h4>
                	<s:select name="article.articleType" list="{'移动开发','Web前端','企业架构','编程语言','互联网','开源软件','操作系统','数据库','研发管理','行业应用','非技术'}" headerKey="" headerValue="--选择全站分类--" id="allSort"></s:select>
                </li>
                <li>
                    <h4>博客分类</h4>
                    <input type="text" name="article.articleSort" value="<s:property value="article.articleSort"/>" size="18" id="blogSort"/>
                    <s:select list="sortColl" listKey="sortName" listValue="sortName" headerKey="" headerValue="--选择已有的分类--" id="selectSort"></s:select>
                </li>
                <li>
                	<h4>博客正文</h4>
                	<div class="blog_text">
                		<textarea name="article.articleInfo" id="editor"><s:property value="article.articleInfo"/></textarea>
                	</div>
                	<script>
						CKEDITOR.replace('article.articleInfo',
							{
								language : 'zh-cn',
								height:500,
								toolbar ://工具栏设置
								[
								['Syntaxhighlight','Preview','Maximize','-','Save','NewPage','Print','Templates'],
								['Cut','Copy','Paste','PasteText','PasteFromWord'],
								['Undo','Redo','-','Find','Replace','SelectAll','-',,'Table','HorizontalRule','-','SelectAll','RemoveFormat'],
								['Link','Unlink','Anchor'],
								'/',
								['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
								['NumberedList','BulletedList','-','Outdent','Indent'],
								['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
								['Image','Flash','Smiley','Table','SpecialChar','PageBreak'],
								['Styles','Format','Font','FontSize'],
								['TextColor','BGColor'],
								['ShowBlocks','Blockquote','-','Source','About']
								]
							}
						);
                    </script>
                </li>
                <li>
                    <h4>标签</h4>
                    <input type="text" name="article.articleLabel" value="<s:property value="article.articleLabel"/>" size="40" id="blogLabel"/>
                    <p>用逗号分开，不超过五个</p>
                </li>
                <li>
                	<h4></h4>
                    <input type="submit" value="发表"/>
                </li>
        	</ul>
        	</form>
        </div>
    </div>
    
	<%@ include file="../include/footer.jsp"%>
</body>
</html>