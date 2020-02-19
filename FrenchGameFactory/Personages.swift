//
//  Personages.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Personages {

    var name: String = ""
    var lifePoints: Int
    let maxLifePoints: Int
    let armor: Int
    let dexterity: Int
    var dead: Bool = false
    init(life: Int, armor: Int, dexterity: Int) {
        self.lifePoints = life
        self.maxLifePoints = lifePoints
        self.armor = armor
        self.dexterity = dexterity
    }
    
    func getClass() -> String
    {
        return "Personages"
    }
  
}
