//
//  Knight.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Knight: Personage {

    //*************************************************
    init() {
        let armory: [Weapon] =  [
            Weapon.saber,
            Weapon.axe,
            Weapon.sword,
            Weapon.katana,
            Weapon.dagger,
            Weapon.poniard,
            Weapon.crossbow
        ]
        super.init(life: 40, armor: 30, dexterity: 40, armory: armory)
    }

    //*************************************************
    override func copy() -> Personage {
        let copy = Knight()
        return copy
    }

    //**********************************************
    override func getClass() -> String {
        return "Knight"
    }

}
