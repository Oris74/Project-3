//
//  Warrior.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

//****************************************************************
 //***  Class Warrior
 //***  
 //****************************************************************
class Warrior: Personages {
   override init(life: Int, armor: Int, dexterity: Int) {
   super.init( life: 50, armor: 70, dexterity: 50)
      }
    override func healing(comrade: Personages) -> Bool {
        print("malheureusement \(comrade.name) n'a pas le don de soigner")
        return false
    }
}
