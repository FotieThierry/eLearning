package com.fotie.QualitePreform.repository;

import com.fotie.QualitePreform.model.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface UtilisateurRepository extends JpaRepository<Utilisateur, Integer> {

    Optional<Utilisateur>  findFirstByEmailAndPassword(String email, String password);
    Optional<Utilisateur>  findFirstByEmailAndNomAndPrenom(String email, String nom, String prenom);

}
