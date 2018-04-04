//
//  Model.swift
//  LTDMapi
//
//  Created by Maxime Lemort on 31/03/2018.
//

import Foundation

enum Equipe: String {
    case aucune
    case attaque
    case defense
    
    static let allValue: [Equipe] = [.aucune, .attaque, .defense]
}

enum Couleur: String {
    case pique
    case carreau
    case coeur
    case trefle
    
    static let allValue: [Couleur] = [.pique, .carreau, .coeur, .trefle]
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

func == (rhs: Joueur?, lhs: Joueur?) -> Bool {
    return rhs?.nb == lhs?.nb && rhs?.nom == lhs?.nom
}

struct Donne: Equatable {
    
    var nombreJoueurs: UInt8
    var prenneur: Joueur
    var contrat: Contrat
    var couleurAppel: Couleur?
    var appelé: Joueur?
    
    var petit: Equipe
    var excuse: Equipe
    var vingtEtUn: Equipe
    
    var petitAuBout: Equipe
    
    var poigné: Bool
    var doublePoigné: Bool
    var triplePoigné: Bool
    
    var chelem: Bool
    
    var points: UInt8
    
    var nbBoutAttaque: UInt8 {
        switch (petit, excuse, vingtEtUn) {
        case (.attaque, .defense, .defense), (.defense, .attaque, .defense), (.defense, .defense, .attaque):
            return 1
        case (.attaque, .attaque, .defense), (.attaque, .defense, .attaque), (.defense, .attaque, .attaque):
            return 2
        case (.attaque, .attaque, .attaque):
            return 3
        default:
            return 0
        }
    }
    
    var faite: Bool {
        return (chelem == false && points >= Donne.pointsAFaire(nombreDeBouts: nbBoutAttaque)) || (chelem && points == 91)
    }
    
    var mise: UInt16 {
        var mise = (25 + UInt16(abs(Donne.pointsAFaire(nombreDeBouts: nbBoutAttaque).distance(to: points)))) * UInt16(contrat.rawValue)
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
        if poigné { mise += 20 }
        if doublePoigné { mise += 30 }
        if triplePoigné { mise += 40 }
        if chelem { mise += 400 }
        return mise
    }
    
    static func pointsAFaire(nombreDeBouts: UInt8) -> UInt8 {
        switch nombreDeBouts {
        case 1:
            return 51
        case 2:
            return 41
        case 3:
            return 36
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
                if let appelé = appelé, joueur == prenneur && joueur == appelé {
                    return 4 * Int32(mise)
                } else if joueur == prenneur {
                    return 2 * Int32(mise)
                } else if let appelé = appelé, joueur == appelé {
                    return Int32(mise)
                }
                return -Int32(mise)
            } else {
                if let appelé = appelé, joueur == prenneur && joueur == appelé {
                    return -4 * Int32(mise)
                } else if joueur == prenneur {
                    return -2 * Int32(mise)
                } else if let appelé = appelé, joueur == appelé {
                    return -Int32(mise)
                }
                return Int32(mise)
            }
        }
        return 0
    }
    
    static func == (rhs: Donne, lhs: Donne) -> Bool {
        return rhs.nombreJoueurs == lhs.nombreJoueurs &&
            rhs.prenneur == lhs.prenneur &&
            rhs.contrat == lhs.contrat &&
            rhs.couleurAppel == lhs.couleurAppel &&
            rhs.appelé == lhs.appelé &&
            rhs.petit == lhs.petit &&
            rhs.excuse == lhs.excuse &&
            rhs.vingtEtUn == lhs.vingtEtUn &&
            rhs.petitAuBout == lhs.petitAuBout &&
            rhs.poigné == lhs.poigné &&
            rhs.doublePoigné == lhs.doublePoigné &&
            rhs.triplePoigné == lhs.triplePoigné &&
            rhs.chelem == lhs.chelem &&
            rhs.points == lhs.points
    }
    
}

var donnes = [Donne]()

var joueurs: [Joueur] = [(nb: 1, nom: "Joueur1"),
                         (nb: 2, nom: "Joueur2"),
                         (nb: 3, nom: "Joueur3"),
                         (nb: 4, nom: "Joueur4"),
                         (nb: 5, nom: "Joueur5")]
