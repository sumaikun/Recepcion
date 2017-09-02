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
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(a);
	}

	@Override
	public Autorizacion get_by_siniester(String siniestro) {
		Session session = this.sessionFactory.getCurrentSession();
		Autorizacion a = new Autorizacion();
		int siniestroid = Integer.parseInt(siniestro);
		List<Autorizacion> listautorizacion = session.createQuery("from Autorizacion where siniestro = :sid")
				.setParameter("sid", siniestroid)
				.list();
		if(listautorizacion.size()>0)
		{
			a = listautorizacion.get(0);			
		}
		else {
			a = null;
		}
		
		return a;
	}

	@Override
	public void update(Autorizacion a) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(a);
	}
	


	
	

}
