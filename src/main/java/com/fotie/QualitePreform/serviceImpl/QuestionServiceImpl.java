package com.fotie.QualitePreform.serviceImpl;


import com.fotie.QualitePreform.model.Questions;
import com.fotie.QualitePreform.repository.QuestionRepository;
import com.fotie.QualitePreform.service.QuestionService;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {

    private final QuestionRepository repository_for_question;

    public QuestionServiceImpl(QuestionRepository repositoryForQuestion) {
        repository_for_question = repositoryForQuestion;
    }

    @Override
    public void SaveQuestion(Questions question) {
        repository_for_question.save(question);
    }

    @Override
    public List<Questions> selectAllQuestions() {
        return repository_for_question.findAll();
    }

    @Override
    public void deleteQuestion(Integer id) {
        repository_for_question.deleteById(id);
    }

    @Override
    public Questions getQuestionById(Integer id) {
        return repository_for_question.findById(id).get();
    }

    @Override
    public List<Questions> selectAllQuestionByDomain(String domaine) {
        return repository_for_question.findQuestionsByDomaine(domaine);
    }
}
