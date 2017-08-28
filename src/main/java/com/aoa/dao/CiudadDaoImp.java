package com.aoa.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.hibernate.Query;

import com.aoa.models.Ciudad;

@Repository
public class CiudadDaoImp implements CiudadDao{
	
	private static final Logger logger = LoggerFactory.getLogger(ClientDaoImp.class); 
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public List<Ciudad> listciudades() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Ciudad> listdepartamentos() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Ciudad> listdepartamentos = session.createQuery("select distinct departamento from Ciudad")
		.list();
		return listdepartamentos;
	}
	
	
	

}
