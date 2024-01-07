package com.fotie.QualitePreform.service;

import com.fotie.QualitePreform.model.Epreuve;

import java.util.List;

public interface EpreuveService {
    void saveEpreuve(Epreuve epreuve);

    List<Epreuve> getAllEpreuve();

    void deleteEpreuve(Integer id);

    Epreuve getEpreuveByName(String epreuveName);
}


