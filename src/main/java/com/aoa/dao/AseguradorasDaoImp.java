package com.aoa.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.aoa.models.Aseguradoras;



@Repository
public class AseguradorasDaoImp implements AseguradorasDao{

	
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImp.class); 
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	


	@Override
	public Aseguradoras getAseguradorasById(int id) {;
		Session session = this.sessionFactory.getCurrentSession();
		Aseguradoras a = (Aseguradoras) session.load(Aseguradoras.class, id);
		logger.info("Aseguradora loaded, details="+a);
		return a;
	}

	

	
	

}
