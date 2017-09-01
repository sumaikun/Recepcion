package com.aoa.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.aoa.models.Autorizacion;


@Repository
public class AutorizacionDaoImp implements AutorizacionDao {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImp.class); 
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@Override
	public void create(Autorizacion a) {
		// TODO Auto-generated method stub
		
	}
	


	
	

}
