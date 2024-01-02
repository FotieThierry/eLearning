package com.fotie.QualitePreform.repository;

import com.fotie.QualitePreform.model.Questions;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Questions, Integer> {

    List<Questions> findQuestionsByDomaine(String domaine);

}
