package com.sedg.service;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

import com.sedg.entity.Collect;
import com.sedg.entity.CollectDAO;
import com.sedg.util.PageService;

public class CollectService {
	
	@Getter @Setter private CollectDAO collectDAO;
	
	/**
	 * 根据主键ID查找对象
	 */
	public Collect loadCollect(Integer id){
		return collectDAO.findById(id);
	}
	/**
	 * 执行新增对象或修改对象的保存操作
	 */
	public void saveCollect(Collect collect) {
		collectDAO.merge(collect);
	}
	/**
	 * 根据主键ID删除数据库中对象
	 */
	public void removeCollect(Integer id) {
		collectDAO.delete(collectDAO.findById(id));
	}
	/**
	 * 根据用户ID查找收藏
	 */
	@SuppressWarnings("unchecked")
	public List<Collect> searchCollectByUser(Integer userId) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Collect as c where c.user.userId = '" + userId + "' order by c.collectTime desc";
		String countHql="select count(*) "+selectHql;
		List<Collect> list=PageService.searchByPage(selectHql, countHql, params, null, collectDAO);
		return list;
	}
	/**
	 * 根据博客ID查找收藏
	 */
	@SuppressWarnings("unchecked")
	public List<Collect> searchCollectByArticle(Integer articleId) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Collect as c where c.article.articleId = '" + articleId + "' order by c.collectTime desc";
		String countHql="select count(*) "+selectHql;
		List<Collect> list=PageService.searchByPage(selectHql, countHql, params, null, collectDAO);
		return list;
	}

	/**
	 * 根据用户ID和博客ID查找收藏
	 */
	@SuppressWarnings("unchecked")
	public List<Collect> searchCollectByUserAndArticle(Integer userId,Integer articleId) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Collect as c where c.user.userId = '" + userId + "' and c.article.articleId = '" + articleId + "'";
		String countHql="select count(*) "+selectHql;
		List<Collect> list=PageService.searchByPage(selectHql, countHql, params, null, collectDAO);
		return list;
	}
}
