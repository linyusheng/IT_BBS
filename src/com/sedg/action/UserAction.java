package com.sedg.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Collection;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import lombok.Getter;
import lombok.Setter;

import com.opensymphony.xwork2.ActionContext;
import com.sedg.entity.Article;
import com.sedg.entity.Collect;
import com.sedg.entity.Comment;
import com.sedg.entity.Download;
import com.sedg.entity.Post;
import com.sedg.entity.Reply;
import com.sedg.entity.Score;
import com.sedg.entity.Sort;
import com.sedg.entity.User;
import com.sedg.service.ArticleService;
import com.sedg.service.CollectService;
import com.sedg.service.CommentService;
import com.sedg.service.DownloadService;
import com.sedg.service.PostService;
import com.sedg.service.ReplyService;
import com.sedg.service.ScoreService;
import com.sedg.service.SortService;
import com.sedg.service.UserService;
import com.sedg.util.PageBean;
import com.sedg.util.Tool;
public class UserAction {
	
	@Getter @Setter private UserService userService;
	@Getter @Setter private ArticleService articleService;
	@Getter @Setter private SortService sortService;
	@Getter @Setter private CollectService collectService;
	@Getter @Setter private CommentService commentService;
	@Getter @Setter private PostService postService;
	@Getter @Setter private ReplyService replyService;
	@Getter @Setter private ScoreService scoreService;
	@Getter @Setter private DownloadService downloadService;
	@Getter @Setter private User user;
	@Getter @Setter private Integer id;
	@Getter @Setter private Article article;
	@Getter @Setter private Integer articleId;
	@Getter @Setter private Collection<Article> articleColl;
	@Getter @Setter private Collection<Sort> sortColl;
	@Getter @Setter private Collection<Collect> collectColl;
	@Getter @Setter private Collection<Comment> commentColl;
	@Getter @Setter private Collection<Post> postColl;
	@Getter @Setter private Collection<Reply> replyColl;
	@Getter @Setter private Collection<Article> searchaArticleColl;
	@Getter @Setter private Collection<Score> scoreColl;
	@Getter @Setter private Collection<Download> downloadColl;
	@Getter @Setter private PageBean pageBean;
	@Getter @Setter private String sortName;
	@Getter @Setter private String titleKey;
	@Getter @Setter private String password;
	@Getter @Setter private String newPassword;
	@Getter @Setter private File upload;
	@Getter @Setter private String uploadFileName;
	
	/**
	 * 加载用户信息
	 */
	public String loadUserMessage() throws Exception{
		//判断是否已登录
		Map<String, Object> session = ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			return "fail";
		}
		id=(Integer)session.get("loginId");
		user=userService.loadUser(id);
		articleColl = articleService.searchBlogByUser(id);
		sortColl = sortService.searchSortByUser(id);
		return "success";
	}
	/**
	 * 进入我的博客页面
	 */
	public String categoriesBlog()throws Exception {
		loadUserMessage();
		articleColl = articleService.searchBlogByUserAndSortName(id, sortName);
		return "success";
	}
	/**
	 * 浏览博客
	 */
	public String readBlog() throws Exception {
		loadUserMessage();
		article = articleService.loadArticle(articleId);
		return "success";
	}
	/**
	 * 进入我的积分页面
	 */
	public String myScore() throws Exception{
		loadUserMessage();
		scoreColl = scoreService.searchScoreByUser(id);
		return "success";
	}
	/**
	 * 进入我的问答页面
	 */
	public String myPost() throws Exception{
		loadUserMessage();
		postColl = postService.searchPostByUser(id);
		replyColl = replyService.searchReplyByUser(id);
		return "success";
	}
	/**
	 * 进入我的评论页面
	 */
	public String myComment() throws Exception{
		loadUserMessage();
		commentColl = commentService.searchCommentByUser(id);
		return "success";
	}
	/**
	 * 进入我的收藏页面
	 */
	public String myCollect() throws Exception{
		loadUserMessage();
		collectColl = collectService.searchCollectByUser(id);
		return "success";
	}
	/**
	 * 进入我的资源页面
	 */
	public String myDownload() throws Exception{
		loadUserMessage();
		if (pageBean == null) {
			pageBean = new PageBean();
		}
		downloadColl = downloadService.searchDownloadByUser(pageBean,id);
		return "success";
	}
	/**
	 * 进入上传学习资料页面
	 */
	public String uploadResources() throws Exception{
		loadUserMessage();
		return "success";
	}
	/**
	 * 根据标题关键字搜索博客
	 */
	public String searchBlog() throws Exception {
		loadUserMessage();
		searchaArticleColl = articleService.searchUserBlogByTitleKey(id,titleKey);
		return "success";
	}
	/**
	 * 下载用户头像
	 */
	@SuppressWarnings("unchecked")
	public String downloadUserPhoto() throws Exception {
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		String fileName = (String)session.get("loginPhoto");
		String filePath = com.sedg.util.Tool.getWebRootPath() + "images\\userPhoto\\" + fileName;
		com.sedg.util.Tool.downlaod(fileName, filePath);
		return "";
	}
	/**
	 * 保存基本信息
	 */
	public String saveInfo() throws Exception {
		updatePhoto();
		userService.saveUser(user);
		updateSession();
		return "success";
	}
	/**
	 * 保存用户密码
	 */
	@SuppressWarnings("unchecked")
	public String savePassword() throws Exception{
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			return "fail";
		}
		Integer id=(Integer)session.get("loginId");
		if(userService.savePassword(id, password, newPassword).equals("success")){
			return "success";
		}
		return "fail";
	}
	/**
	 * ajax验证原密码是否正确
	 */
	@SuppressWarnings("unchecked")
	public String passwordValidate() throws Exception{
		HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html;charset=UTF-8");
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			return "fail";
		}
		Integer id=(Integer)session.get("loginId");
		if(userService.passwordValidate(id, password) == null){
			response.getWriter().write("false");
			return null;
		}
		response.getWriter().write("true");
		return null;
	}
	/**
	 * 更新Session
	 */
	@SuppressWarnings("unchecked")
	private void updateSession() throws Exception{
		Map<String,Object> session=(Map)ActionContext.getContext().getSession();
		session.put("user", user);
		session.put("loginId", user.getUserId());
		session.put("loginName", user.getUserName());
		session.put("loginPhoto", user.getPhoto());
	}
	/**
	 * 更新用户上传的头像
	 */
	public void updatePhoto() throws Exception {
		//控制文件上传
		if(getUpload() != null){	//修改用户信息时，选择了图片上传功能
			setUploadFileName(UUID.randomUUID().toString()+ getUploadFileName());	//更改上传文件名为：用户名+上传文件名
			FileOutputStream fos = new FileOutputStream(Tool.getWebRootPath() + "images\\userPhoto\\" + getUploadFileName());
			FileInputStream fis = new FileInputStream(getUpload());
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer))>0){
				fos.write(buffer, 0, len);
			}
			user.setPhoto(getUploadFileName());
		}
		else ;	//不选择图片上传功能则不修改图片
	}

}
