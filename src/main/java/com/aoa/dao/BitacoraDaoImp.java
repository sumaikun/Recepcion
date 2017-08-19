package com.aoa.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.aoa.models.Bitacora;

@Repository
public class BitacoraDaoImp implements BitacoraDao {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImp.class); 
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@Override
	public void create(Bitacora b) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(b);
	}
	
	
	

}
