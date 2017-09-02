package com.aoa.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping("/home")
	public ModelAndView helloWorld(HttpSession session) {
		session.setAttribute("success" , "variable de sesion iniciada");
		//session.invalidate(); --> Invalidar sesión.
		System.out.println("intento generar la vista inicial");
		String message = "Hello World, Spring MVC @ Javatpoint";
		return new ModelAndView("home", "message", message);
	}
	
	@RequestMapping("/hello")
	public ModelAndView helloWorld2(HttpSession session) {
		String Successmessage = (String) session.getAttribute("success");
		System.out.println("intento generar la vista inicial "+Successmessage);
		
		String message = "Hello World, Spring MVC @ Javatpoint";
		return new ModelAndView("hello", "message", message);
	}
	
}
