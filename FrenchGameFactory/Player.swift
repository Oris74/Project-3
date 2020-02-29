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
    var opponent: Teams?
    init(playerName: String) {
        self.name = playerName
    }
}
