//
//  Paladin.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Paladin: Personage {

      //*************************************************
    init() {
        let armory: [Weapon] = [
            Weapon.sword,
            Weapon.axe,
            Weapon.sword,
            Weapon.katana,
            Weapon.dagger,
            Weapon.poniard,
            Weapon.crossbow,
            Weapon.mace
        ]
        super.init(life: 40, armor: 30, dexterity: 50, armory: armory)
     }

     //*************************************************
     override func copy() -> Personage {
        let copy = Paladin()
        return copy
     }

    //**********************************************
      override func getClass() -> String {
        return "Paladin"
      }

}
