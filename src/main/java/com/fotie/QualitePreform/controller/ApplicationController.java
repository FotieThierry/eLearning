package com.fotie.QualitePreform.controller;


import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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

  // save users
    @PostMapping("/save-user")
    public String saveUsers(HttpServletRequest request){
      // 1- recupere la valeur des champs
        //2- appel la methode save
      request.setAttribute("mode", "USER_LIST");
      return "home";
    }

    @PostMapping("/save-question")
    public String saveQuestion(HttpServletRequest request){

      // todo: create view for question liste
      return "home";
    }
	
}

