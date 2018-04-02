//
//  DonneViewModel.swift
//  LTDMapi
//
//  Created by Pilip Pro on 20/03/2018.
//

import Foundation

public class DonneViewModel {

    var donne: Donne?
    
    init(donne: Donne?) {
        self.donne = donne
    }
    
    public var prenneur: Int {
        return Int(donne?.prenneur.nb ?? 0)
    }
    
    public var appelé: Int {
        return Int(donne?.appelé?.nb ?? 0)
    }
    
    public var roi: Int {
        return donne?.couleurAppel?.hashValue ?? 0
    }
    
    public var contrat: Int {
        return donne?.contrat.hashValue ?? 0
    }
    
    public var chelem: Bool {
        return donne?.chelem ?? false
    }

    public var players: [String] {
        return joueurs.map { $0.nom }
    }
    
    public var nbPlayers: Int {
        return joueurs.count
    }
    
    public var contrats: [String] {
        return Contrat.allValue.map { $0.description }
    }
    
    public var nbContrat: Int {
        return Contrat.allValue.count
    }
    
    public var colors: [String] {
        return Couleur.allValue.map { $0.rawValue }
    }
    
    public var nbColors: Int {
        return Couleur.allValue.count
    }
    
    public var petitIsOwned: Bool {
        return donne?.petit == .attaque
    }
    
    public var excuseIsOwned: Bool {
        return donne?.excuse == .attaque
    }
    
    public var twentyOneIsOwned: Bool {
        return donne?.vingtEtUn == .attaque
    }
    
    public var scoreMinValue: Float {
        return 0
    }
    
    public var scoreMaxValue: Float {
        return 91
    }
    
    public var scoreValue: Float {
        return Float(donne?.points ?? 50)
    }
    
    public var attaqueScore: String {
        return String(Int(scoreValue))
    }
    
    public var defenseScore: String {
        return String(Int(scoreMaxValue - scoreValue))
    }
    
    //swiftlint:disable:next function_parameter_count
    public func computeScore(nombreJoueurs: UInt8, prenneur: Int, contrat: Int, couleurAppel: Int?, appelé: Int?, petit: Bool, excuse: Bool, vingtEtUn: Bool, petitAuBout: Int?, poigné: Int?, doublePoigné: Int?, triplePoigné: Int?, chelem: Bool, points: UInt8) {
        if donne == nil {
            donne = Donne(nombreJoueurs: nombreJoueurs,
                          prenneur: joueurs[prenneur],
                          contrat: Contrat.allValue[contrat],
                          couleurAppel: couleurAppel.flatMap { Couleur.allValue[$0] },
                          appelé: appelé.flatMap { joueurs[$0] },
                          petit: petit ? Equipe.attaque : Equipe.defense,
                          excuse: excuse ? Equipe.attaque : Equipe.defense,
                          vingtEtUn: vingtEtUn ? Equipe.attaque : Equipe.defense,
                          petitAuBout: petitAuBout.flatMap { Equipe.allValue[$0] },
                          poigné: poigné.flatMap { Equipe.allValue[$0] },
                          doublePoigné: doublePoigné.flatMap { Equipe.allValue[$0] },
                          triplePoigné: triplePoigné.flatMap { Equipe.allValue[$0] },
                          chelem: chelem,
                          points: points)
            //swiftlint:disable:next force_unwrapping
            donnes.append(donne!)
        } else {
            //swiftlint:disable:next force_unwrapping
            let indexToRemove = donnes.index { $0 == donne! }!
            donne?.nombreJoueurs = nombreJoueurs
            donne?.prenneur = joueurs[prenneur]
            donne?.contrat = Contrat.allValue[contrat]
            donne?.couleurAppel = couleurAppel.flatMap { Couleur.allValue[$0] }
            donne?.appelé = appelé.flatMap { joueurs[$0] }
            donne?.petit = petit ? Equipe.attaque : Equipe.defense
            donne?.excuse = excuse ? Equipe.attaque : Equipe.defense
            donne?.vingtEtUn = vingtEtUn ? Equipe.attaque : Equipe.defense
            donne?.petitAuBout = petitAuBout.flatMap { Equipe.allValue[$0] }
            donne?.poigné = poigné.flatMap { Equipe.allValue[$0] }
            donne?.doublePoigné = doublePoigné.flatMap { Equipe.allValue[$0] }
            donne?.triplePoigné = triplePoigné.flatMap { Equipe.allValue[$0] }
            donne?.chelem = chelem
            donne?.points = points
            //swiftlint:disable:next force_unwrapping
            donnes.insert(donne!, at: indexToRemove)
            donnes.remove(at: indexToRemove + 1)
        }
    }
    
}
