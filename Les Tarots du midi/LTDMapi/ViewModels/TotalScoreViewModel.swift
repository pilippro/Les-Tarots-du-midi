//
//  TotalScoreViewModel.swift
//  LTDMapi
//
//  Created by Pilip Pro on 19/03/2018.
//

import Foundation

public class TotalScoreViewModel {
    
    public init() {
    }
    
    public func score(ofPlayer player: Int) -> String {
        return String(donnes.reduce(0) { result, donne in
            return result + donne.score(duJoueur: joueurs[player])
        })
    }
    
}
