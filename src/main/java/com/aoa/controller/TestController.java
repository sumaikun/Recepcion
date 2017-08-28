package com.aoa.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.aoa.helpers.*;
import com.aoa.models.User;
import com.aoa.models.Siniestros;
/**
 * Handles requests for the application home page.
 */
@Controller
public class TestController {
	
	@RequestMapping("/Testfileservice")
	public ModelAndView camera() {
		System.out.println("intento generar la vista de camara");
		String message = "Camera View";
		return new ModelAndView("test_camara", "message", message);
	}
	
	@RequestMapping("/scanner")
	public ModelAndView scanner() {
		System.out.println("intento generar la vista de escaner");
		String message = "Scanner View";
		return new ModelAndView("test_scanner", "message", message);
	}
	
	@RequestMapping("/scanner2")
	public ModelAndView scanner2() {
		System.out.println("intento generar la vista de escaner2");
		String message = "Scanner View";
		return new ModelAndView("test_scanner2", "message", message);
	}
	
	@RequestMapping("/TestBD")
	public ModelAndView TestBd() {
		Siniestros s = methods.db_Test();
		
		System.out.println("Prueba de la bd");
		System.out.println(s.getNumero());
		return new ModelAndView("home");
	}
	
	@RequestMapping("/Tiposgarantia")
	public ModelAndView TiposGarantia() {
		
		return new ModelAndView("tipos_garantia");
	}
	
	@RequestMapping("/imagesFile")
	public ModelAndView imagesFile() {
		
		return new ModelAndView("images_files");
	}
	

	
	@RequestMapping(value="/ajaxtest", method = RequestMethod.POST)
	@ResponseBody
	public String Ajax(@RequestParam("image") MultipartFile file) throws IOException {
		//String nomFichier= file.getOriginalFilename();
		//byte[] bytes = file.getBytes();
		System.out.println("extensión: "+file.getOriginalFilename());
		String uploadsDir = "/uploads/";
		String ApplicationPath = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath(uploadsDir);
        System.out.println("soy el path "+ApplicationPath);
        if(! new File(ApplicationPath).exists())
        {
            new File(ApplicationPath).mkdir();
        }
        String orgName = file.getOriginalFilename();
        String filePath = ApplicationPath + orgName;
        File dest = new File(filePath);
        file.transferTo(dest);
		return "got it";
	}
	
}
