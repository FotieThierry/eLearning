package com.fotie.QualitePreform.model;

import javax.persistence.*;

@Table(name = "epreuve")
@Entity
public class Epreuve {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;

    @Column(name = "nom_epreuve")
    private String nom_epreuve;
    @Column(name = "domain_name")
    private String domaine;
    @Column(name = "temps")
    private Integer temps;

    @ManyToOne
    @JoinColumn(name= "rf_id_question")
    private Questions rf_id_question;

    public Epreuve() {
    }

    public Epreuve(Integer id, String nom_epreuve, String domaine, Integer temps, Questions rf_id_question) {
        this.id = id;
        this.nom_epreuve = nom_epreuve;
        this.domaine = domaine;
        this.temps = temps;
        this.rf_id_question = rf_id_question;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom_epreuve() {
        return nom_epreuve;
    }

    public void setNom_epreuve(String nom_epreuve) {
        this.nom_epreuve = nom_epreuve;
    }

    public String getDomaine() {
        return domaine;
    }

    public void setDomaine(String domaine) {
        this.domaine = domaine;
    }

    public Integer getTemps() {
        return temps;
    }

    public void setTemps(Integer temps) {
        this.temps = temps;
    }

    public Questions getRf_id_question() {
        return rf_id_question;
    }

    public void setRf_id_question(Questions rf_id_question) {
        this.rf_id_question = rf_id_question;
    }
}
