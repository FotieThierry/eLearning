package com.fotie.QualitePreform.repository;

import com.fotie.QualitePreform.model.Epreuve;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EpreuveRepository extends JpaRepository<Epreuve, Integer> {

    List<Epreuve> findEpreuveByDomaine(String domaine);
}
