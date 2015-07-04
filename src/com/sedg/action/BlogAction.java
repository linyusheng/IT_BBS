package com.sedg.action;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.sedg.entity.Article;
import com.sedg.entity.Collect;
import com.sedg.entity.Comment;
import com.sedg.entity.Post;
import com.sedg.entity.Reply;
import com.sedg.entity.Score;
import com.sedg.entity.Sort;
import com.sedg.entity.User;
import com.sedg.service.ArticleService;
import com.sedg.service.CollectService;
import com.sedg.service.CommentService;
import com.sedg.service.PostService;
import com.sedg.service.ReplyService;
import com.sedg.service.ScoreService;
import com.sedg.service.SortService;
import com.sedg.service.UserService;
import com.sedg.util.TimeBean;

import lombok.Getter;
import lombok.Setter;

public class BlogAction {
	
	@Getter @Setter private ArticleService articleService;
	@Getter @Setter private UserService userService;
	@Getter @Setter private SortService sortService;
	@Getter @Setter private CommentService commentService;
	@Getter @Setter private CollectService collectService;
	@Getter @Setter private PostService postService;
	@Getter @Setter private ReplyService replyService;
	@Getter @Setter private ScoreService scoreService;
	@Getter @Setter private Article article;
	@Getter @Setter private User user;
	@Getter @Setter private Integer userId;
	@Getter @Setter private Integer id;
	@Getter @Setter private List<Article> articleColl;
	@Getter @Setter private List<Sort> sortColl;
	@Getter @Setter private List<Comment> commentColl;
	@Getter @Setter private Collection<Collect> collectColl;
	@Getter @Setter private Collection<Post> postColl;
	@Getter @Setter private Collection<Reply> replyColl;
	@Getter @Setter private String sortName;
	@Getter @Setter private Integer allArticleNum;
	
	/**
	 * 加载用户信息
	 */
	public String loadUserMessage() throws Exception{
		//判断是否已登录
		Map<String, Object> session = ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			return "fail";
		}
		userId = (Integer)session.get("loginId");
		user=userService.loadUser(userId);
		articleColl = articleService.searchBlogByUser(userId);
		sortColl = sortService.searchSortByUser(userId);
		return "success";
	}
	/**
	 * 根据博文ID是否为空，新增博文或编辑博文
	 */
	public String saveBlog() throws Exception {
		loadUserMessage();
		//如果用户输入的博客分类名称不存在，则为该用户创建新的博客分类名称
		List<Sort> list = sortService.searchSortBySortName(userId, article.getArticleSort());
		if(list.size() == 0){
			Sort sort = new Sort();
			sort.setUser(user);
			sort.setArticleNum(0);
			sort.setSortName(article.getArticleSort());
			sort.setCreateTime(TimeBean.getCurrenTime());
			sortService.saveSort(sort);
		}
		//博文初始化
		article.setUser(user);
		article.setArticlePraiseNum("0");
		article.setArticleCommentNum("0");
		article.setArticleReadNum("0");
		article.setWriteTime(TimeBean.getCurrenTime());
		//新增博文
		if(article.getArticleId() == null){
			articleService.saveArticle(article);
			article = articleService.searchBlogByTitle(userId,article.getWriteTime());
			//分类表博客数+1
			Sort sort = sortService.searchSortBySortName(userId, article.getArticleSort()).get(0);
			sort.setArticleNum(sort.getArticleNum()+1);
			sortService.saveSort(sort);
			//用户表博客数+1，积分+100，IT豆+2
			user = userService.loadUser(userId);
			user.setArticleNumber(user.getArticleNumber()+1);
			user.setScore(user.getScore()+100);
			user.setItbeanNum(user.getItbeanNum()+2);
			userService.saveUser(user);
			//添加一条积分记录
			Score score = new Score();
			score.setUser(user);
			score.setChangeContent("发表博客");
			score.setScoreChange("+100");
			score.setItbeanChange("+2");
			score.setChangeTime(TimeBean.getCurrenTime());
			scoreService.saveScore(score);
		}
		//修改博客
		else {
			String beforeSort = articleService.loadArticle(article.getArticleId()).getArticleSort();
			String afterSort = article.getArticleSort();
			//如果前类型和后类型不相同，则前类型-1，后类型+1
			if (beforeSort != afterSort) {
				Sort sort = null;
				//前类型-1
				sort = sortService.searchSortBySortName(userId, beforeSort).get(0);
				sort.setArticleNum(sort.getArticleNum()-1);
				sortService.saveSort(sort);
				//后类型+1
				sort = sortService.searchSortBySortName(userId, afterSort).get(0);
				sort.setArticleNum(sort.getArticleNum()+1);
				sortService.saveSort(sort);
			}
			articleService.updateArticle(article);
		}
		//更新博客数和分类数
		articleColl = articleService.searchBlogByUser(userId);
		sortColl = sortService.searchSortByUser(userId);
		return "success";
	}
	/**
	 * 进入编辑博客页面
	 */
	public String editBlog()throws Exception {
		loadUserMessage();
		article = articleService.loadArticle(id);
		return "success";
	}
	/**
	 * 根据博文ID删除博客
	 */
	public String deleteBlog() throws Exception {
		//删除博客前应该先把与博客相关联的评论记录和收藏记录删除
		commentColl = commentService.searchCommentByArticle(id);
		collectColl = collectService.searchCollectByArticle(id);
		for (Comment comment : commentColl) {
			commentService.removeComment(comment.getCommentId());
		}
		for (Collect collect : collectColl) {
			collectService.removeCollect(collect.getCollectId());
		}
		String sortName = articleService.loadArticle(id).getArticleSort();
		articleService.removeArticle(id);
		loadUserMessage();
		//博文类型-1
		Sort sort = null;
		sort = sortService.searchSortBySortName(userId, sortName).get(0);
		if(sort.getArticleNum() > 0){
			sort.setArticleNum(sort.getArticleNum()-1);
		}
		sortService.saveSort(sort);
		//用户表博客数-1
		user = userService.loadUser(userId);
		if (user.getArticleNumber() > 0) {
			user.setArticleNumber(user.getArticleNumber()-1);
		}
		userService.saveUser(user);
		return "success";
	}
	/**
	 * 根据博客id加载博主相关信息
	 */
	public String loadBlogerMessage() throws Exception{
		article = articleService.loadArticle(id);
		user = article.getUser();
		Integer userId = user.getUserId();
		articleColl = articleService.searchBlogByUser(userId);
		allArticleNum = articleColl.size();
		sortColl = sortService.searchSortByUser(userId);
		commentColl = commentService.searchCommentByArticle(id);
		return "success";
	}
	/**
	 * 根据用户id加载博主相关信息
	 */
	public String loadBloger() throws Exception{
		user = userService.loadUser(userId);
		articleColl = articleService.searchBlogByUser(userId);
		allArticleNum = articleColl.size();
		sortColl = sortService.searchSortByUser(userId);
		return "success";
	}
	/**
	 * 分类博客
	 */
	public String categoryBlog() throws Exception {
		loadBloger();
		articleColl = articleService.searchBlogByUserAndSortName(userId, sortName);
		return "success";
	}
	/**
	 * 进入博主问答页面
	 */
	public String loadPost() throws Exception{
		loadBloger();
		postColl = postService.searchPostByUser(userId);
		replyColl = replyService.searchReplyByUser(userId);
		if (articleColl.size() != 0) {
			article = articleColl.get(0);
		}
		return "success";
	}
	

}
