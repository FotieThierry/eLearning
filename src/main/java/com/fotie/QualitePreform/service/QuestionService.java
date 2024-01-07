package com.fotie.QualitePreform.service;


import com.fotie.QualitePreform.model.Questions;


import java.util.List;

public interface QuestionService {
    void SaveQuestion(Questions question);
    List<Questions> selectAllQuestions();
    void deleteQuestion(Integer id);
    Questions getQuestionById(Integer id);

    List<Questions> selectAllQuestionByDomain(String domaine);
    List<Questions> selectAllQuestionByEpreuve(String epreuve);
}