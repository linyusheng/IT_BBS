package com.sedg.entity;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for Score
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.sedg.entity.Score
 * @author MyEclipse Persistence Tools
 */

public class ScoreDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ScoreDAO.class);
	// property constants
	public static final String CHANGE_CONTENT = "changeContent";
	public static final String ITBEAN_CHANGE = "itbeanChange";
	public static final String SCORE_CHANGE = "scoreChange";

	protected void initDao() {
		// do nothing
	}

	public void save(Score transientInstance) {
		log.debug("saving Score instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Score persistentInstance) {
		log.debug("deleting Score instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Score findById(java.lang.Integer id) {
		log.debug("getting Score instance with id: " + id);
		try {
			Score instance = (Score) getHibernateTemplate().get(
					"com.sedg.entity.Score", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Score instance) {
		log.debug("finding Score instance by example");
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
		log.debug("finding Score instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Score as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByChangeContent(Object changeContent) {
		return findByProperty(CHANGE_CONTENT, changeContent);
	}

	public List findByItbeanChange(Object itbeanChange) {
		return findByProperty(ITBEAN_CHANGE, itbeanChange);
	}

	public List findByScoreChange(Object scoreChange) {
		return findByProperty(SCORE_CHANGE, scoreChange);
	}

	public List findAll() {
		log.debug("finding all Score instances");
		try {
			String queryString = "from Score";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Score merge(Score detachedInstance) {
		log.debug("merging Score instance");
		try {
			Score result = (Score) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Score instance) {
		log.debug("attaching dirty Score instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Score instance) {
		log.debug("attaching clean Score instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ScoreDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ScoreDAO) ctx.getBean("ScoreDAO");
	}
}