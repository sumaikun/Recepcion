package com.aoa.services;

import java.util.HashSet;
import java.util.Set;

import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.aoa.dao.UserDao;
import com.aoa.models.User;


@Service
public class LoginServiceImp implements  UserDetailsService{
	
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	@SuppressWarnings("deprecation")
    @Override
    public UserDetails loadUserByUsername(String username)	throws UsernameNotFoundException, DataAccessException
    {
		System.out.println("intento entrar al sistema");
		User log_user = userDao.LogginIn(username);		
		System.out.println(log_user.toString());
        //System.out.println("Getting access details from employee dao !!");
		
        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));

        return new org.springframework.security.core.userdetails.User(
                log_user.getEmail(),
                log_user.getPassword(),
                true,
                true,
                true,
                true,
                authorities);
       
    }
}
