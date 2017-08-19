package com.aoa.helpers;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.aoa.models.Role;
import com.aoa.models.Siniestros;
import com.aoa.models.User;



public class methods {
	
	private static SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	public static int id_generator(String table){	
		int id;
		try {
			 Session session;			
			 session = sessionFactory.openSession();
							
			String squery = "from "+table;
			Query query = session.createQuery(squery);						
			if(!query.list().isEmpty())
			{
				id = query.list().size();
				id += 1;
			}
			else {
				id=1;
				
			}
			}catch(Exception e){
				throw e;
			}
		
		return id;	
	}
	
	public static Siniestros db_Test()
	{
		Siniestros u;
		try {
			 Session session;			
			 session = sessionFactory.openSession();
							
			 u = (Siniestros) session.load(Siniestros.class, 1316764);
			 
			}catch(Exception e){
				throw e;
			}		
		
		return u;
	}
}
