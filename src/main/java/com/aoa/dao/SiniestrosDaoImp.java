package com.aoa.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.hibernate.Query;
import com.aoa.models.Siniestros;
import com.aoa.models.User;

@Repository
public class SiniestrosDaoImp implements SiniestrosDao{
	
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImp.class); 
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Siniestros> listsiniestros() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Siniestros> siniestrosList = session.createQuery("from Role").list();		
		for(Siniestros r : siniestrosList ){
			System.out.println("entra "+r);
			logger.info("Role List :"+r);
		}
		return siniestrosList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Siniestros begin_service(String placa, String declarante_celular) {
		Siniestros s;
		Session session = this.sessionFactory.getCurrentSession();
		System.out.println("estoy en el dao");
		List<Siniestros> siniestrosList = session.createQuery("from Siniestros where placa like :placa and declarante_celular = :declarante_celular")
		.setParameter("placa", "%"+placa+"%")
		.setParameter("declarante_celular", declarante_celular)
		.list();
		/*List<Siniestros> siniestrosList = session.createQuery("from Siniestros where numero = :code")
				.setParameter("code", "218411735")				
				.list();*/
		if(siniestrosList.size()==0)
		{
			s = null;
			System.out.println("no se encuentra el resultado");
		}
		else {
			 s = siniestrosList.get(0);
		}		
		
		return s;
			
	}
	
	

}
