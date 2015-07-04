package com.sedg.service;

import java.sql.Timestamp;
import java.util.List;

import com.sedg.entity.Article;
import com.sedg.entity.ArticleDAO;
import com.sedg.util.PageBean;
import com.sedg.util.PageService;

import lombok.Getter;
import lombok.Setter;

public class ArticleService {
	
	@Getter @Setter private ArticleDAO articleDAO;
	
	/**
	 * 根据主键ID查找对象
	 */
	public Article loadArticle(Integer id){
		return articleDAO.findById(id);
	}
	/**
	 * 执行新增对象保存操作
	 */
	public void saveArticle(Article article) {
		articleDAO.save(article);
	}
	/**
	 * 根据主键ID修改对象
	 */
	public void updateArticle(Article article) {
		articleDAO.merge(article);
	}
	/**
	 * 根据主键ID删除数据库中对象
	 */
	public void removeArticle(Integer id) {
		articleDAO.delete(articleDAO.findById(id));
	}
	/**
	 * 根据用户发表的时间查找博文
	 */
	@SuppressWarnings("unchecked")
	public Article searchBlogByTitle(Integer userId,Timestamp writeTime) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Article as a where a.user.userId = '" + userId + "' and a.writeTime = '"+writeTime+"'";
		String countHql="select count(*) "+selectHql;
		List<Article> list=PageService.searchByPage(selectHql, countHql, params, null, articleDAO);
		return list.get(0);
	}
	/**
	 * 根据用户ID查找博文
	 */
	@SuppressWarnings("unchecked")
	public List<Article> searchBlogByUser(Integer userId) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Article as a where a.user.userId = '" + userId + "' order by a.writeTime desc";
		String countHql="select count(*) "+selectHql;
		List<Article> list=PageService.searchByPage(selectHql, countHql, params, null, articleDAO);
		return list;
	}
	/**
	 * 根据用户ID和分类名查找博文
	 */
	@SuppressWarnings("unchecked")
	public List<Article> searchBlogByUserAndSortName(Integer userId,String sortName) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Article as a where a.user.userId = '" + userId + "' and a.articleSort = '" + sortName + "' order by a.writeTime desc";
		String countHql="select count(*) "+selectHql;
		List<Article> list=PageService.searchByPage(selectHql, countHql, params, null, articleDAO);
		return list;
	}
	/**
	 * 根据标题关键字查找博文
	 */
	@SuppressWarnings("unchecked")
	public List<Article> searchBlogByTitleKey(String keyWord,PageBean page) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Article as a where a.articleTitle like '%" + keyWord + "%' order by a.writeTime desc";
		String countHql="select count(*) "+selectHql;
		List<Article> list=PageService.searchByPage(selectHql, countHql, params, page, articleDAO);
		return list;
	}
	/**
	 * 根据标题关键字查找用户的博文
	 */
	@SuppressWarnings("unchecked")
	public List<Article> searchUserBlogByTitleKey(Integer userId,String keyWord) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Article as a where a.user.userId = '" + userId + "' and a.articleTitle like '%" + keyWord + "%' order by a.writeTime desc";
		String countHql="select count(*) "+selectHql;
		List<Article> list=PageService.searchByPage(selectHql, countHql, params, null, articleDAO);
		return list;
	}
	/**
	 * 根据博客类型名查找博文
	 */
	@SuppressWarnings("unchecked")
	public List<Article> searchBlogByType(String articleType,PageBean page) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Article as a where a.articleType = '" + articleType + "' order by a.writeTime desc";
		String countHql="select count(*) "+selectHql;
		List<Article> list=PageService.searchByPage(selectHql, countHql, params, page, articleDAO);
		return list;
	}
	/**
	 * 列出博客,并按日期降序排序
	 */
	@SuppressWarnings("unchecked")
	public List<Article> listBlog(PageBean page) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Article as a order by a.writeTime desc";
		String countHql="select count(*) "+selectHql;
		List<Article> list=PageService.searchByPage(selectHql, countHql, params, page, articleDAO);
		return list;
	}
	/**
	 * 按博客浏览量从高到底排序
	 */
	@SuppressWarnings("unchecked")
	public List<Article> searchArticleByReadNum(PageBean page) {
		Object[] params=null;
		String selectHql=null;
		selectHql="from Article as a order by a.articleReadNum desc";
		String countHql="select count(*) "+selectHql;
		List<Article> list=PageService.searchByPage(selectHql, countHql, params, page, articleDAO);
		return list;
	}
	
}
