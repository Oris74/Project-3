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
    override var damage: Int {
        return 4
    }
    override init(life: Int, armor: Int, dexterity: Int) {
        super.init( life: 50, armor: 5, dexterity: 25)
    }
    override func isHealer() -> Bool {
           return true
       }
  override func healing(comrade: Personages) -> Bool {
        let lifeNeeded = maxLifePoints-lifePoints
        switch healing {
        case 0:
            print("Malheureusement, votre soigneur manque d'energie. Il doit se reposer")
            return false
        case healing where healing > lifeNeeded:
            comrade.lifePoints = comrade.maxLifePoints
            healing-=lifeNeeded
        case healing where healing < lifeNeeded:
            comrade.lifePoints += healing
            healing = 0
        default: break
        }
        return true
    }
}
