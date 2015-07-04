<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="body_left">
        	<div class="photo">
       	    <a href="${pageContext.request.contextPath}/myBlog" title="<s:property value="user.userName"/>"><img src="${pageContext.request.contextPath}/downloadUserPhoto" width="120" height="120" /></a> </div>
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
            	<h4>博客管理</h4>
                <ul>
                	<li>
                    	<i></i>
                    	<a href="${pageContext.request.contextPath}/writeBlog">发表文章</a>
                    </li>
					<li>
                    	<i></i>
                    	<a href="${pageContext.request.contextPath}/sortBlog">分类管理</a>
                    </li>
                    
                </ul>
            </div>
            <div class="blog_list">
            	<h4>我的空间</h4>
                <ul>
                	<li>
                    	<i></i>
                    	<a href="${pageContext.request.contextPath}/personalInfo">个人主页</a>
                    </li>
                    <li>
                    	<i></i>
                    	<a href="${pageContext.request.contextPath}/myAsk">我的问答</a>
                    </li>
					<li>
                    	<i></i>
                    	<a href="${pageContext.request.contextPath}/myScore">我的积分</a>
                    </li>
                    <li>
                    	<i></i>
                    	<a href="${pageContext.request.contextPath}/myComment">我的评论</a>
                    </li>
                    <li>
                    	<i></i>
                    	<a href="${pageContext.request.contextPath}/myCollect">我的收藏</a>
                    </li>
                    <li>
                    	<i></i>
                    	<a href="${pageContext.request.contextPath}/myDownload">我的下载</a>
                    </li>
                </ul>
            </div>
          <div class="blog_list">
            <h4>文章分类</h4>
              <ul>
                  <li>
                  	<i></i>
                    <a href="${pageContext.request.contextPath}/myBlog">全部博客(<s:property value="articleColl.size()"/>)</a>
                  </li>
                  <s:iterator value="sortColl">
                  <li>
                  	<i></i>
                    <a href='${pageContext.request.contextPath}/categoriesBlog?sortName=<s:property value="sortName"/>'>
                    	<s:property value="sortName"/>(<s:property value="articleNum"/>)
                    </a>
                  </li>
                  </s:iterator>
              </ul>
            </div>
      </div>