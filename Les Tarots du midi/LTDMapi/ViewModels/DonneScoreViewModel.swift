//
//  DonneScoreViewModel.swift
//  LTDMapi
//
//  Created by Pilip Pro on 19/03/2018.
//

import Foundation

public class DonneScoreViewModel {

    var donne: Donne
    
    init(donne: Donne) {
        self.donne = donne
    }

    public func score(ofPlayer player: Int) -> String {
        return String(donne.score(duJoueur: joueurs[player]))
    }

}
