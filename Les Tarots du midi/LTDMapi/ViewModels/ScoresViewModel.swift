//
//  ScoresViewModel.swift
//  LTDMapi
//
//  Created by Pilip Pro on 19/03/2018.
//

import Foundation

public class ScoresViewModel {

    public init() {
    }
    
    public var numberOfDonnes: Int {
        return donnes.count
    }
    
    public func playerViewModel() -> PlayersViewModel {
        return PlayersViewModel()
    }
    
    public func totalScoreViewModel() -> TotalScoreViewModel {
        return TotalScoreViewModel()
    }
    
    public func donneScoreViewModel(at index: Int) -> DonneScoreViewModel {
        return DonneScoreViewModel(donne: donnes[index])
    }
    
    public func donneViewModel(at index: Int?) -> DonneViewModel {
        return DonneViewModel(donne: index.flatMap { donnes[$0] })
    }
    
    public func resetScores() {
        donnes.removeAll()
        joueurs = [(nb: 1, nom: "Joueur1"),
                   (nb: 2, nom: "Joueur2"),
                   (nb: 3, nom: "Joueur3"),
                   (nb: 4, nom: "Joueur4"),
                   (nb: 5, nom: "Joueur5")]
    }
    
    public func removeDonne(at index: Int) {
        donnes.remove(at: index)
    }
    
    public func joueur(atIndex index: Int, changeNameTo name: String) {
        joueurs[index].nom = name
    }

}
