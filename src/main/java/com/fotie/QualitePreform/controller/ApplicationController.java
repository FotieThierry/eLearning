package com.fotie.QualitePreform.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import com.fotie.QualitePreform.model.Epreuve;
import com.fotie.QualitePreform.model.Questions;
import com.fotie.QualitePreform.model.Utilisateur;
import com.fotie.QualitePreform.serviceImpl.EmailServiceImpl;
import com.fotie.QualitePreform.serviceImpl.EpreuveServiceImpl;
import com.fotie.QualitePreform.serviceImpl.QuestionServiceImpl;
import com.fotie.QualitePreform.serviceImpl.UtilisateurServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class ApplicationController {
    private final UtilisateurServiceImpl serviceUtilisateurImpl;
    private final QuestionServiceImpl serviceQuestionImpl;
    private final EpreuveServiceImpl epreuveService;
    private final EmailServiceImpl emailService;

    public ApplicationController(UtilisateurServiceImpl serviceUtilisateurImpl, QuestionServiceImpl serviceQuestionImpl, EpreuveServiceImpl epreuveService, EmailServiceImpl emailService) {
        this.serviceUtilisateurImpl = serviceUtilisateurImpl;
        this.serviceQuestionImpl = serviceQuestionImpl;
        this.epreuveService = epreuveService;
        this.emailService = emailService;
    }

    @GetMapping("/login")
    public String getLoginPage(){
        return "login";
    }

    @PostMapping("/authenticate")
    public String authenticateUser(HttpServletRequest request, HttpSession session){
        String login = request.getParameter("login"); // login is email
        String password = request.getParameter("password");

        //find user with login et password
        Optional<Utilisateur> userToAuthenticate = serviceUtilisateurImpl.findUserByEmailAndPassword(login, password);

        // if exist return homePage
        if(userToAuthenticate.isPresent()){
            // set usser in a session
            session.setAttribute("nom", userToAuthenticate.get().getNom());
            session.setAttribute("prenom", userToAuthenticate.get().getPrenom());
            session.setAttribute("email", userToAuthenticate.get().getEmail());
            session.setAttribute("id", userToAuthenticate.get().getId());
            session.setAttribute("type", userToAuthenticate.get().getType());
            //and retur home page
            request.setAttribute("mode", "MODE_HOME");
            return "home";
        }else{
            return "errorPage";
        }

    }

    @GetMapping("/home")
    public String getHomePage(HttpServletRequest request) {
        request.setAttribute("mode", "MODE_HOME");
        return "home";
    }

    @GetMapping("/evaluation1-selectDomain")
    public String getEvaluation(HttpServletRequest request) {
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        if(request.getSession().getAttribute("type").equals("administrateur")){
            return "errorPage";
        }
        List<Epreuve> epreuveList = epreuveService.getAllEpreuve();
        request.setAttribute("liste_des_epreuves", epreuveList);
        return "selectDomainEvaluationPage";
    }

    @PostMapping("/startEvaluation")
    public String startEvaluation(HttpServletRequest request) {
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        if(request.getSession().getAttribute("type").equals("administrateur")){
            return "errorPage";
        }
        String nomEpreuve = request.getParameter("epreuve");

        // selectionner les questions de l'epreuve
        List<Questions> questionsList = serviceQuestionImpl.selectAllQuestionByEpreuve(nomEpreuve);
        // on recupere la durée de l'épreuve
        int tempEpreuve = epreuveService.timeEpreuve(nomEpreuve);

        int totalQuestionValue = questionsList.size();

        request.setAttribute("totalQuestion", totalQuestionValue);
        request.setAttribute("questionList", questionsList);
        request.setAttribute("nom_Epreuve", nomEpreuve);
        request.setAttribute("timeInSeconds", tempEpreuve * 60);

        return "startEvaluation";
    }

    @PostMapping("/corrigerEvaluation")
    public String corrigerEvaluation(HttpServletRequest request) {
        String nom_epreuve = request.getParameter("nom_epreuve");
        //ramaining time
        String remainingTime = request.getParameter("countdown");
        // exam time
        String examTime = request.getParameter("exam_time");

        // selectionner les questions de l'epreuve
        List<Questions> questionsList = serviceQuestionImpl.selectAllQuestionByEpreuve(nom_epreuve);

        int correctAnswer =0;
        int badAnswer=0;
        int totalQestion = questionsList.size();

        for(int i=1; i <= questionsList.size(); i++){
            String questionName = "question"+i;
            String answer = request.getParameter(questionName);
            if(questionsList.get(i-1).getReponse().equals(answer)){
                correctAnswer++;
            }else{
                badAnswer++;
            }
        }

        StringBuilder message= new StringBuilder();
        String nom = (String) request.getSession().getAttribute("nom");
        String prenom = (String) request.getSession().getAttribute("prenom");
        String username = nom.concat(" ").concat(prenom);

        message.append("Hello dear  " + username +", \n");

       String totalMark = ""+ correctAnswer +" / " + totalQestion;
        String mention ="";
        String appreciation="";
        if(correctAnswer == totalQestion){
            mention = "EXCELLENT";
            appreciation = "CONGRATULATIONS !!! you succeeded to the test of the" + LocalDate.now() + ". \n";
            message.append(appreciation);
            message.append("score : " + totalMark+ ". \n");
            message.append("Mention : " + mention + ". \n");
        } else if (correctAnswer <= (totalQestion/2)) {
            mention = "INSUFFICIENT";
            appreciation = "SORRY!! you failed to succeed the test of the " + LocalDate.now() + ". \n";
            message.append(appreciation);
            message.append("score : " + totalMark + ". \n");
            message.append("Mention : " + mention + ". \n");

        } else if (correctAnswer >= totalQestion/2 && correctAnswer < totalQestion ) {
            mention = "GOOD";
            appreciation = "CONGRATULATIONS !!! you succeeded to the test of the " + LocalDate.now() + ". \n";
            message.append(appreciation);
            message.append("Score : " + totalMark + ". \n");
            message.append("Grade : " + mention + ". \n");
        }

        // envoyer les résultats par mails
        String userEmail = (String) request.getSession().getAttribute("email"); //"rodriguekayem@gmail.com";
        emailService.sendSimpleMessage(userEmail, message.toString());

        request.setAttribute("mode", "EVALUATION_STATISTICS");
        request.setAttribute("userName", username);
        request.setAttribute("score", totalMark);
        request.setAttribute("grade", mention);
        request.setAttribute("appreciation", appreciation);

        return "home";
    }

    @GetMapping("/adduser")
    public String addUser(HttpServletRequest request) {
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        request.setAttribute("mode", "ADD_USER");
        return "home";
    }

    @GetMapping("/getuser")
    public String getUser(HttpServletRequest request) {
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        List<Utilisateur> userList = serviceUtilisateurImpl.selectAllUser();
        request.setAttribute("listeUtilisateur", userList);
        request.setAttribute("mode", "USER_LIST");
        return "home";
    }

    @GetMapping("/questionList")
    public String getQuestions(HttpServletRequest request) {
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        List<Questions> questionList = serviceQuestionImpl.selectAllQuestions();
        request.setAttribute("listQuestion", questionList);
        request.setAttribute("mode", "QUESTION_LIST");
        return "home";
    }

    @GetMapping("/questionAdd")
    public String createQuestions(HttpServletRequest request) {
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        request.setAttribute("mode", "QUESTIONS");
        return "home";
    }

    @GetMapping("/epreuveAdd")
    public String createEpreuve(HttpServletRequest request) {
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        request.setAttribute("mode", "CREATE_EPREUVE");
        return "home";
    }

    @GetMapping("/epreuveList")
    public String listEpreuve(HttpServletRequest request) {
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        List<Epreuve>liste = epreuveService.getAllEpreuve();
        request.setAttribute("listeEpreuve", liste);
        request.setAttribute("mode", "LIST_EPREUVE");
        return "home";
    }

    @GetMapping("/logout")
  public String logOut(HttpSession session){
        // remove attribute in session
        // set usser in a session
        session.removeAttribute("nom");
        session.removeAttribute("prenom");
        session.removeAttribute("email");
        // invalidate session
      session.invalidate();
      return "login";
  }

  // save users
    @PostMapping("/save-user")
    public String saveUsers(@ModelAttribute Utilisateur utilisateur, BindingResult bindingResult, HttpServletRequest request){
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
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
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        serviceUtilisateurImpl.deleteUser(id);

        List<Utilisateur> utilisateurList = serviceUtilisateurImpl.selectAllUser();
        request.setAttribute("listeUtilisateur", utilisateurList);
        request.setAttribute("mode", "USER_LIST");

        return "home";
    }

   @GetMapping("/edit-user")
    public String editUser(@RequestParam Integer id, HttpServletRequest request){
       if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
           return "errorPage";
       }
       if(request.getSession().getAttribute("nom") == null){
           return "errorPage";
       }
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
       if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
           return "errorPage";
       }
       if(request.getSession().getAttribute("nom") == null){
           return "errorPage";
       }
       serviceUtilisateurImpl.updateUser(utilisateur);

        List<Utilisateur> utilisateurList = serviceUtilisateurImpl.selectAllUser();
        request.setAttribute("listeUtilisateur", utilisateurList);
        request.setAttribute("mode", "USER_LIST");

        return  "home";
    }

    // save question
    @PostMapping("save-question")
    public String saveQuestion(@ModelAttribute Questions questions, HttpServletRequest request){
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        serviceQuestionImpl.SaveQuestion(questions);
        List<Questions> questionsList = serviceQuestionImpl.selectAllQuestions();
        request.setAttribute("listQuestion", questionsList);
        request.setAttribute("mode", "QUESTION_LIST");
        return "home";
    }

    @GetMapping("/edit-question")
    public String editQuestion(@RequestParam Integer id, HttpServletRequest request){
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        Questions quest = serviceQuestionImpl.getQuestionById(id);
        serviceQuestionImpl.SaveQuestion(quest);
        serviceQuestionImpl.deleteQuestion(id);
        request.setAttribute("question_a_modifier", quest);
        request.setAttribute("mode", "MODE_EDIT_QUESTION");
        return "home";
    }

    @GetMapping("/delete-question")
    public String deleteQuestion(@RequestParam Integer id, HttpServletRequest request){
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        serviceQuestionImpl.deleteQuestion(id);

        List<Questions> questionList = serviceQuestionImpl.selectAllQuestions();
        request.setAttribute("listQuestion", questionList);
        request.setAttribute("mode", "QUESTION_LIST");

        return "home";
    }

   @PostMapping("update-question")
    public String updateQuestion(@ModelAttribute Questions question, HttpServletRequest request){
       if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
           return "errorPage";
       }
       if(request.getSession().getAttribute("nom") == null){
           return "errorPage";
       }
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
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        String domaine = request.getParameter("domaine");
        List<Questions> questionByDomain = serviceQuestionImpl.selectAllQuestionByDomain(domaine);

        request.setAttribute("domaine_name", domaine);
        request.setAttribute("listQuestionDomain", questionByDomain);
        request.setAttribute("mode", "LISTE_QUESTION_BY_DOMAINE");
        return "home";
    }

    @PostMapping("/create-epreuve2")
    public String createEpreuves2(@RequestParam(value = "questionId", required = false)String [] questionId ,HttpServletRequest request){
        if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
            return "errorPage";
        }
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
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
       if(request.getSession().getAttribute("type").equals("simpleUtilisateur")){
           return "errorPage";
       }
       if(request.getSession().getAttribute("nom") == null){
           return "errorPage";
       }
        epreuveService.deleteEpreuve(id);
        List<Epreuve> listEpreuve= epreuveService.getAllEpreuve();
        request.setAttribute("listeEpreuve", listEpreuve);
        request.setAttribute("mode", "LIST_EPREUVE");
        return "home";
    }

    @GetMapping("/edit-userByUser")
    public String editUserByUser(HttpServletRequest request){
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        // 1- recuperer l'utilisateur à partir de son id
        Integer id = (Integer) request.getSession().getAttribute("id");
        Utilisateur users = serviceUtilisateurImpl.getUserById(id);
        //2- set le user dans la requete pour recuperer dans la view
        request.setAttribute("utilisateur_a_modifier", users);
        //3- set le mode MODE_EDIT_UTILISATEUR
        request.setAttribute("mode", "EDIT_USER_BY_USER");
        return "home";
    }

    @PostMapping("update-userByUser")
    public String updateUserByUser(@ModelAttribute Utilisateur utilisateur, HttpServletRequest request){
        if(request.getSession().getAttribute("nom") == null){
            return "errorPage";
        }
        serviceUtilisateurImpl.updateUser(utilisateur);


        request.setAttribute("mode", "MODE_HOME");

        return  "home";
    }

}

