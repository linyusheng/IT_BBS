package com.sedg.service;

import java.util.List;

import com.sedg.entity.Comment;
import com.sedg.entity.CommentDAO;
import com.sedg.util.PageService;

import lombok.Getter;
import lombok.Setter;


public class CommentService {
	
	@Getter @Setter private CommentDAO commentDAO;
	
	/**
	 * 根据主键ID查找对象
	 */
	public Comment loadComment(Integer id){
		return commentDAO.findById(id);
	}
	/**
	 * 执行新增对象或修改对象的保存操作
	 */
	public void saveComment(Comment comment) {
		commentDAO.merge(comment);
	}
	/**
	 * 根据主键ID删除数据库中对象
	 */
	public void removeComment(Integer id) {
		commentDAO.delete(commentDAO.findById(id));
	}
	/**
	 * 根据博客ID查找评论
	 */
	@SuppressWarnings("unchecked")
	public List<Comment> searchCommentByArticle(Integer articleId) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Comment as c where c.article.articleId = '" + articleId + "' order by c.commentTime desc";
		String countHql="select count(*) "+selectHql;
		List<Comment> list=PageService.searchByPage(selectHql, countHql, params, null, commentDAO);
		return list;
	}
	/**
	 * 根据用户ID查找评论
	 */
	@SuppressWarnings("unchecked")
	public List<Comment> searchCommentByUser(Integer userId) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Comment as c where c.user.userId = '" + userId + "' order by c.commentTime desc";
		String countHql="select count(*) "+selectHql;
		List<Comment> list=PageService.searchByPage(selectHql, countHql, params, null, commentDAO);
		return list;
	}
}
