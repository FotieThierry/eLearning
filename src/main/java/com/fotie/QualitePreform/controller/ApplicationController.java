package com.fotie.QualitePreform.controller;


import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class ApplicationController {

  @GetMapping("/home")
  public String getHomePage(HttpServletRequest request){
      request.setAttribute("mode", "MODE_HOME");
	  return "home";
  }

 @GetMapping("/eval")
  public String getEvaluation(HttpServletRequest request){
      request.setAttribute("mode", "EVALUATION_PAGE");
      return "home";
  }
    @GetMapping("/adduser")
  public String addUser(HttpServletRequest request){
      request.setAttribute("mode", "ADD_USER");
      return "home";
  }
  @GetMapping("/getuser")
  public String getUser(HttpServletRequest request){
      request.setAttribute("mode", "USER_LIST");
      return "home";
  }
  @GetMapping("/question")
  public String createQuestions(HttpServletRequest request){
      request.setAttribute("mode", "QUESTIONS");
      return "home";
  }
  @GetMapping("/logout")
  public String logOut(HttpServletRequest request){
      request.getSession().invalidate();
      return "login";
  }
	
}

