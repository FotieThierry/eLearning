package com.fotie.QualitePreform.controller;


import javax.servlet.http.HttpServletRequest;


import com.fotie.QualitePreform.model.Epreuve;
import com.fotie.QualitePreform.model.Questions;
import com.fotie.QualitePreform.model.Utilisateur;
import com.fotie.QualitePreform.serviceImpl.EpreuveServiceImpl;
import com.fotie.QualitePreform.serviceImpl.QuestionServiceImpl;
import com.fotie.QualitePreform.serviceImpl.UtilisateurServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ApplicationController {
    private final UtilisateurServiceImpl serviceUtilisateurImpl;
    private final QuestionServiceImpl serviceQuestionImpl;
    private final EpreuveServiceImpl epreuveService;

    public ApplicationController(UtilisateurServiceImpl serviceUtilisateurImpl, QuestionServiceImpl serviceQuestionImpl, EpreuveServiceImpl epreuveService) {
        this.serviceUtilisateurImpl = serviceUtilisateurImpl;
        this.serviceQuestionImpl = serviceQuestionImpl;
        this.epreuveService = epreuveService;
    }


    @GetMapping("/home")
    public String getHomePage(HttpServletRequest request) {
        request.setAttribute("mode", "MODE_HOME");
        return "home";
    }

    @GetMapping("/evaluation1-selectDomain")
    public String getEvaluation(HttpServletRequest request) {
        List<Epreuve> epreuveList = epreuveService.getAllEpreuve();
        request.setAttribute("liste_des_epreuves", epreuveList);
        return "selectDomainEvaluationPage";
    }

    @PostMapping("/startEvaluation")
    public String startEvaluation(HttpServletRequest request) {
        String nomEpreuve = request.getParameter("epreuve");

        // selectionner les questions de l'epreuve
        List<Questions> questionsList = serviceQuestionImpl.selectAllQuestionByEpreuve(nomEpreuve);
        // on recupere la durée de l'épreuve
        int totalQuestionValue = questionsList.size();

        request.setAttribute("totalQuestion", totalQuestionValue);
        request.setAttribute("questionList", questionsList);
        request.setAttribute("nom_Epreuve", nomEpreuve);
        request.setAttribute("timeInSeconds", 10);

        return "startEvaluation";
    }

    @PostMapping("/corrigerEvaluation")
    public String corrigerEvaluation(HttpServletRequest request){

        return "home";
    }

    @GetMapping("/adduser")
    public String addUser(HttpServletRequest request) {
        request.setAttribute("mode", "ADD_USER");
        return "home";
    }

    @GetMapping("/getuser")
    public String getUser(HttpServletRequest request) {
        List<Utilisateur> userList = serviceUtilisateurImpl.selectAllUser();
        request.setAttribute("listeUtilisateur", userList);
        request.setAttribute("mode", "USER_LIST");
        return "home";
    }

    @GetMapping("/questionList")
    public String getQuestions(HttpServletRequest request) {
        List<Questions> questionList = serviceQuestionImpl.selectAllQuestions();
        request.setAttribute("listQuestion", questionList);
        request.setAttribute("mode", "QUESTION_LIST");
        return "home";
    }

    @GetMapping("/questionAdd")
    public String createQuestions(HttpServletRequest request) {
        request.setAttribute("mode", "QUESTIONS");
        return "home";
    }

    @GetMapping("/epreuveAdd")
    public String createEpreuve(HttpServletRequest request) {
        request.setAttribute("mode", "CREATE_EPREUVE");
        return "home";
    }

    @GetMapping("/epreuveList")
    public String listEpreuve(HttpServletRequest request) {
        List<Epreuve>liste = epreuveService.getAllEpreuve();
        request.setAttribute("listeEpreuve", liste);
        request.setAttribute("mode", "LIST_EPREUVE");
        return "home";
    }


    @GetMapping("/logout")
  public String logOut(HttpServletRequest request){
      request.getSession().invalidate();
      return "login";
  }

  // save users
    @PostMapping("/save-user")
    public String saveUsers(@ModelAttribute Utilisateur utilisateur, BindingResult bindingResult, HttpServletRequest request){
        //1- appel la methode save
        serviceUtilisateurImpl.SaveUser(utilisateur);
        //2- recharger la liste des utilisateurs
        List<Utilisateur> utilisateurs = serviceUtilisateurImpl.selectAllUser();
        request.setAttribute("listeUtilisateur", utilisateurs);
      request.setAttribute("mode", "USER_LIST");
      return "home";
    }

    @GetMapping("/delete-user")
    public String deleteUser(@RequestParam Integer id, HttpServletRequest request){
        serviceUtilisateurImpl.deleteUser(id);

        List<Utilisateur> utilisateurList = serviceUtilisateurImpl.selectAllUser();
        request.setAttribute("listeUtilisateur", utilisateurList);
        request.setAttribute("mode", "USER_LIST");

        return "home";
    }

   @GetMapping("/edit-user")
    public String editUser(@RequestParam Integer id, HttpServletRequest request){
        // 1- recuperer l'utilisateur à partir de son id
        Utilisateur users = serviceUtilisateurImpl.getUserById(id);
        //2- set le user dans la requete pour recuperer dans la view
        request.setAttribute("utilisateur_a_modifier", users);
        //3- set le mode MODE_EDIT_UTILISATEUR
        request.setAttribute("mode", "MODE_EDIT_UTILISATEUR");

        return "home";
    }

   @PostMapping("update-user")
    public String updateUser(@ModelAttribute Utilisateur utilisateur, HttpServletRequest request){
        serviceUtilisateurImpl.SaveUser(utilisateur);
        serviceUtilisateurImpl.deleteUser(utilisateur.getId());
        List<Utilisateur> utilisateurList = serviceUtilisateurImpl.selectAllUser();
        request.setAttribute("listeUtilisateur", utilisateurList);
        request.setAttribute("mode", "USER_LIST");

        return  "home";
    }

    // save question
    @PostMapping("save-question")
    public String saveQuestion(@ModelAttribute Questions questions, HttpServletRequest request){
        serviceQuestionImpl.SaveQuestion(questions);
        List<Questions> questionsList = serviceQuestionImpl.selectAllQuestions();
        request.setAttribute("listQuestion", questionsList);
        request.setAttribute("mode", "QUESTION_LIST");
        return "home";
    }

    @GetMapping("/edit-question")
    public String editQuestion(@RequestParam Integer id, HttpServletRequest request){
        Questions quest = serviceQuestionImpl.getQuestionById(id);
        serviceQuestionImpl.SaveQuestion(quest);
        serviceQuestionImpl.deleteQuestion(id);
        request.setAttribute("question_a_modifier", quest);
        request.setAttribute("mode", "MODE_EDIT_QUESTION");
        return "home";
    }

    @GetMapping("/delete-question")
    public String deleteQuestion(@RequestParam Integer id, HttpServletRequest request){
        serviceQuestionImpl.deleteQuestion(id);

        List<Questions> questionList = serviceQuestionImpl.selectAllQuestions();
        request.setAttribute("listQuestion", questionList);
        request.setAttribute("mode", "QUESTION_LIST");

        return "home";
    }

   @PostMapping("update-question")
    public String updateQuestion(@ModelAttribute Questions question, HttpServletRequest request){
        serviceQuestionImpl.SaveQuestion(question);
        serviceQuestionImpl.deleteQuestion(question.getId());
        List<Questions> questionList = serviceQuestionImpl.selectAllQuestions();
        request.setAttribute("listQuestion", questionList);
        request.setAttribute("mode", "QUESTION_LIST");

        return  "home";
    }

    // creation des epreuves
    @PostMapping("/create-epreuve1")
    public String getQuestionByDomain(HttpServletRequest request){
        String domaine = request.getParameter("domaine");
        List<Questions> questionByDomain = serviceQuestionImpl.selectAllQuestionByDomain(domaine);

        request.setAttribute("domaine_name", domaine);
        request.setAttribute("listQuestionDomain", questionByDomain);
        request.setAttribute("mode", "LISTE_QUESTION_BY_DOMAINE");
        return "home";
    }

    @PostMapping("/create-epreuve2")
    public String createEpreuves2(@RequestParam(value = "questionId", required = false)String [] questionId ,HttpServletRequest request){
        String domaine = request.getParameter("domaine");
        String nomEpreuve= request.getParameter("nomEpreuve");
        int temps = Integer.parseInt(request.getParameter("temps"));

        // verifier si l'épreuve existe déja
       Epreuve epreuveToAdd =  epreuveService.getEpreuveByName(nomEpreuve);
       if(epreuveToAdd != null && (epreuveToAdd.getNomEpreuve().equals(nomEpreuve)) ){
           // stop et on n'enregistrep pas
           //2- rediger vers la liste des epreuves
           List<Epreuve> listEpreuve= epreuveService.getAllEpreuve();
           request.setAttribute("listeEpreuve", listEpreuve);
           request.setAttribute("mode", "LIST_EPREUVE");
           return "home";
       } else {
           // 1- creer l'epreuve
           //on set l'objet
           Epreuve epreuveToSave = new Epreuve();
           epreuveToSave.setNomEpreuve(nomEpreuve);
           epreuveToSave.setDomaine(domaine);
           epreuveToSave.setTemps(temps);
           List<Questions> listQuestion = new ArrayList<>();
           for (int i = 0; i < questionId.length; i++) {
               Questions question = serviceQuestionImpl.getQuestionById(Integer.parseInt(questionId[i]));
               question.setEpreuve(epreuveToSave);
               listQuestion.add(question);
           }
           epreuveToSave.setRf_id_question(listQuestion);
           epreuveService.saveEpreuve(epreuveToSave);
       }


        //2- rediger vers la liste des epreuves
          List<Epreuve> listEpreuve= epreuveService.getAllEpreuve();
          request.setAttribute("listeEpreuve", listEpreuve);
          request.setAttribute("mode", "LIST_EPREUVE");
        return "home";
    }

   @GetMapping("/deleteEpreuve")
    public String deleteEpreuve(@RequestParam Integer id, HttpServletRequest request){
        epreuveService.deleteEpreuve(id);
        List<Epreuve> listEpreuve= epreuveService.getAllEpreuve();
        request.setAttribute("listeEpreuve", listEpreuve);
        request.setAttribute("mode", "LIST_EPREUVE");
        return "home";
    }

}

