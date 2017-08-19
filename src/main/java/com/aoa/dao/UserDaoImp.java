package com.aoa.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.aoa.models.User;

@Repository
public class UserDaoImp implements UserDao{

	
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImp.class); 
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@Override
	public void create(User u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(u);
		logger.info("User saved successfully, details="+u);
	}

	@Override
	public void update(User u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(u);
		logger.info("User updated successfully, details="+u);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUsers() {
		Session session = this.sessionFactory.getCurrentSession();
		List<User> userList = session.createQuery("from User").list();
		for(User u : userList){
			logger.info("User List :"+u);
		}
		return userList;
	}

	@Override
	public void destroy(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		User u = (User) session.load(User.class, id);
		if(u != null){
			session.delete(u);
		}
		logger.info("User deleted successfully, details="+u);
	}

	@Override
	public User getUserById(int id) {;
		Session session = this.sessionFactory.getCurrentSession();
		User u = (User) session.load(User.class, id);
		logger.info("User loaded, details="+u);
		return u;
	}

	
	@Override
	public User LogginIn(String name) {
		User us = null;
		try {
			Session session;
			try {
				 session = this.sessionFactory.getCurrentSession();
			} catch (HibernateException e) {
				 session = this.sessionFactory.openSession();
			}			
			String squery = "from User where email = :emailParam";
			Query query = session.createQuery(squery);
			query.setParameter("emailParam", name);			
			if(!query.list().isEmpty())
			{
				us = (User) query.list().get(0);
			}
		}catch(Exception e){
			throw e;
		}
		
		return us;		
	}  
	
	

}
