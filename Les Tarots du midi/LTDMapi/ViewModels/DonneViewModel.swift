//
//  DonneViewModel.swift
//  LTDMapi
//
//  Created by Pilip Pro on 20/03/2018.
//

import Foundation

public class DonneViewModel {

    public init() {
    }

    public var players: [String] {
        // TODO
        return ["Joueur 1", "Joueur 2", "Joueur 3", "Joueur 4", "Joueur 5"]
    }
    
    public var nbPlayers: Int {
        return players.count
    }
    
    public var contrat: [String] {
        // TODO
        return ["Petite", "Garde", "Garde sans", "Garde contre"]
    }
    
    public var nbContrat: Int {
        return contrat.count
    }
    
    public var colors: [String] {
        // TODO
        return ["Carreau", "Coeur", "Pique", "Trèfle"]
    }
    
    public var nbColors: Int {
        return colors.count
    }
    
    public var petitIsOwned: Bool {
        // TODO
        return false
    }
    
    public var excuseIsOwned: Bool {
        // TODO
        return false
    }
    
    public var twentyOneIsOwned: Bool {
        // TODO
        return false
    }
    
    public var scoreMinValue: Float {
        return 0
    }
    
    public var scoreMaxValue: Float {
        return 91
    }
    
    public var scoreValue: Float {
        // TODO
        return 50
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
