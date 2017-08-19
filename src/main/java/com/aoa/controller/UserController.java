package com.aoa.controller;

import java.util.List;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aoa.helpers.*;
import com.aoa.models.Role;
import com.aoa.models.Siniestros;
import com.aoa.models.User;
import com.aoa.services.RoleService;
import com.aoa.services.UserService;

@Controller
public class UserController {
	
	private UserService userService;	
	private RoleService RoleService;
	
	
	@Autowired(required=true)
	@Qualifier(value="userService")
	public void setUserService(UserService uS){
		this.userService = uS;
	}
	
	@Autowired(required=true)
	@Qualifier(value="RoleService")
	public void setRoleService(RoleService rS){
		this.RoleService = rS;
	}
	

	@RequestMapping(value="/admin/users", method = RequestMethod.GET)
	public ModelAndView listUsers(Model model){
		ModelAndView mv = new ModelAndView();
		System.out.println("intento generar la vista de usuarios");
		List<User> listUsers = this.userService.listUsers();
		List<Role> rols = this.RoleService.listroles();
		mv.setViewName("users");
		mv.addObject("listUsers",listUsers);
		mv.addObject("rols",rols);
		mv.addObject("User",new User());
		//model.addAttribute("listUsers", this.userService.listUsers());
		return mv;
	}
	
	@RequestMapping(value = "/admin/addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User u){
		
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		u.setCreation(currentTime.toString());
		u.setRol(1);
		System.out.println(u.toString());
		u.setPassword(password_encrypt.cryptBcrypt(u.getPassword()));		
		
		if(u.getId() == 0)
		{
			u.setId(methods.id_generator("User"));
			System.out.println(u.toString());
			this.userService.create(u);
		}
		else{
			this.userService.update(u);
		}
		return "redirect:/admin/users.html";
	}
	
	@RequestMapping(value="/admin/removeUser/{id}", method = RequestMethod.GET)
	public String removeUser(@PathVariable("id") int id){
		this.userService.destroy(id);
		return "redirect:/admin/users.html";
	}
	
	@RequestMapping(value="/admin/editUser/{id}", method = RequestMethod.GET)
	public ModelAndView editUser(@PathVariable("id") int id ,Model model){		
		ModelAndView mv = new ModelAndView();		
		List<User> listUsers = this.userService.listUsers();
		mv.setViewName("users");
		mv.addObject("listUsers",listUsers);
		mv.addObject("User",this.userService.getUserById(id));	
		return mv;
	}
	

	
	
}
