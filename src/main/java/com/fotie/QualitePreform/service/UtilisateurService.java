package com.fotie.QualitePreform.service;

import com.fotie.QualitePreform.model.Utilisateur;

import java.util.List;
import java.util.Optional;

public interface UtilisateurService {
    void SaveUser(Utilisateur utilisateur);
    List<Utilisateur> selectAllUser();
    void deleteUser(Integer id);
    Utilisateur getUserById(Integer id);

    Optional<Utilisateur> findUserByEmailAndPassword(String email, String password);
    Utilisateur updateUser(Utilisateur user);
}
