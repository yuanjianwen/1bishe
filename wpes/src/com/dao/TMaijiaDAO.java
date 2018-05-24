package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TMaijia;

/**
 * A data access object (DAO) providing persistence and search support for
 * TMaijia entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.model.TMaijia
 * @author MyEclipse Persistence Tools
 */

public class TMaijiaDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TMaijiaDAO.class);
	// property constants
	public static final String LOGINNAME = "loginname";
	public static final String LOGINPW = "loginpw";
	public static final String XINGMING = "xingming";
	public static final String XINGBIE = "xingbie";
	public static final String DIANHUA = "dianhua";
	public static final String ZHUZHI = "zhuzhi";
	public static final String TAI = "tai";
	public static final String DEL = "del";

	protected void initDao() {
		// do nothing
	}

	public void save(TMaijia transientInstance) {
		log.debug("saving TMaijia instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TMaijia persistentInstance) {
		log.debug("deleting TMaijia instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TMaijia findById(java.lang.Integer id) {
		log.debug("getting TMaijia instance with id: " + id);
		try {
			TMaijia instance = (TMaijia) getHibernateTemplate().get(
					"com.model.TMaijia", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TMaijia instance) {
		log.debug("finding TMaijia instance by example");
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
		log.debug("finding TMaijia instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TMaijia as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByLoginname(Object loginname) {
		return findByProperty(LOGINNAME, loginname);
	}

	public List findByLoginpw(Object loginpw) {
		return findByProperty(LOGINPW, loginpw);
	}

	public List findByXingming(Object xingming) {
		return findByProperty(XINGMING, xingming);
	}

	public List findByXingbie(Object xingbie) {
		return findByProperty(XINGBIE, xingbie);
	}

	public List findByDianhua(Object dianhua) {
		return findByProperty(DIANHUA, dianhua);
	}

	public List findByZhuzhi(Object zhuzhi) {
		return findByProperty(ZHUZHI, zhuzhi);
	}

	public List findByTai(Object tai) {
		return findByProperty(TAI, tai);
	}

	public List findByDel(Object del) {
		return findByProperty(DEL, del);
	}

	public List findAll() {
		log.debug("finding all TMaijia instances");
		try {
			String queryString = "from TMaijia";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TMaijia merge(TMaijia detachedInstance) {
		log.debug("merging TMaijia instance");
		try {
			TMaijia result = (TMaijia) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TMaijia instance) {
		log.debug("attaching dirty TMaijia instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TMaijia instance) {
		log.debug("attaching clean TMaijia instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TMaijiaDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TMaijiaDAO) ctx.getBean("TMaijiaDAO");
	}
}