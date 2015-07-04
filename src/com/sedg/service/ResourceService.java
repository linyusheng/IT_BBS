package com.sedg.service;

import java.util.List;

import com.sedg.entity.Resource;
import com.sedg.entity.ResourceDAO;
import com.sedg.util.PageBean;
import com.sedg.util.PageService;

import lombok.Getter;
import lombok.Setter;

public class ResourceService {
	
	@Getter @Setter private ResourceDAO resourceDAO;
	
	/**
	 * 根据主键ID查找对象
	 */
	public Resource loadResource(Integer id){
		return resourceDAO.findById(id);
	}
	/**
	 * 执行新增对象或修改对象的保存操作
	 */
	public void saveResource(Resource resource) {
		resourceDAO.merge(resource);
	}
	/**
	 * 根据主键ID删除数据库中对象
	 */
	public void removeResource(Integer id) {
		resourceDAO.delete(resourceDAO.findById(id));
	}
	/**
	 * 列出全部学习资源,并按日期降序排序
	 */
	@SuppressWarnings("unchecked")
	public List<Resource> listAllResource(PageBean page) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Resource as r order by r.uploadTime desc";
		String countHql="select count(*) "+selectHql;
		List<Resource> list=PageService.searchByPage(selectHql, countHql, params, page, resourceDAO);
		return list;
	}
	
}
