package com.fotie.QualitePreform.model;

import javax.persistence.*;
import java.util.List;

@Table(name = "epreuve")
@Entity
public class Epreuve {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;

    @Column(name = "nom_epreuve")
    private String nomEpreuve;
    @Column(name = "domain_name")
    private String domaine;
    @Column(name = "temps")
    private Integer temps;

    @OneToMany(mappedBy = "epreuve", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Questions> rf_id_question;

    public Epreuve() {
    }

    public Epreuve(Integer id, String nomEpreuve, String domaine, Integer temps, List<Questions> rf_id_question) {
        this.id = id;
        this.nomEpreuve = nomEpreuve;
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

    public String getNomEpreuve() {
        return nomEpreuve;
    }

    public void setNomEpreuve(String nomEpreuve) {
        this.nomEpreuve = nomEpreuve;
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

    public List<Questions> getRf_id_question() {
        return rf_id_question;
    }

    public void setRf_id_question(List<Questions> rf_id_question) {
        this.rf_id_question = rf_id_question;
    }
}
