//
//  Player.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

//****************************************************************
//***  Class Player
//***  manage a player
//***************************************************************

class Player  {
    let name: String
    let team: Teams
    var opponent: Player? = nil
    init(name: String) {
        self.name = name
        self.team = Teams()
    }
    static func attack(opponent: Personages) {
    }
}
