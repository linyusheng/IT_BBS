package com.sedg.service;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

import com.sedg.entity.UserDAO;
import com.sedg.entity.User;
import com.sedg.util.PageBean;
import com.sedg.util.PageService;

public class UserService {
	
	@Getter @Setter private UserDAO userDAO;
	
	/**
	 * 根据主键ID查找对象
	 */
	public User loadUser(Integer id){
		return userDAO.findById(id);
	}
	/**
	 * 执行新增对象或修改对象的保存操作
	 */
	public void saveUser(User user) {
		userDAO.merge(user);
	}
	/**
	 * 根据主键ID删除数据库中对象
	 */
	public void removeUser(Integer id) {
		userDAO.delete(userDAO.findById(id));
	}
	/**
	 * 是否存在此用户,存在返回true,不存在返回false
	 */
	@SuppressWarnings("unchecked")
	public boolean isUserNameExist(String userName){
		Object[] params = null;
		String selectHql ="from User as u where u.userName='"+userName+"'";
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
		List<User> userList = PageService.searchByPage(selectHql, countHql, params, null, userDAO);
		if(userList.isEmpty()){
			return false;
		}
		else return true;
	}
	/**
	 * 用户登录验证
	 */
	@SuppressWarnings("unchecked")
	public User login(String userName,String password){
		Object[] params = null;
		String selectHql ="from User as u where u.userName='"+userName+"' and u.password='"+password+"'";
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
		List<User> userList = PageService.searchByPage(selectHql, countHql, params, null, userDAO);
		if(userList.isEmpty()){
			return null;
		}
		else return userList.get(0);
	}
	/**
	 * 用户旧密码验证
	 */
	@SuppressWarnings("unchecked")
	public User passwordValidate(Integer id,String password){
		Object[] params = null;
		String selectHql ="from User as u where u.userId='"+id+"' and u.password='"+password+"'";
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
		List<User> userList = PageService.searchByPage(selectHql, countHql, params, null, userDAO);
		if(userList.isEmpty()){
			return null;
		}
		else return userList.get(0);
	}
	/**
	 * 按条件查询和分页支持
	 * 
	 * 根据用户名执行模糊匹配查找，通过Page对象执行分页。
	 * 
	 * @userName：会员登录账号
	 * 
	 * @page:分页对象
	 * 
	 */
	@SuppressWarnings("unchecked")
	public List<User> searchUser(String userName, PageBean page) {
		Object[] params = null;
		
		//创建HQL查询语句
		String selectHql = null;
		if((userName == null) || (userName.equals(""))) {
			selectHql = "from User";
		} else {
			selectHql = "from User where userName like '%" + userName + "%'";
		}
		
		//创建获取HQL返回记录总行数语句
		String countHql = "select count(*) " + selectHql;
		
		//执行按条件查询和分页支持
		List<User> userList = PageService.searchByPage(selectHql, countHql, params, page, userDAO);
		return userList;
	}
	/**
	 * 根据用户名查找用户
	 */
	@SuppressWarnings("unchecked")
	public List<User> searchUserByUserName(String userName){
		Object[] params=null;
		String selectHql=null;
		selectHql="from User as u where u.userName = '"+userName+"'";
		String countHql="select count(*) "+selectHql;
		List<User> userList=PageService.searchByPage(selectHql, countHql, params, null, userDAO);
		return userList;
	}
	/**
	 * 保存用户密码
	 */
	public String savePassword(Integer id,String oldPassword,String newPassword){
		User user=userDAO.findById(id);
		if(user.getPassword().equals(oldPassword)){
			user.setPassword(newPassword);
			userDAO.merge(user);
			return "success";
		}
		else{
			return "fail";
		}
	}
	/**
	 * 根据积分的高低对用户进行排序
	 */
	@SuppressWarnings("unchecked")
	public List<User> sortUserByScore(PageBean page) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from User as u order by u.score desc";
		String countHql="select count(*) "+selectHql;
		List<User> list=PageService.searchByPage(selectHql, countHql, params, page, userDAO);
		return list;
	}
}
