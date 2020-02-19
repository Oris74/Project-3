//
//  Druid.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

//****************************************************************
//***  Class Druid
//***
//****************************************************************
class Druid: Personages {
    var healing: Int = 50
    var damage: Int {
          return 4
    }
    override init(life: Int, armor: Int, dexterity: Int) {
        super.init( life: 50, armor: 5, dexterity: 25)
    }
}
