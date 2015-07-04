package com.sedg.action;

import java.util.Map;

import lombok.Getter;
import lombok.Setter;

import com.opensymphony.xwork2.ActionContext;
import com.sedg.entity.Post;
import com.sedg.entity.Reply;
import com.sedg.entity.User;
import com.sedg.service.PostService;
import com.sedg.service.ReplyService;
import com.sedg.service.UserService;
import com.sedg.util.TimeBean;

public class ReplyAction {
	
	@Getter @Setter private ReplyService replyService;
	@Getter @Setter private UserService userService;
	@Getter @Setter private PostService postService;
	@Getter @Setter private Reply reply;
	@Getter @Setter private Post post;
	
	/**
	 * 保存问题回复
	 */
	public String saveReply() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			return "fail";
		}
		Integer userId = (Integer)session.get("loginId");
		User user = userService.loadUser(userId);
		post = postService.loadPost(post.getPostId());
		reply.setPost(post);
		reply.setUser(user);
		reply.setReplyTime(TimeBean.getCurrenTime());
		replyService.saveReply(reply);
		//问题的回复数+1
		post.setAnswerNum(post.getAnswerNum()+1);
		postService.savePost(post);
		return "success";
	}
	
}
