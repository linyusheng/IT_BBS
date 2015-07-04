package com.sedg.action;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.sedg.service.UserService;
import com.sedg.util.TimeBean;
import com.sedg.entity.User;

import lombok.Getter;
import lombok.Setter;

public class RegisterAction {
	
	@Getter @Setter private UserService userService;
	@Getter @Setter private User user;
	@Getter @Setter private String userName;
	
	/**
	 * 用户注册
	 */
	public String register()throws Exception{
		//判断此用户名是否存在数据库中
		if(!userService.isUserNameExist(user.getUserName())){
			//初始化用户信息
			user.setUserType("普通用户");
			user.setSex("男");
			user.setPhoto("default.gif");
			user.setRank(1);
			user.setItbeanNum(10);
			user.setScore(100);
			user.setUserReadNum(0);
			user.setArticleNumber(0);
			user.setMessageNumber(0);
			user.setRegisterTime(TimeBean.getCurrenTime());
			userService.saveUser(user);
			return "success";
		}
		else{
			return "false";
		}
	}
	/**
	 * Ajax方式验证用户名是否存在数据库中
	 */
	public String isHaveUser() throws Exception{
		//设置ajax传来的中文编码
		userName = java.net.URLDecoder.decode(userName, "UTF-8");
		HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html;charset=UTF-8");
		if(userService.isUserNameExist(userName)){
			response.getWriter().write("true");
			return null;
		}
		response.getWriter().write("false");
		return null;
	}
	/**
	 *	不做任何响应
	 */
	public String doNothing() throws Exception{
		return "success";
	}
}
