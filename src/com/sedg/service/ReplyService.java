package com.sedg.service;

import java.util.List;

import com.sedg.entity.Reply;
import com.sedg.entity.ReplyDAO;
import com.sedg.util.PageBean;
import com.sedg.util.PageService;

import lombok.Getter;
import lombok.Setter;

public class ReplyService {
	
	@Getter @Setter private ReplyDAO replyDAO;
	
	/**
	 * 根据主键ID查找对象
	 */
	public Reply loadReply(Integer id){
		return replyDAO.findById(id);
	}
	/**
	 * 执行新增对象或修改对象的保存操作
	 */
	public void saveReply(Reply reply) {
		replyDAO.merge(reply);
	}
	/**
	 * 根据主键ID删除数据库中对象
	 */
	public void removeReply(Integer id) {
		replyDAO.delete(replyDAO.findById(id));
	}
	/**
	 * 根据问题ID查找回复
	 */
	@SuppressWarnings("unchecked")
	public List<Reply> searchReplyByPost(Integer postId) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Reply as r where r.post.postId = '" + postId + "' order by r.replyTime desc";
		String countHql="select count(*) "+selectHql;
		List<Reply> list=PageService.searchByPage(selectHql, countHql, params, null, replyDAO);
		return list;
	}
	/**
	 * 根据用户ID查找回复
	 */
	@SuppressWarnings("unchecked")
	public List<Reply> searchReplyByUser(Integer userId) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Reply as r where r.user.userId = '" + userId + "' order by r.replyTime desc";
		String countHql="select count(*) "+selectHql;
		List<Reply> list=PageService.searchByPage(selectHql, countHql, params, null, replyDAO);
		return list;
	}
	/**
	 * 列出回复,并按日期降序排序
	 */
	@SuppressWarnings("unchecked")
	public List<Reply> listReply(PageBean page) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Reply as r order by r.replyTime desc";
		String countHql="select count(*) "+selectHql;
		List<Reply> list=PageService.searchByPage(selectHql, countHql, params, page, replyDAO);
		return list;
	}
}
