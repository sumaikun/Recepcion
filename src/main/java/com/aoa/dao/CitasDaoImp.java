package com.aoa.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.aoa.models.Citas;
import com.aoa.models.Siniestros;
import com.aoa.models.User;

@Repository
public class CitasDaoImp implements CitasDao {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImp.class); 
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@Override
	public Citas cita_arribo(int siniestro) {			
		Session session = this.sessionFactory.getCurrentSession();
		List<Citas> citasList = session.createQuery("from Citas where siniestro = :sn and estado = 'P'")
				.setParameter("sn",siniestro)				
				.list();
		Citas c = new Citas();		
		c = citasList.get(0);
		System.out.println("id cita "+c.getId());
		System.out.println("arribo "+c.getArribo());
		return c;
		
		
		
	}
	
	@Override
	public void update(Citas c) {
		System.out.println("aca hago el update "+c.getArribo());
		Session session = this.sessionFactory.getCurrentSession();
		session.update(c);
		
	}
	
	
	

}
