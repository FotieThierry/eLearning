package com.fotie.QualitePreform.service;

import com.fotie.QualitePreform.model.Utilisateur;

import java.util.List;

public interface UtilisateurService {
    void SaveUser(Utilisateur utilisateur);
    List<Utilisateur> selectAllUser();
    void deleteUser(Integer id);
    Utilisateur getUserById(Integer id);
}
