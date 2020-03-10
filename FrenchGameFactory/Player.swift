//
//  Player.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Player {
     let name: String
     let team: Team
     let color: String

    init(color: String, playerName: String) {
        let playerName = Utilities.requestEntry(description: " \(color) \(playerName) - Veuillez saisir votre nom : ")
        self.name = playerName
        self.team = Team()
        self.color = color
    }
    //****************************************************
    func isLoser() -> Bool {
        if team.nbFighterAlive() > 0 {
            return false
        }
        return true
    }
}
