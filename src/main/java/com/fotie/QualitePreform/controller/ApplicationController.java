package com.fotie.QualitePreform.controller;


import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class ApplicationController {


	@GetMapping("/sno_control")
	public String Loginpage(HttpServletRequest request){
		return "login";
	}
	
	@GetMapping("/logout")
	public String LogOut(HttpServletRequest request){
		request.getSession().invalidate();
		return "login";
	}

	@GetMapping("/home")
	public String Homepage(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "acceuil";
	}

	
}
