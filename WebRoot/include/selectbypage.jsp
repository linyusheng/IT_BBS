<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="paging">
    <dl>
    	<s:if test="%{pageBean.currentPage == 1}">
        	<dd class="noStyle" style="margin-left:33px;">首页</dd>
        	<dd class="noStyle">上一页</dd>
        </s:if>
        <s:else>
	        <dd style="margin-left:33px;"><a href="javascript:void(0)" onclick="searchForPage(1);">首页</a></dd>
	        <dd><a href="javascript:void(0)" onclick="searchForPage(<s:property value="%{pageBean.currentPage-1}"/>);">上一页</a></dd>
	    </s:else>
	    <s:if test="%{pageBean.currentPage < pageBean.totalPage}">
	    	<dd><a href="javascript:void(0)" onclick="searchForPage(<s:property value="%{pageBean.currentPage+1}"/>);">下一页</a></dd>
        	<dd><a href="javascript:void(0)" onclick="searchForPage(<s:property value="pageBean.totalPage"/>);">尾页</a></dd>
	    </s:if>
        <s:else>
        	<dd class="noStyle">下一页</dd>
        	<dd class="noStyle">尾页</dd>
        </s:else>
        
        <dd>共<s:property value="pageBean.totalPage"/>页&nbsp;&nbsp;到第</dd>
        <dd><input type="text" id="currentPage" value="<s:property value="pageBean.currentPage"/>" size="1"/></dd>
        <dd>&nbsp;页&nbsp;</dd>
        <dd><a href="javascript:void(0)" onclick="searchForPage(currentPage.value);">确定</a></dd>
    </dl>
</div>