package com.ism.exam.repositories;


import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.ism.exam.entities.Etudiant;

@Repository
public interface EtudiantRepository extends JpaRepository<Etudiant, Long> {
    List<Etudiant> findByDateAndClasse(LocalDate date, Long classeId);
    List<Etudiant> findByClasse(Long classeId);
}
