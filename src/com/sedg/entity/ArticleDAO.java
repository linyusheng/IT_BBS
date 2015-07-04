package com.sedg.entity;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Article entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.sedg.entity.Article
 * @author MyEclipse Persistence Tools
 */

public class ArticleDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ArticleDAO.class);
	// property constants
	public static final String ARTICLE_TITLE = "articleTitle";
	public static final String ARTICLE_TYPE = "articleType";
	public static final String ARTICLE_SORT = "articleSort";
	public static final String ARTICLE_INFO = "articleInfo";
	public static final String ARTICLE_READ_NUM = "articleReadNum";
	public static final String ARTICLE_COMMENT_NUM = "articleCommentNum";
	public static final String ARTICLE_PRAISE_NUM = "articlePraiseNum";
	public static final String ARTICLE_LABEL = "articleLabel";

	protected void initDao() {
		// do nothing
	}

	public void save(Article transientInstance) {
		log.debug("saving Article instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Article persistentInstance) {
		log.debug("deleting Article instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Article findById(java.lang.Integer id) {
		log.debug("getting Article instance with id: " + id);
		try {
			Article instance = (Article) getHibernateTemplate().get(
					"com.sedg.entity.Article", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Article instance) {
		log.debug("finding Article instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Article instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Article as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByArticleTitle(Object articleTitle) {
		return findByProperty(ARTICLE_TITLE, articleTitle);
	}

	public List findByArticleType(Object articleType) {
		return findByProperty(ARTICLE_TYPE, articleType);
	}

	public List findByArticleSort(Object articleSort) {
		return findByProperty(ARTICLE_SORT, articleSort);
	}

	public List findByArticleInfo(Object articleInfo) {
		return findByProperty(ARTICLE_INFO, articleInfo);
	}

	public List findByArticleReadNum(Object articleReadNum) {
		return findByProperty(ARTICLE_READ_NUM, articleReadNum);
	}

	public List findByArticleCommentNum(Object articleCommentNum) {
		return findByProperty(ARTICLE_COMMENT_NUM, articleCommentNum);
	}

	public List findByArticlePraiseNum(Object articlePraiseNum) {
		return findByProperty(ARTICLE_PRAISE_NUM, articlePraiseNum);
	}

	public List findByArticleLabel(Object articleLabel) {
		return findByProperty(ARTICLE_LABEL, articleLabel);
	}

	public List findAll() {
		log.debug("finding all Article instances");
		try {
			String queryString = "from Article";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Article merge(Article detachedInstance) {
		log.debug("merging Article instance");
		try {
			Article result = (Article) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Article instance) {
		log.debug("attaching dirty Article instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Article instance) {
		log.debug("attaching clean Article instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ArticleDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ArticleDAO) ctx.getBean("ArticleDAO");
	}
}