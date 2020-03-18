//
//  Hunter.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Hunter: Personage {

    //**************************************************
    init() {
        let armory = [
            Weapon.axe,
            Weapon.knife,
            Weapon.bow,
            Weapon.katana,
            Weapon.machete,
            Weapon.dagger,
            Weapon.poniard,
            Weapon.crossbow
        ]
        super.init(life: 40, armor: 20, dexterity: 50, armory: armory)
    }

    //*************************************************
    override func copy() -> Personage {
        let copy = Hunter()
        return copy
    }

    //************************************************
    override func getClass() -> String {
        return "Hunter"
    }

}
