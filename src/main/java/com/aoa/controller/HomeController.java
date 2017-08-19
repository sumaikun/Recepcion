package com.aoa.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
	public ModelAndView helloWorld() {
		System.out.println("intento generar la vista inicial");
		String message = "Hello World, Spring MVC @ Javatpoint";
		return new ModelAndView("home", "message", message);
	}
	
	@RequestMapping("/hello")
	public ModelAndView helloWorld2() {
		System.out.println("intento generar la vista inicial");
		String message = "Hello World, Spring MVC @ Javatpoint";
		return new ModelAndView("hello", "message", message);
	}
	
}
