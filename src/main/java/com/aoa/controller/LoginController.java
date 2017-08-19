package com.aoa.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import org.springframework.web.servlet.ModelAndView;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.aoa.helpers.password_encrypt;
import com.aoa.models.User;
import com.aoa.services.UserService;

//Session
import org.springframework.ui.Model;
import javax.servlet.http.HttpSession;

@Controller  
@SessionAttributes 
public class LoginController {
		
	 private final Log logger = LogFactory.getLog(LoginController.class);
	 
	private UserService userService;
	@Autowired(required=true)
	@Qualifier(value="userService")
		
	public void setUserService(UserService uS){		
		
			this.userService = uS;
	}
	
	  @RequestMapping("/login")  
	  public ModelAndView showContacts()
	  {  
		  Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		  if (!(auth instanceof AnonymousAuthenticationToken)) {
			  return new ModelAndView("hello");			   
			}				
		 
	        return new ModelAndView("login");  
	  }
	  
	  @RequestMapping(value = "/logginIn", method = RequestMethod.GET)
	  public String LogginIn(Model map, HttpSession session, HttpServletRequest req){
		  System.out.println("intento iniciar sesion");
		  logger.info("********************** loginIn() ****************************END");
		  String userName = SecurityContextHolder.getContext()
	                .getAuthentication().getName();
	       
	        Collection<? extends GrantedAuthority> roleNames = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
	        String roleName = "";
	        for (GrantedAuthority role : roleNames) {
	            roleName = role.getAuthority();
	            
	            break;
	        }
	       
	        String retstr = "redirect:/admin/panel";
	       
	        if("ROLE_ADMIN".equalsIgnoreCase(roleName)){
	            retstr="redirect:/admin/panel";
	        }else if("ROLE_USER".equalsIgnoreCase(roleName)){
	            retstr="redirect:../user/test";
	        }
	       
	        
	        
	        return retstr;
	  }
	  
	  @RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
	    public String loginFailed(Model map, HttpSession session) {
		  System.out.println("Sesion errada");
	        logger.info("********************** loginFailed() ****************************END");
	        return "redirect:login";

	    }

	    
	    @RequestMapping(value = "/logout")
	    public String logout(Model map, HttpServletRequest req) {
	    	System.out.println("intento cerrar sesion");	
	         logger.info("*******************************session invalidated");
	         req.getSession().invalidate();
	         SecurityContextHolder.clearContext();
	        return "redirect:hello";
	    }
	  
	  /*public String LogginIn(HttpServletRequest request,@RequestParam(value="email", required=false) String email,@RequestParam(value="password", required=false) String password)
	  {		
		  	System.out.println("intento de logeo");
		  	User user = null ;
		  	try{
		  		password = password_encrypt.cryptWithMD5(password);
		  		user = userService.LogginIn(email, password);		  		
			  	if(user != null){
			  		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("user", user);				  	
			  		System.out.println("True");
			  	}
			  	else{
			  		System.out.println("False");
			  	}
		  	}catch(Exception e){
		  		throw e;
		  	}
		  
			return "redirect:/login"; funciona para jsp no spring security
	  }*/
	  
	  @RequestMapping("/admin/panel")  
	  public ModelAndView security_test()
	  {  
	        return new ModelAndView("home_admin");  
	  }
}
