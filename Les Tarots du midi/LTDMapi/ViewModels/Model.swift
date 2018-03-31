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

enum Couleur: String {
    case pique
    case carreau
    case coeur
    case trefle
}

enum Contrat: UInt8, CustomStringConvertible {
    case petite = 1
    case garde = 2
    case gardeSans = 4
    case gardeContre = 6
    
    var description: String {
        switch self {
        case .petite:
            return "petite"
        case .garde:
            return "garde"
        case .gardeSans:
            return "garde sans"
        case .gardeContre:
            return "garde contre"
        }
    }
}

typealias Joueur = (nb: UInt8, nom: String, score: Int)

struct Donne {
    
    var nombreJoueurs: UInt8
    var prenneur: Joueur
    var contrat: Contrat
    var couleurAppel: Couleur?
    var appelé: Joueur?
    
    var petit: Equipe
    var excuse: Equipe
    var vingtEtUn: Equipe
    
    var petitAuBout: Equipe?
    
    var poigné: Equipe?
    var doublePoigné: Equipe?
    var triplePoigné: Equipe?
    
    var chelem: Bool
    
    var points: UInt8
    
    var nbBoutAttaque: UInt8 {
        switch (petit, excuse, vingtEtUn) {
        case (.defense, .defense, .defense):
            return 0
        case (.attaque, .defense, .defense), (.defense, .attaque, .defense), (.defense, .defense, .attaque):
            return 1
        case (.attaque, .attaque, .defense), (.attaque, .defense, .attaque), (.defense, .attaque, .attaque):
            return 2
        case (.attaque, .attaque, .attaque):
            return 3
        }
    }
    
    var faite: Bool {
        return points >= Donne.pointsAFaire(nombreDeBouts: nbBoutAttaque)
    }
    
    var score: UInt8 {
        //TODO: petit au bout et poigné
        return (UInt8(25) + UInt8(Donne.pointsAFaire(nombreDeBouts: nbBoutAttaque).distance(to: points))) * contrat.rawValue
    }
    
    static private func pointsAFaire(nombreDeBouts: UInt8) -> UInt8 {
        switch nombreDeBouts {
        case 1:
            return 51
        case 2:
            return 41
        case 3:
            return 38
        default:
            return 56
        }
    }
}

var donnes = [Donne]()

var joueurs: [Joueur] = [(nb: 1, nom: "Joueur 1", score: 0),
                         (nb: 2, nom: "Joueur 2", score: 0),
                         (nb: 3, nom: "Joueur 3", score: 0),
                         (nb: 4, nom: "Joueur 4", score: 0),
                         (nb: 5, nom: "Joueur 5", score: 0)]
