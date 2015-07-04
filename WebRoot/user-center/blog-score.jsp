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
        	<label>我的积分</label>
            <table class="score_info">
                	<tr>
                    	<td width="200">您当前的积分为：</td>
                        <td><s:property value="user.score"/></td>
                    </tr>
                    <tr>
                    	<td width="200">您当前IT豆为：</td>
                        <td><s:property value="user.itbeanNum"/></td>
                    </tr>
            </table>
            <label>我的积分足迹</label>
            <table class="myFootprints">
            	<thead>
                	<tr>
                		<td width="300">变更内容</td>
                        <td width="100">积分变化</td>
                        <td>IT豆变化</td>
                        <td>变更时间</td>
                    </tr>
                </thead>
                <tbody>
                	<s:iterator value="scoreColl">
                	<tr>
                    	<td><s:property value="changeContent"/></td>
                        <td><s:property value="scoreChange"/></td>
                        <td><s:property value="itbeanChange"/></td>
                        <td><s:date name="changeTime" format="yyyy-MM-dd"/></td>
                    </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
    
	<%@ include file="../include/footer.jsp"%>
</body>
</html>