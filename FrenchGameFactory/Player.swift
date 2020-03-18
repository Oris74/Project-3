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
    let flag: String
    let team: Team

    init(flag: String, playerName: String) {
        self.name = playerName
        self.flag = flag
        self.team = Team()
    }

    //****************************************************
    func isLoser() -> Bool {
       if team.nbFighterAlive() > 0 {
        return false
         }
        return true
    }
}
