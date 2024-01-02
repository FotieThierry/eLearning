package com.fotie.QualitePreform.model;

import javax.persistence.*;

@Table(name = "questions")
@Entity
public class Questions {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;
    @Column(name = "question")
    private String question;
    @Column(name = "domaine")
    private String domaine;
    @Column(name = "reponse")
    private String reponse;
    @Column(name = "proposition1")
    private String proposition1;
    @Column(name = "proposition2")
    private String proposition2;
    @Column(name = "proposition3")
    private String proposition3;


    public Questions() {
    }
    public Questions(Integer id, String question, String domaine, String reponse, String proposition1, String proposition2, String proposition3) {
        this.id = id;
        this.question = question;
        this.domaine = domaine;
        this.reponse = reponse;
        this.proposition1 = proposition1;
        this.proposition2 = proposition2;
        this.proposition3 = proposition3;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getDomaine() {
        return domaine;
    }

    public void setDomaine(String domaine) {
        this.domaine = domaine;
    }

    public String getReponse() {
        return reponse;
    }

    public void setReponse(String reponse) {
        this.reponse = reponse;
    }

    public String getProposition1() {
        return proposition1;
    }

    public void setProposition1(String proposition1) {
        this.proposition1 = proposition1;
    }

    public String getProposition2() {
        return proposition2;
    }

    public void setProposition2(String proposition2) {
        this.proposition2 = proposition2;
    }

    public String getProposition3() {
        return proposition3;
    }

    public void setProposition3(String proposition3) {
        this.proposition3 = proposition3;
    }
}
