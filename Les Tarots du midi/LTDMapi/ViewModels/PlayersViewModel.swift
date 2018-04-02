//
//  PlayersViewModel.swift
//  LTDMapi
//
//  Created by Pilip Pro on 19/03/2018.
//

import Foundation

public class PlayersViewModel {
    
    public init() {
    }
    
    public func name(at index: Int) -> String {
        return joueurs[index].nom
    }
    
}
