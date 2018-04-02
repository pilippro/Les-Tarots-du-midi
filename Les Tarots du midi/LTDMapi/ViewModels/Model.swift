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
    
    static let allValue: [Contrat] = [.petite, .garde, .gardeSans, .gardeContre]
}

typealias Joueur = (nb: UInt8, nom: String)

struct Donne {
    
    private var nombreJoueurs: UInt8
    private var prenneur: Joueur
    private var contrat: Contrat
    private var couleurAppel: Couleur?
    private var appelé: Joueur?
    
    private var petit: Equipe
    private var excuse: Equipe
    private var vingtEtUn: Equipe
    
    private var petitAuBout: Equipe?
    
    private var poigné: Equipe?
    private var doublePoigné: Equipe?
    private var triplePoigné: Equipe?
    
    private var chelem: Bool
    
    private var points: UInt8
    
    private var nbBoutAttaque: UInt8 {
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
        return (chelem == false && points >= Donne.pointsAFaire(nombreDeBouts: nbBoutAttaque)) || (chelem && points == 91)
    }
    
    private var mise: UInt16 {
        var mise = (25 + UInt16(Donne.pointsAFaire(nombreDeBouts: nbBoutAttaque).distance(to: points))) * UInt16(contrat.rawValue)
        if faite {
            if petitAuBout == .attaque {
                mise += (10 * UInt16(contrat.rawValue))
            } else if petitAuBout == .defense {
                mise -= (10 * UInt16(contrat.rawValue))
            }
        } else {
            if petitAuBout == .attaque {
                mise -= (10 * UInt16(contrat.rawValue))
            } else if petitAuBout == .defense {
                mise += (10 * UInt16(contrat.rawValue))
            }
        }
        if poigné != nil { mise += 20 }
        if doublePoigné != nil { mise += 30 }
        if triplePoigné != nil { mise += 40 }
        if chelem { mise += 400 }
        return mise
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
    
    func score(duJoueur joueur: Joueur) -> Int32 {
        if nombreJoueurs == 3 {
            if faite {
                if joueur == prenneur {
                    return 2 * Int32(mise)
                }
                return -Int32(mise)
            } else {
                if joueur == prenneur {
                    return -2 * Int32(mise)
                }
                return Int32(mise)
            }
        } else if nombreJoueurs == 4 {
            if faite {
                if joueur == prenneur {
                    return 3 * Int32(mise)
                }
                return -Int32(mise)
            } else {
                if joueur == prenneur {
                    return -3 * Int32(mise)
                }
                return Int32(mise)
            }
        } else if nombreJoueurs == 5 {
            if faite {
                if joueur == prenneur {
                    return 2 * Int32(mise)
                } else if let appelé = appelé, joueur == appelé {
                    return Int32(mise)
                }
                return -Int32(mise)
            } else {
                if joueur == prenneur {
                    return -2 * Int32(mise)
                } else if let appelé = appelé, joueur == appelé {
                    return -Int32(mise)
                }
                return Int32(mise)
            }
        }
        return 0
    }
    
}

var donnes = [Donne]()

var joueurs: [Joueur] = [(nb: 1, nom: "Joueur 1"),
                         (nb: 2, nom: "Joueur 2"),
                         (nb: 3, nom: "Joueur 3"),
                         (nb: 4, nom: "Joueur 4"),
                         (nb: 5, nom: "Joueur 5")]
