package com.aoa.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.aoa.models.Ciudadfranq;
import com.aoa.models.Franquicia;



@Repository
public class FranquiciasDaoImp {

	
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImp.class); 
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@SuppressWarnings("unchecked")
	public List<Franquicia> get_franquicias(int oficina, String aseguradora) {
		ArrayList<String> franquiciasid = new ArrayList();
		Session session = this.sessionFactory.getCurrentSession();
		System.out.println("estoy en el dao");
		List<Ciudadfranq> franquiciaList = session.createQuery("from Ciudadfranq where oficina = :oficina ")
		.setParameter("oficina", oficina)
		.list();
		
		System.out.println("aseguradora "+aseguradora);
		
		for(Ciudadfranq c : franquiciaList)
		{
			String[] ary =  c.getAseguradora().split(",");
			//System.out.println(c.getAseguradora());
			if(Arrays.asList(ary).contains(aseguradora))
			{
				//System.out.println(c.getId());
				franquiciasid.add(String.valueOf(c.getFranquicia()));
			}
		}
		
		System.out.println( "id conseguidos "+String.join(",", franquiciasid));
		
		List<Franquicia> franquicias = session.createQuery("from Franquicia where id in :franqlist ")
				.setParameterList("franqlist", franquiciasid)
				.list();
		
		
		return franquicias;
	}
	
	
	

}
