package com.sedg.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for User
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.sedg.entity.User
 * @author MyEclipse Persistence Tools
 */

public class UserDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
	// property constants
	public static final String USER_NAME = "userName";
	public static final String PASSWORD = "password";
	public static final String USER_TYPE = "userType";
	public static final String SEX = "sex";
	public static final String PHOTO = "photo";
	public static final String NICK_NAME = "nickName";
	public static final String ADDRESS = "address";
	public static final String EMAIL = "email";
	public static final String RANK = "rank";
	public static final String SCORE = "score";
	public static final String USER_READ_NUM = "userReadNum";
	public static final String ITBEAN_NUM = "itbeanNum";
	public static final String ARTICLE_NUMBER = "articleNumber";
	public static final String MESSAGE_NUMBER = "messageNumber";
	public static final String SIGNATURE = "signature";
	public static final String QQ = "qq";
	public static final String HOBBY = "hobby";
	public static final String POSITION = "position";
	public static final String INDUSTRY = "industry";
	public static final String WORK_AGE = "workAge";
	public static final String INCOME = "income";
	public static final String INTRODUCTION = "introduction";
	public static final String MARITAL_STATUS = "maritalStatus";

	protected void initDao() {
		// do nothing
	}

	public void save(User transientInstance) {
		log.debug("saving User instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(User persistentInstance) {
		log.debug("deleting User instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public User findById(java.lang.Integer id) {
		log.debug("getting User instance with id: " + id);
		try {
			User instance = (User) getHibernateTemplate().get(
					"com.sedg.entity.User", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(User instance) {
		log.debug("finding User instance by example");
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
		log.debug("finding User instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from User as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserName(Object userName) {
		return findByProperty(USER_NAME, userName);
	}

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List findByUserType(Object userType) {
		return findByProperty(USER_TYPE, userType);
	}

	public List findBySex(Object sex) {
		return findByProperty(SEX, sex);
	}

	public List findByPhoto(Object photo) {
		return findByProperty(PHOTO, photo);
	}

	public List findByNickName(Object nickName) {
		return findByProperty(NICK_NAME, nickName);
	}

	public List findByAddress(Object address) {
		return findByProperty(ADDRESS, address);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByRank(Object rank) {
		return findByProperty(RANK, rank);
	}

	public List findByScore(Object score) {
		return findByProperty(SCORE, score);
	}

	public List findByUserReadNum(Object userReadNum) {
		return findByProperty(USER_READ_NUM, userReadNum);
	}

	public List findByItbeanNum(Object itbeanNum) {
		return findByProperty(ITBEAN_NUM, itbeanNum);
	}

	public List findByArticleNumber(Object articleNumber) {
		return findByProperty(ARTICLE_NUMBER, articleNumber);
	}

	public List findByMessageNumber(Object messageNumber) {
		return findByProperty(MESSAGE_NUMBER, messageNumber);
	}

	public List findBySignature(Object signature) {
		return findByProperty(SIGNATURE, signature);
	}

	public List findByQq(Object qq) {
		return findByProperty(QQ, qq);
	}

	public List findByHobby(Object hobby) {
		return findByProperty(HOBBY, hobby);
	}

	public List findByPosition(Object position) {
		return findByProperty(POSITION, position);
	}

	public List findByIndustry(Object industry) {
		return findByProperty(INDUSTRY, industry);
	}

	public List findByWorkAge(Object workAge) {
		return findByProperty(WORK_AGE, workAge);
	}

	public List findByIncome(Object income) {
		return findByProperty(INCOME, income);
	}

	public List findByIntroduction(Object introduction) {
		return findByProperty(INTRODUCTION, introduction);
	}

	public List findByMaritalStatus(Object maritalStatus) {
		return findByProperty(MARITAL_STATUS, maritalStatus);
	}

	public List findAll() {
		log.debug("finding all User instances");
		try {
			String queryString = "from User";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public User merge(User detachedInstance) {
		log.debug("merging User instance");
		try {
			User result = (User) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(User instance) {
		log.debug("attaching dirty User instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(User instance) {
		log.debug("attaching clean User instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static UserDAO getFromApplicationContext(ApplicationContext ctx) {
		return (UserDAO) ctx.getBean("UserDAO");
	}
}