//
//  Model.swift
//  LTDMapi
//
//  Created by Maxime Lemort on 31/03/2018.
//

import Foundation

enum Equipe: String {
    case attaque
    case defense
}

typealias Joueur = (nb: UInt8, nom: String)

struct Donne {
    
    var prenneur: Joueur
    var appelé: Joueur
    
    var petit: Equipe
    var excuse: Equipe
    var vingtEtUn: Equipe
    
    var petitAuBout: Equipe?
    var poigné: Equipe?
    var doublePoigné: Equipe?
    var triplePoigné: Equipe?
    
    var points: UInt8
    
}

var donnes = [Donne]()

var joueurs: [Joueur] = [(nb: 1, nom: "Joueur 1"),
                         (nb: 2, nom: "Joueur 2"),
                         (nb: 3, nom: "Joueur 3"),
                         (nb: 4, nom: "Joueur 4"),
                         (nb: 5, nom: "Joueur 5")]
