package com.aoa.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.hibernate.Query;

import com.aoa.models.Client;
import com.aoa.models.Siniestros;

@Repository
public class ClientDaoImp implements ClientDao{
	
	private static final Logger logger = LoggerFactory.getLogger(ClientDaoImp.class); 
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	@Override
	public void create(Client c) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(c);
	}
	@Override
	public Client getClientById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Client c = (Client) session.load(Client.class, id);
		logger.info("Client loaded, details="+c);
		return c;
	}
	@Override
	public String getClientBycode(String code) {
        Client c = new Client();
        String string ;
        Session session = this.sessionFactory.getCurrentSession();
		System.out.println("estoy en el dao");
		List<Client> clientList = session.createQuery("from Client where identificacion like :code")
		.setParameter("code", "%"+code+"%")		
		.list();
		
		if(clientList.size()==0)
		{			
			System.out.println("no se encuentra el resultado");
			string = null;
		}
		else {
			c = clientList.get(0);
			string = c.getIdentificacion();
		}	
		
		return string;
	}
	
	
	

}
