<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="ask_list">
<ul>
	<s:iterator value="postColl">
		<li>
     	  <div class="user_photo">
          	<a href="${pageContext.request.contextPath}/askProblem?userId=<s:property value="user.userId"/>" title="<s:property value="user.userName"/>">
          		<img src='${pageContext.request.contextPath}/downloadPostPhoto?hostPhoto=<s:property value="user.photo"/>' width="50" height="50" />
          	</a>
          </div>
          <div class="title" >
              <a href="${pageContext.request.contextPath}/showPost?id=<s:property value="postId"/>"><s:property value="postName"/></a>
              <s:if test='%{postStatus != null}'>
              		<label>[已解决]</label>
              </s:if>        
          	  <img src="${pageContext.request.contextPath}/images/score.gif" width="10" height="9" />
              <s:property value="praiseBean"/>
          </div>
          <div class="text" id='postInfo<s:property value="postId"/>'>
              <s:property value="postInfo" escape="false"/>
          </div>
          <script>
             	//截取博文头
				var str = $('#postInfo'+<s:property value="postId"/>).text();
				$('#postInfo'+<s:property value="postId"/>).text(str);
				$('#postInfo'+<s:property value="postId"/>).readmore({ substr_len: 200});
          </script>
          <div class="other">
              <p>
				  &nbsp;提问者：<a href="${pageContext.request.contextPath}/askProblem?userId=<s:property value="user.userId"/>" title="<s:property value="user.userName"/>"><s:property value="user.userName"/></a>&nbsp;&nbsp;
                  <img src="${pageContext.request.contextPath}/images/icon_comment.gif" width="17" height="17" />
                  <a href="#">回答(<s:property value="answerNum"/>)</a>&nbsp;&nbsp;
                  <img src="${pageContext.request.contextPath}/images/icon_arrow.gif" width="17" height="18" />
                  <a href="#">有<s:property value="postReadNum"/>人浏览</a>&nbsp;&nbsp;
                  <s:date name="postTime" format="yyyy-MM-dd HH:mm"/>
              </p>
      	</div>
      </li>
      </s:iterator>
  </ul>
</div>