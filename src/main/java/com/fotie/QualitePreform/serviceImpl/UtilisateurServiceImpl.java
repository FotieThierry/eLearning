package com.fotie.QualitePreform.serviceImpl;

import com.fotie.QualitePreform.model.Utilisateur;
import com.fotie.QualitePreform.repository.UtilisateurRepository;
import com.fotie.QualitePreform.service.UtilisateurService;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

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
}
