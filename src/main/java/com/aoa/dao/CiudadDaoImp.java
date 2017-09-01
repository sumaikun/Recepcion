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
	public List<Ciudad> listciudades(String departamento) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Ciudad> listciudades = session.createQuery(" from Ciudad where departamento = :depar order by nombre")
		.setParameter("depar", departamento)
		.list();
		return listciudades;
	}

	@Override
	public List<Ciudad> listdepartamentos() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Ciudad> listdepartamentos = session.createQuery("select distinct departamento from Ciudad order by departamento")
		.list();
		return listdepartamentos;
	}

	@Override
	public Ciudad get_by_code(String ciudad) {
		String codigo;
		Ciudad c = null;
		Session session = this.sessionFactory.getCurrentSession();
		List<Ciudad> ciudades = session.createQuery(" from Ciudad where codigo =:citycode")
		.setParameter("citycode", ciudad)
		.list();
		if(ciudades.size()==0)
		{
			codigo = null;
			System.out.println("no se encuentra el resultado");
		}
		else {
			c = ciudades.get(0);
		}
		
		return c;
	}
	
	
	

}
