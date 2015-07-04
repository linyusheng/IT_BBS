<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="body_right">
	<div class="search">
        <form action="findPost" method="post" id="searchForm">
            <input type="text" name="keyword" placeholder="关键字"> 
            <input type="submit" value="搜索问题">
        </form>
    </div>
    <div class="ask_box">
    	<div class="ask_box_in">
        	<ul>
            	<li>
                	<i><img src="${pageContext.request.contextPath}/images/ask.gif" width="16" height="16" /></i>
                    <label><s:property value="postNum[0]"/></label>
                    <a href="${pageContext.request.contextPath}/activePost">待解决问题</a>
                </li>
                <li style="margin:20px 0 20px 0;">
                	<i><img src="${pageContext.request.contextPath}/images/greenright.gif" width="16" height="16" /></i>
                    <label><s:property value="postNum[1]"/></label>
                    <a href="${pageContext.request.contextPath}/solvedPost">已解决问题</a>
                </li>
                <li>
                	<i><img src="${pageContext.request.contextPath}/images/hot.gif" width="16" height="16" /></i>
                    <label><s:property value="postNum[2]"/></label>
                    <a href="${pageContext.request.contextPath}/hotPost">热门问题</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="ask">
    	<a href="${pageContext.request.contextPath}/enterAsk" title="我要提问"><img src="${pageContext.request.contextPath}/images/ask-but.gif" width="226" height="46" /></a>
    </div>
    <div class="recent_ask">
    	<label style="margin-bottom:5px;">最新评论</label>
        <ul>
        	<s:iterator value="newReplyColl">
        	<li>
            	<p><div id='replyInfo<s:property value="replyId"/>'><s:property value="replyInfo" escape="false"/></div></p>
            	<script>
             	//截取博文头
				var str = $('#replyInfo'+<s:property value="replyId"/>).text();
				$('#replyInfo'+<s:property value="replyId"/>).text(str);
				$('#replyInfo'+<s:property value="replyId"/>).readmore({ substr_len: 50});
          		</script>
            	<span>
                	<a href="${pageContext.request.contextPath}/listBlog?userId=<s:property value="user.userId"/>" title="<s:property value="user.userName"/>"><s:property value="user.userName"/></a> 评论了
                    <a href="${pageContext.request.contextPath}/showPost?id=<s:property value="post.postId"/>"><s:property value="post.postName"/></a>
                </span>
            </li>
            </s:iterator>
        </ul>
      </div>
</div>
