//
//  Thief.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Thief: Personage {

    //**************************************************
    init() {
        let armory: [Weapon] = [
            Weapon.axe,
            Weapon.knife,
            Weapon.bow,
            Weapon.katana,
            Weapon.machete,
            Weapon.dagger,
            Weapon.poniard,
            Weapon.crossbow
        ]
            super.init(life: 40, armor: 10, dexterity: 70, armory: armory)
    }

   //*************************************************
    override func copy() -> Personage {
        let copy = Thief()
        return copy
    }

    //************************************************
    override func getClass() -> String {
        return "Thief"
    }

}
