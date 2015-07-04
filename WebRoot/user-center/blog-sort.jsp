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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.min.js"></script>
<script>
$(function(){
	$('tbody tr').hover(
		function(){
			var index = $('tbody tr').index(this);
			$('tbody tr:eq('+index+') td').css('background','#EFFAFF');
		},
		function(){
			var index = $('tbody tr').index(this);
			$('tbody tr:eq('+index+') td').css('background','#FFF');
		}
	);
	$('tbody tr td a:even').click(function(e) {
		var index = $('tbody tr td a:even').index(this);
		var sortName = $('tbody tr:eq('+index+') td:first').text();
		var sortId = $('tbody tr:eq('+index+') td:last').text();
		$('#sortId').val(sortId);
		$('#sortName').val(sortName);
        $.layer({
			type: 1,
			title: '编辑分类',
			area : ['300px' , '170px'],
			offset : ['200px', ''],
			border: [1, 0.3, '#108AC6'],
			page:{dom:'.editLayer'}
    	});
    });
    $('.editLayer input[type="submit"],.editLayer input[type="button"]').click(function(e) {
        layer.closeAll();
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
        	<label>博文分类管理</label>
            <div class="sort">
            	<p>新增博客分类 : </p>
                <form action="saveSort" method="post">
                	<input type="text" name="sort.sortName" placeholder="请输入类别名称" size="30" style="height:23px;"/>
                    <input type="submit" value="提交" />
                </form>
            </div>
            <table>
            	<thead>
                	<tr>
                		<td>名称</td><td>文章数量</td><td>管理</td><td>排序</td>
                    </tr>
                </thead>
                <tbody>
                	<s:iterator value="sortColl">
                	<tr>
                    	<td><s:property value="sortName"/></td>
                        <td><s:property value="articleNum"/></td>
                        <td>
                        	<a href="javascript:void(0);">编辑</a>
                        	<a href="<s:url action="deleteSort"><s:param name="id" value="sortId"></s:param></s:url>">删除</a>
                       	</td>
                        <td></td>
                        <td style="display:none;"><s:property value="sortId"/></td>
                    </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
        <div class="editLayer">
	        <form action="editSort" method="post">
				<s:hidden name="id" id="sortId"/>
				<p>请重新输入类别名称</p>
			    <input type="text" name="sortName" id="sortName"/>
			    <input type="submit" value="保存" style="margin-left:40px;"/>
			    <input type="button" value="取消" />
			</form>
		</div>
    </div>
    
	<%@ include file="../include/footer.jsp"%>
</body>
</html>