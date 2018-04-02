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

    public var players: [String] {
        return joueurs.map { $0.nom }
    }
    
    public var nbPlayers: Int {
        return joueurs.count
    }
    
    public var contrat: [String] {
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
        return String(scoreValue)
    }
    
    public var defenseScore: String {
        return String(scoreMaxValue - scoreValue)
    }
    
    public func computeScore() {
        // TODO
    }
    
}
