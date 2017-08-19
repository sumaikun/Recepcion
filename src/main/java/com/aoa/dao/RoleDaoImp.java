package com.aoa.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.aoa.models.Role;

@Repository
public class RoleDaoImp implements RoleDao {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImp.class); 
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Role> listroles() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Role> roleList = session.createQuery("from Role").list();		
		for(Role r : roleList ){
			System.out.println("entra "+r);
			logger.info("Role List :"+r);
		}
		return roleList ;
	}
	
	

}
