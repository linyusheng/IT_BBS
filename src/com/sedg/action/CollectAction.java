package com.sedg.action;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import lombok.Getter;
import lombok.Setter;

import com.opensymphony.xwork2.ActionContext;
import com.sedg.entity.Article;
import com.sedg.entity.Collect;
import com.sedg.entity.User;
import com.sedg.service.ArticleService;
import com.sedg.service.CollectService;
import com.sedg.service.UserService;
import com.sedg.util.TimeBean;

public class CollectAction {
	
	@Getter @Setter private CollectService collectService;
	@Getter @Setter private UserService userService;
	@Getter @Setter private ArticleService articleService;
	@Getter @Setter private Integer userId;
	@Getter @Setter private Integer articleId;
	@Getter @Setter private Integer id;
	
	/**
	 * ajax异步收藏
	 */
	public void collect() throws Exception {
		HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html;charset=UTF-8");
		//判断用户时候已登录
		Map<String, Object> session = ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			response.getWriter().write("fail");
			return;
		}
		userId = (Integer)session.get("loginId");
		//判断用户是否已收藏次博客
		if (collectService.searchCollectByUserAndArticle(userId, articleId).size() == 0) {
			Article article = articleService.loadArticle(articleId);
			User user = userService.loadUser(userId);
			Collect collect = new Collect();
			collect.setArticle(article);
			collect.setUser(user);
			collect.setCollectTime(TimeBean.getCurrenTime());
			collectService.saveCollect(collect);
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}
	/**
	 * 删除用户收藏
	 */
	public String deleteCollect() throws Exception {
		collectService.removeCollect(id);
		return "success";
	}
}
