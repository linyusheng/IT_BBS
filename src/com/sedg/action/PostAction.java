package com.sedg.action;

import java.util.Collection;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.sedg.entity.Post;
import com.sedg.entity.Reply;
import com.sedg.entity.User;
import com.sedg.service.PostService;
import com.sedg.service.ReplyService;
import com.sedg.service.UserService;
import com.sedg.util.Tool;
import com.sedg.util.PageBean;
import com.sedg.util.TimeBean;

import lombok.Getter;
import lombok.Setter;

public class PostAction {
	
	@Getter @Setter private PostService postService;
	@Getter @Setter private UserService userService;
	@Getter @Setter private ReplyService replyService;
	@Getter @Setter private Collection<Post> postColl;
	@Getter @Setter private Collection<Reply> replyColl;
	@Getter @Setter private Collection<Reply> newReplyColl;
	@Getter @Setter private Integer id;
	@Getter @Setter private Post post;
	@Getter @Setter private Integer[] postNum = {0,0,0};
	@Getter @Setter private PageBean pageBean;
	@Getter @Setter private String hostPhoto;
	@Getter @Setter private String keyword;
	
	/**
	 * 统计三个问题的总量和最新评论
	 */
	public void publicLoad() throws Exception{
		postNum[0] = postService.listActivePost(null).size();
		postNum[1] = postService.listSolvedPost(null).size();
		postNum[2] = postService.listHotPost(null).size();
		PageBean page = new PageBean();
		page.setPageSize(10);
		newReplyColl = replyService.listReply(page);
	}
	/**
	 * 进入热门问题页
	 */
	public String hotPost() throws Exception {
		publicLoad();
		if(pageBean == null){
			pageBean = new PageBean();
		}
		postColl = postService.listHotPost(pageBean);
		return "success";
	}
	/**
	 * 进入待解决问题页
	 */
	public String activePost() throws Exception {
		publicLoad();
		if(pageBean == null){
			pageBean = new PageBean();
		}
		postColl = postService.listActivePost(pageBean);
		return "success";
	}
	/**
	 * 进入已解决问题页
	 */
	public String solvedPost() throws Exception {
		publicLoad();
		if(pageBean == null){
			pageBean = new PageBean();
		}
		postColl = postService.listSolvedPost(pageBean);
		return "success";
	}
	/**
	 * 显示问题
	 */
	public String showPost() throws Exception{
		publicLoad();
		replyColl = replyService.searchReplyByPost(id);
		post = postService.loadPost(id);
		return "success";
	}
	/**
	 * 根据标题关键字模糊查找问题
	 */
	public String findPost() throws Exception {
		publicLoad();
		if(pageBean == null){
			pageBean = new PageBean();
		}
		postColl = postService.searchPostByTitleKey(keyword, pageBean);
		return "success";
	}
	/**
	 * 下载博主头像
	 */
	public String downloadPostPhoto()throws Exception {
		String filePath = Tool.getWebRootPath() + "images\\userPhoto\\" + hostPhoto;
		com.sedg.util.Tool.downlaod(hostPhoto, filePath);
		return "";
	}
	/**
	 * 进入我要提问页
	 */
	public String enterAsk() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			return "fail";
		}
		return "success";
	}
	/**
	 * 保存问题
	 */
	public String savePost() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			return "fail";
		}
		Integer userId = (Integer)session.get("loginId");
		User user = userService.loadUser(userId);
		post.setUser(user);
		post.setAnswerNum(0);
		post.setPostPraiseNum(0);
		post.setPostReadNum(0);
		post.setPostTime(TimeBean.getCurrenTime());
		postService.savePost(post);
		return "success";
	}
	
	
}
