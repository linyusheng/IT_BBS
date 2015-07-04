package com.sedg.service;

import java.util.List;

import com.sedg.entity.Sort;
import com.sedg.entity.SortDAO;
import com.sedg.util.PageService;

import lombok.Getter;
import lombok.Setter;

public class SortService {
	
	@Getter @Setter private SortDAO sortDAO;
	
	/**
	 * 根据主键ID查找对象
	 */
	public Sort loadSort(Integer id){
		return sortDAO.findById(id);
	}
	/**
	 * 执行新增对象或修改对象的保存操作
	 */
	public void saveSort(Sort sort) {
		sortDAO.merge(sort);
	}
	/**
	 * 根据主键ID删除数据库中对象
	 */
	public void removeSort(Integer id) {
		sortDAO.delete(sortDAO.findById(id));
	}
	/**
	 * 查找用户的博客分类
	 */
	@SuppressWarnings("unchecked")
	public List<Sort> searchSortByUser(Integer userId) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Sort as s where s.user.userId = '" + userId + "'";
		String countHql="select count(*) "+selectHql;
		List<Sort> list=PageService.searchByPage(selectHql, countHql, params, null, sortDAO);
		return list;
	}
	/**
	 * 根据分类名称查找博客分类
	 */
	@SuppressWarnings("unchecked")
	public List<Sort> searchSortBySortName(Integer userId,String sortName) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Sort as s where s.user.userId = '" + userId + "' and s.sortName = '" + sortName + "'";
		String countHql="select count(*) "+selectHql;
		List<Sort> list=PageService.searchByPage(selectHql, countHql, params, null, sortDAO);
		return list;
	}
}
