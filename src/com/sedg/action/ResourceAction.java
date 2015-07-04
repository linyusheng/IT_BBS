package com.sedg.action;

import java.io.File;
import java.util.Collection;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.sedg.entity.Resource;
import com.sedg.entity.Score;
import com.sedg.entity.User;
import com.sedg.entity.Download;
import com.sedg.service.DownloadService;
import com.sedg.service.ResourceService;
import com.sedg.service.ScoreService;
import com.sedg.service.UserService;
import com.sedg.util.PageBean;
import com.sedg.util.TimeBean;
import com.sedg.util.Tool;

import lombok.Getter;
import lombok.Setter;

public class ResourceAction {

	@Getter @Setter private ResourceService resourceService;
	@Getter @Setter private UserService userService;
	@Getter @Setter private DownloadService downloadService;
	@Getter @Setter private ScoreService scoreService;
	@Getter @Setter private Resource resource;
	@Getter @Setter private Collection<Resource> resourceColl;
	@Getter @Setter private PageBean pageBean;
	@Getter @Setter private File upload;
	@Getter @Setter private String uploadContentType;
	@Getter @Setter private String uploadFileName;
	@Getter @Setter private String fileName;
	@Getter @Setter private Integer userId;
	@Getter @Setter private Integer id;
	
	/**
	 * 保存上传的学习资源
	 */
	public String saveResource() throws Exception{	
		//判断是否已登录
		Map<String, Object> session = ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			return "fail";
		}
		Integer userId = (Integer)session.get("loginId");
		User user=userService.loadUser(userId);
		//控制文件上传
		String savePath = "E:\\uploadfile";
		setUploadFileName(UUID.randomUUID().toString()+ getUploadFileName());//更改上传文件名为：唯一识别码+上传文件名
		File file = new File(savePath);
		if (!file.exists())
			file.mkdirs();
		FileUtils.copyFile(upload, new File(file, uploadFileName));
		//初始化其他信息
		resource.setUser(user);
		resource.setResourcePath(uploadFileName);
		resource.setDownloadNum(0);
		resource.setDownloadScore(100);
		resource.setUploadTime(TimeBean.getCurrenTime());
		resourceService.saveResource(resource);
		//用户表积分+200，IT豆+4
		user.setScore(user.getScore()+200);
		user.setItbeanNum(user.getItbeanNum()+4);
		userService.saveUser(user);
		//添加一条积分记录
		Score score = new Score();
		score.setUser(user);
		score.setChangeContent("上传资料");
		score.setScoreChange("+200");
		score.setItbeanChange("+4");
		score.setChangeTime(TimeBean.getCurrenTime());
		scoreService.saveScore(score);
		return "success";
	}
	/**
	 * 列出所有资源
	 */
	public String listAllResource() throws Exception {
		if (pageBean == null) {
			pageBean = new PageBean();
		}
		resourceColl = resourceService.listAllResource(pageBean);
		return "success";
	}
	/**
	 * 下载学习资源前提判断
	 */
	public void downloadResource() throws Exception {
		HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html;charset=UTF-8");
		//判断是否已登录
		Map<String, Object> session = ActionContext.getContext().getSession();
		if(!session.containsKey("loginId")){
			response.getWriter().write("fail");
			return;
		}
		Integer userId = (Integer)session.get("loginId");
		User user=userService.loadUser(userId);
		resource = resourceService.loadResource(id);
		//判断用户的IT豆是否足够下载
		if (user.getItbeanNum() < resource.getItBean()) {
			response.getWriter().write("notEnoughItbean");
			return;
		}
		//保存一条下载记录
		Download download = new Download();
		download.setResource(resource);
		download.setUser(user);
		download.setDownloadTime(TimeBean.getCurrenTime());
		downloadService.saveDownload(download);
		//减少用户IT豆数
		user.setScore(user.getScore()+100);
		user.setItbeanNum(user.getItbeanNum()-resource.getItBean());
		userService.saveUser(user);
		//添加一条积分记录
		Score score = new Score();
		score.setUser(user);
		score.setChangeContent("下载资料");
		score.setScoreChange("+100");
		if(resource.getItBean() == 0){
			score.setItbeanChange("0");
		}
		score.setItbeanChange("-"+resource.getItBean());
		score.setChangeTime(TimeBean.getCurrenTime());
		scoreService.saveScore(score);
		response.getWriter().write(fileName);
	}
	/**
	 * 执行下载操作
	 */
	public void download() throws Exception {
		//从服务端存储资源区中下载文件
		String savePath = "E:\\uploadfile";
		String filePath = savePath + "/" + fileName;
		Tool.downlaod(fileName, filePath);
	}
	/**
	 * 删除下载记录
	 */
	public String deleteRecord() {
		downloadService.removeDownload(id);
		return "success";
	}
}







