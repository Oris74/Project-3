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

class Player {
    let name: String
    let playerTeam: Teams
    
    init(name: String) {
        self.name = name
        let team = Teams.selection()
        self.playerTeam = team
    }
    
    static func attack(opponent: Personages){
        
    }
}
