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
</head>
<body>
<%@ include file="../include/top.jsp"%>
<%@ include file="header.jsp"%>
    <div class="body">
    	<%@ include file="left.jsp"%>
        <div class="body_right">
        	<label>上传学习资料</label>
        	<form action="saveResource" method="post" enctype="multipart/form-data">
            <table class="upload">
                <tr>
                    <td width="100">资料描述</td>
                    <td><input name="resource.resourceName" type="text" size="50"/></td>
                </tr>
                <tr>
                    <td>资料类型</td>
                    <td>
                    	<s:select name="resource.resourceType" list="{'移动开发','Web前端','企业架构','编程语言','互联网','开源软件','操作系统','数据库','研发管理','行业应用','非技术'}"></s:select>
                    </td>
                </tr>
                <tr>
                    <td>设置下载IT豆</td>
                    <td>
                    	<input name="resource.itBean" type="text"  size="10" id="ITbean" value="0"/>
                    	<s:select list="{0,1,2,3,4,5,6,7,8,9,10}" onchange="ITbean.value=this.value"></s:select>
                    </td>
                </tr>
                <tr>
                    <td>选择文件</td>
                    <td>
                    	<input type="text" id="filePath" maxlength="255" readonly="readonly"/>
	                    <input type="button" onclick="myfile.click();" value="选择" />
	                    <input type="file" id="myfile" name="upload"  onchange="filePath.value=this.value" style="display:none" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                    	<input type="submit" value="提交"/>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
    
	<%@ include file="../include/footer.jsp"%>
</body>
</html>