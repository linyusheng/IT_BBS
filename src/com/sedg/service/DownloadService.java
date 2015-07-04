package com.sedg.service;

import java.util.List;

import com.sedg.entity.Download;
import com.sedg.entity.DownloadDAO;
import com.sedg.util.PageBean;
import com.sedg.util.PageService;

import lombok.Getter;
import lombok.Setter;

public class DownloadService {
	
	@Getter @Setter private DownloadDAO downloadDAO;
	
	/**
	 * 根据主键ID查找对象
	 */
	public Download loadDownload(Integer id){
		return downloadDAO.findById(id);
	}
	/**
	 * 执行新增对象或修改对象的保存操作
	 */
	public void saveDownload(Download download) {
		downloadDAO.merge(download);
	}
	/**
	 * 根据主键ID删除数据库中对象
	 */
	public void removeDownload(Integer id) {
		downloadDAO.delete(downloadDAO.findById(id));
	}
	/**
	 * 根据用户ID查找下载记录
	 */
	@SuppressWarnings("unchecked")
	public List<Download> searchDownloadByUser(PageBean page,Integer userId) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Download as d where d.user.userId = '" + userId + "' order by d.downloadTime desc";
		String countHql="select count(*) "+selectHql;
		List<Download> list=PageService.searchByPage(selectHql, countHql, params, page, downloadDAO);
		return list;
	}
}
