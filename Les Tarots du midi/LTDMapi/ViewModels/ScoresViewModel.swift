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
        // TODO
        return 1
    }
    
    public func playerViewModel() -> PlayersViewModel {
        // TODO
        return PlayersViewModel()
    }
    
    public func totalScoreViewModel() -> TotalScoreViewModel {
        // TODO
        return TotalScoreViewModel()
    }
    
    public func donneScoreViewModel(at index: Int) -> DonneScoreViewModel {
        // TODO
        return DonneScoreViewModel()
    }
    
    public func donneViewModel() -> DonneViewModel {
        // TODO
        return DonneViewModel()
    }
    
    public func resetScores() {
        // TODO reset everything stored in memory / CORE DATA
    }

}
