package com.sedg.entity;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Collect entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.sedg.entity.Collect
 * @author MyEclipse Persistence Tools
 */

public class CollectDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(CollectDAO.class);
	// property constants
	public static final String COLLECT_EXPLAIN = "collectExplain";

	protected void initDao() {
		// do nothing
	}

	public void save(Collect transientInstance) {
		log.debug("saving Collect instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Collect persistentInstance) {
		log.debug("deleting Collect instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Collect findById(java.lang.Integer id) {
		log.debug("getting Collect instance with id: " + id);
		try {
			Collect instance = (Collect) getHibernateTemplate().get(
					"com.sedg.entity.Collect", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Collect instance) {
		log.debug("finding Collect instance by example");
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
		log.debug("finding Collect instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Collect as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCollectExplain(Object collectExplain) {
		return findByProperty(COLLECT_EXPLAIN, collectExplain);
	}

	public List findAll() {
		log.debug("finding all Collect instances");
		try {
			String queryString = "from Collect";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Collect merge(Collect detachedInstance) {
		log.debug("merging Collect instance");
		try {
			Collect result = (Collect) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Collect instance) {
		log.debug("attaching dirty Collect instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Collect instance) {
		log.debug("attaching clean Collect instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CollectDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CollectDAO) ctx.getBean("CollectDAO");
	}
}