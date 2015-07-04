package com.sedg.service;

import java.util.List;

import com.sedg.entity.Post;
import com.sedg.entity.PostDAO;
import com.sedg.util.PageBean;
import com.sedg.util.PageService;

import lombok.Getter;
import lombok.Setter;


public class PostService {
	
	@Getter @Setter private PostDAO postDAO;
	
	/**
	 * 根据主键ID查找对象
	 */
	public Post loadPost(Integer id){
		return postDAO.findById(id);
	}
	/**
	 * 执行新增对象或修改对象的保存操作
	 */
	public void savePost(Post post) {
		postDAO.merge(post);
	}
	/**
	 * 根据主键ID删除数据库中对象
	 */
	public void removePost(Integer id) {
		postDAO.delete(postDAO.findById(id));
	}
	/**
	 * 列出热门问题,并按日期降序排序
	 */
	@SuppressWarnings("unchecked")
	public List<Post> listHotPost(PageBean page) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Post as p order by p.postTime desc";
		String countHql="select count(*) "+selectHql;
		List<Post> list=PageService.searchByPage(selectHql, countHql, params, page, postDAO);
		return list;
	}
	/**
	 * 列出待解决问题,并按日期降序排序
	 */
	@SuppressWarnings("unchecked")
	public List<Post> listActivePost(PageBean page) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Post as p where p.postStatus = null order by p.postTime desc";
		String countHql="select count(*) "+selectHql;
		List<Post> list=PageService.searchByPage(selectHql, countHql, params, page, postDAO);
		return list;
	}
	/**
	 * 列出已解决问题,并按日期降序排序
	 */
	@SuppressWarnings("unchecked")
	public List<Post> listSolvedPost(PageBean page) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Post as p where p.postStatus = '已解决' order by p.postTime desc";
		String countHql="select count(*) "+selectHql;
		List<Post> list=PageService.searchByPage(selectHql, countHql, params, page, postDAO);
		return list;
	}
	/**
	 * 根据用户ID查找问题
	 */
	@SuppressWarnings("unchecked")
	public List<Post> searchPostByUser(Integer userId) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Post as p where p.user.userId = '" + userId + "' order by p.postTime desc";
		String countHql="select count(*) "+selectHql;
		List<Post> list=PageService.searchByPage(selectHql, countHql, params, null, postDAO);
		return list;
	}
	/**
	 * 根据标题关键字查找博文
	 */
	@SuppressWarnings("unchecked")
	public List<Post> searchPostByTitleKey(String keyWord,PageBean page) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Post as p where p.postName like '%" + keyWord + "%' order by p.postTime desc";
		String countHql="select count(*) "+selectHql;
		List<Post> list=PageService.searchByPage(selectHql, countHql, params, page, postDAO);
		return list;
	}
}
