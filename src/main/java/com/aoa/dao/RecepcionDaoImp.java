package com.aoa.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.hibernate.Query;


import com.aoa.models.Recepcion;



@Repository
public class RecepcionDaoImp implements RecepcionDao{
	
	private static final Logger logger = LoggerFactory.getLogger(RecepcionDaoImp.class); 
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	@Override
	public Recepcion getRecepcionById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Recepcion r = (Recepcion) session.load(Recepcion.class, id);
		logger.info("Recepcion loaded, details="+r);
		return r;
	}
	@Override
	public void create(Recepcion r) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(r);
	}

	
	

}
