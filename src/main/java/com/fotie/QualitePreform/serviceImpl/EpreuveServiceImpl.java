package com.fotie.QualitePreform.serviceImpl;

import com.fotie.QualitePreform.model.Epreuve;
import com.fotie.QualitePreform.repository.EpreuveRepository;
import com.fotie.QualitePreform.service.EpreuveService;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class EpreuveServiceImpl implements EpreuveService {
    private final EpreuveRepository repositoryEpreuve;

    public EpreuveServiceImpl(EpreuveRepository repositoryEpreuve) {
        this.repositoryEpreuve = repositoryEpreuve;
    }

    @Override
    public void saveEpreuve(Epreuve epreuve) {
         repositoryEpreuve.save(epreuve);
    }

    @Override
    public List<Epreuve> getAllEpreuve() {
        return repositoryEpreuve.findAll();
    }

    @Override
    public void deleteEpreuve(Integer id) {
        repositoryEpreuve.deleteById(id);
    }

    @Override
    public Epreuve getEpreuveByName(String epreuveName) {
        Optional<Epreuve> epreuve = repositoryEpreuve.findEpreuveByNomEpreuve(epreuveName);
        if(epreuve.isPresent()){
            return epreuve.get();
        }
        return null;
    }
}
