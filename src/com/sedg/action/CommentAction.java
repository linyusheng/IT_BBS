package com.sedg.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.sedg.entity.Article;
import com.sedg.entity.Comment;
import com.sedg.entity.User;
import com.sedg.service.ArticleService;
import com.sedg.service.CommentService;
import com.sedg.service.UserService;
import com.sedg.util.TimeBean;

import lombok.Getter;
import lombok.Setter;

public class CommentAction {
	
	@Getter @Setter private CommentService commentService;
	@Getter @Setter private UserService userService;
	@Getter @Setter private ArticleService articleService;
	@Getter @Setter private Comment comment;
	@Getter @Setter private Article article;
	
	/**
	 * 保存评论
	 */
	public String saveComment() throws Exception {
		//判断是否已登录
		Map<String, Object> session = ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			return "fail";
		}
		Integer userId = (Integer)session.get("loginId");
		User user = userService.loadUser(userId);
		article = articleService.loadArticle(article.getArticleId());
		comment.setArticle(article);
		comment.setUser(user);
		comment.setCommentTime(TimeBean.getCurrenTime());
		commentService.saveComment(comment);
		return "success";
	}
	/**
	 * 删除评论
	 */
	public String deleteComment() throws Exception {
		//commentService.removeComment(id);
		return "success";
	}
	
	
	
	
	
	
	
	
	
	
}
