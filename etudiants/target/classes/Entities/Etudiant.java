package com.ism.exam.entities;

import java.util.List;

import jakarta.persistence.*;
import lombok.*;


@Entity
@Table(name = "etudiant")
@DiscriminatorValue(value = "Etudiant")
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter

public class Etudiant  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="adresse_email",nullable = false)
    protected String adresseEmail;

    @Column(name="matricule")
    protected String matricule;

   
    @Column(name="nomComplet")
    protected String nomComplet;

    public Etudiant(Long id) {
        this.id = id;
    }

    public Etudiant(Long id, String nomComplet) {
        this.id = id;
        this.nomComplet = nomComplet;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "classe_id")
    private Classe classe;

}
