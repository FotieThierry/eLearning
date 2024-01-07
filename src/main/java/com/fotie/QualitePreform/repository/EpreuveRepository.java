package com.fotie.QualitePreform.repository;

import com.fotie.QualitePreform.model.Epreuve;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface EpreuveRepository extends JpaRepository<Epreuve, Integer> {

    List<Epreuve> findEpreuveByDomaine(String domaine);

    //@Query(value = "select * from epreuve where nom_epreuve=:nomEpreuve;", nativeQuery = true)
    Optional<Epreuve> findEpreuveByNomEpreuve(String nomEpreuve);

}
