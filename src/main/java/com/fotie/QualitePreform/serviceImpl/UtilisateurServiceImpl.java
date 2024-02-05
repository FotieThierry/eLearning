package com.fotie.QualitePreform.serviceImpl;

import com.fotie.QualitePreform.model.Utilisateur;
import com.fotie.QualitePreform.repository.UtilisateurRepository;
import com.fotie.QualitePreform.service.UtilisateurService;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UtilisateurServiceImpl implements UtilisateurService {
    private final UtilisateurRepository repositoryUtilisateur;

    public UtilisateurServiceImpl(UtilisateurRepository repositoryUtilisateur) {
        this.repositoryUtilisateur = repositoryUtilisateur;
    }

    @Override
    public void SaveUser(Utilisateur utilisateur) {
        repositoryUtilisateur.save(utilisateur);
    }

    @Override
    public List<Utilisateur> selectAllUser() {
        return repositoryUtilisateur.findAll();
    }

    @Override
    public void deleteUser(Integer id) {
        repositoryUtilisateur.deleteById(id);
    }

    @Override
    public Utilisateur getUserById(Integer id) {
        return repositoryUtilisateur.findById(id).get();
    }

    @Override
    public Optional<Utilisateur> findUserByEmailAndPassword(String email, String password) {
        return repositoryUtilisateur.findFirstByEmailAndPassword(email, password);
    }

    @Override
    public Utilisateur updateUser(Utilisateur user) {

        Utilisateur UserToUpdate = repositoryUtilisateur.findById(user.getId()).orElseThrow(() -> new RuntimeException("user introuvable"));
        UserToUpdate.setNom(user.getNom());
        UserToUpdate.setPrenom(user.getPrenom());
        UserToUpdate.setPassword(user.getPassword());
        UserToUpdate.setEmail(user.getEmail());
        UserToUpdate.setSexe(user.getSexe());
        UserToUpdate.setType(user.getType());


       return repositoryUtilisateur.save(UserToUpdate);
    }


}
