package com.sedg.action;

import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import lombok.Getter;
import lombok.Setter;

import com.opensymphony.xwork2.ActionContext;
import com.sedg.entity.Article;
import com.sedg.entity.User;
import com.sedg.service.ArticleService;
import com.sedg.service.UserService;
import com.sedg.util.Tool;
import com.sedg.util.PageBean;
import com.sedg.util.TimeBean;

public class LoginAction {
	
	@Getter @Setter private UserService userService;
	@Getter @Setter private ArticleService articleService;
	@Getter @Setter private Collection<Article> articleColl;
	@Getter @Setter private Collection<User> sortUserColl;
	@Getter @Setter private Collection<Article> rankArticleColl;
	@Getter @Setter private User user;
	@Getter @Setter private PageBean pageBean;
	@Getter @Setter private String userName;
	@Getter @Setter private String password;
	@Getter @Setter private Integer typeNum;
	@Getter @Setter private String keyWord;
	@Getter @Setter private String hostPhoto;
	@Getter @Setter private String articleType;
	
	/**
	 * 用户登录
	 */
	public String login() throws Exception{
		if(userName == null || password == null){
			return "fail";
		}
		if(userService.isUserNameExist(userName)){
			user = userService.login(userName, password);
			if(user!=null){
				user.setLastLoginTime(TimeBean.getCurrenTime());
				//更新会话
				updateSession();
				return "success";
			}
		}
		return "fail";
	}
	/**
	 * 登录验证
	 */
	public String loginValidate() throws Exception{
		HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html;charset=UTF-8");
		user = userService.login(userName, password);
		if (user == null) {
			response.getWriter().write("false");
			return null;
		}
		response.getWriter().write("true");
		return null;
	}
	/**
	 * 注销，清空session对象
	 */
	@SuppressWarnings("unchecked")
	public String logout() throws Exception{
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		session.clear();
		return "success";
	}
	/**
	 * 更新Session
	 */
	@SuppressWarnings("unchecked")
	public void updateSession() throws Exception{
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		session.put("user", user);
		session.put("loginId", user.getUserId());
		session.put("loginName", user.getUserName());
		session.put("loginPhoto", user.getPhoto());
	}
	/**
	 *	进入主页
	 */
	public String enterIndex() throws Exception{
		//更新最新博客列表
		if(pageBean == null){
			pageBean = new PageBean();
		}
		articleColl = articleService.listBlog(pageBean);
		//博客排行榜
		PageBean page = new PageBean();
		page.setPageSize(15);
		sortUserColl = userService.sortUserByScore(page);
		//博客人气排行榜
		PageBean rankPage = new PageBean();
		page.setPageSize(10);
		rankArticleColl = articleService.searchArticleByReadNum(rankPage);
		return "success";
	}
	/**
	 * 全站分类
	 */
	public String category() throws Exception{
		//如果传来的是类型序号，则需转换
		if(articleType == null){
			String[] categoty = {"移动开发","Web前端","企业架构","编程语言","互联网","开源软件","操作系统","数据库","研发管理","行业应用","非技术"};
			articleType = categoty[typeNum];
		}
		if(pageBean == null){
			pageBean = new PageBean();
		}
		articleColl = articleService.searchBlogByType(articleType,pageBean);
		//博客排行榜
		PageBean page = new PageBean();
		page.setPageSize(15);
		sortUserColl = userService.sortUserByScore(page);
		//博客人气排行榜
		PageBean rankPage = new PageBean();
		page.setPageSize(10);
		rankArticleColl = articleService.searchArticleByReadNum(rankPage);
		return "success";
	}
	/**
	 * 查找博客
	 */
	public String findBlog() throws Exception {
		if(pageBean == null){
			pageBean = new PageBean();
		}
		articleColl = articleService.searchBlogByTitleKey(keyWord,pageBean);
		//博客排行榜
		PageBean page = new PageBean();
		page.setPageSize(15);
		sortUserColl = userService.sortUserByScore(page);
		//博客人气排行榜
		PageBean rankPage = new PageBean();
		page.setPageSize(10);
		rankArticleColl = articleService.searchArticleByReadNum(rankPage);
		return "success";
	}
	/**
	 * 下载博主头像
	 */
	public String downloadBlogPhoto()throws Exception {
		String filePath = Tool.getWebRootPath() + "images\\userPhoto\\" + hostPhoto;
		com.sedg.util.Tool.downlaod(hostPhoto, filePath);
		return "";
	}
}
