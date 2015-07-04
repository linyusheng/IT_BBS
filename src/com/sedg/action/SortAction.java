package com.sedg.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.sedg.entity.Article;
import com.sedg.entity.Sort;
import com.sedg.entity.User;
import com.sedg.service.ArticleService;
import com.sedg.service.SortService;
import com.sedg.service.UserService;
import com.sedg.util.TimeBean;

import lombok.Getter;
import lombok.Setter;

public class SortAction {
	
	@Getter @Setter private SortService sortService;
	@Getter @Setter private UserService userService;
	@Getter @Setter private ArticleService articleService;
	@Getter @Setter private Sort sort;
	@Getter @Setter private Integer id;
	@Getter @Setter private String sortName;
	
	/**
	 * 保存博客分类
	 */
	public String saveSort() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("loginId");
		User user=userService.loadUser(userId);
		sort.setUser(user);
		sort.setArticleNum(0);
		sort.setCreateTime(TimeBean.getCurrenTime());
		sortService.saveSort(sort);
		return "success";
	}
	/**
	 * 删除博客分类
	 */
	public String deleteSort()throws Exception {
		sortService.removeSort(id);
		return "success";
	}
	/**
	 * 编辑博客分类
	 */
	public String editSort() throws Exception{
		sort = sortService.loadSort(id);
		String oldSortName = sort.getSortName(); 
		sort.setSortName(sortName);
		sortService.saveSort(sort);
		//同时修改博客类型
		List<Article> list = articleService.searchBlogByUserAndSortName(sort.getUser().getUserId(),oldSortName);
		for (int i = 0; i < list.size(); i++) {
			Article article = list.get(i);
			article.setArticleSort(sortName);
			articleService.updateArticle(article);
		}
		return "success";
	}
}
