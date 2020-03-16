//
//  PlayerBuilder.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 14/03/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation
class PlayerBuilder {

    //******************************************
    static func requestPlayerName(flag: String, defaultName: String) -> Player {
        let name = Utilities.requestEntry(description: " \(flag) \(defaultName) - Veuillez saisir votre nom : ")
        return Player(flag: flag, playerName: name)
      }

}
