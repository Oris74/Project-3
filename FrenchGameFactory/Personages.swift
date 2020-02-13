
//
//  Personages.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Personages {
    let category: String
    let name:String
    var lifePoints: Int
    let maxLifePoints: Int
    let weapon: Weapons
    var dead: Bool = false
    static let all: [Personages] =  [Personages(category: "Hunter", life: 50),
                                    Personages(category: "Wizard", life: 50),
                                    Personages(category: "Warrior", life: 50),
                                    Personages(category: "Priest", life: 50),
                                    Personages(category: "Knight", life: 50),
                                    Personages(category: "Enchanter", life: 50),
                                    Personages(category: "Druid", life: 50),
                                    Personages(category: "Barbarian", life: 50),
                                    Personages(category: "Paladin", life: 50),
                                    Personages(category: "Monk", life: 50),
                                    Personages(category: "Thief", life: 50),
                                    Personages(category: "Archer", life: 50),
                                    Personages(category: "Ranger", life: 50)]
    
    init(category:String, life: Int) {
        let name = Utilities.requestName(typeOfName: category, number: 1)
        self.category = category
        self.lifePoints = life
        let arm = selectWeapon(category)
        self.weapon = arm
    }
}
    

