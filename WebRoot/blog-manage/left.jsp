<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="body_left">
        	<div class="photo">
       	    	<a href="${pageContext.request.contextPath}/listBlog?userId=<s:property value="user.userId"/>">
       	    		<img src='${pageContext.request.contextPath}/downloadBlogPhoto?hostPhoto=<s:property value="user.photo"/>' width="120" height="120" />
       	    	</a>
       	    </div>
          	<div class="user_name">
                <s:property value="user.userName"/>
            </div>
            <div class="other_info">
            	<ul>
                	<li>浏览: <s:property value="user.userReadNum"/>次</li>
                	<s:if test='%{user.sex == "男"}'>
                		<li>性别: <img src="${pageContext.request.contextPath}/images/icon_minigender_1.gif" width="11" height="11" /></li>
                	</s:if>
                    <s:if test='%{user.sex == "女"}'>
                		<li>性别: <img src="${pageContext.request.contextPath}/images/icon_minigender_2.gif" width="11" height="11" /></li>
                	</s:if>
                    <s:if test='%{user.address != null}'>
                    	<li>来自: <s:property value="user.address"/></li>
                    </s:if>
                </ul>
            </div>
            <div class="blog_list">
              <h4>社区版块</h4>
              <ul>
                  <li>
                    <i></i>
                    <a href="${pageContext.request.contextPath}/askProblem?userId=<s:property value="user.userId"/>">我的问答</a>
                  </li>
              </ul>
            </div>
			<div class="blog_list">
				<h4>文章分类</h4>
			    <ul>
			        <li>
			        	<i></i>
			          <a href="${pageContext.request.contextPath}/listBlog?userId=<s:property value="user.userId"/>">全部博客(<s:property value="allArticleNum"/>)</a>
			        </li>
			        <s:iterator value="sortColl">
			        <li>
			        	<i></i>
			          <a href='${pageContext.request.contextPath}/categoryBlog?userId=<s:property value="user.userId"/>&sortName=<s:property value="sortName"/>'>
			          	<s:property value="sortName"/>(<s:property value="articleNum"/>)
			          </a>
			        </li>
			        </s:iterator>
			    </ul>
			</div>
      </div>