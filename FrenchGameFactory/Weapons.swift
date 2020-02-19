//
//  Weapons.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation
    //****************************************************************
    //***  Class Weapons
    //***  define caracteristics of weapons affected to combatant
    //****************************************************************

class Weapons {
    let name: String
    let damage: Int
    static let weapons: [Weapons] =  [Weapons(name: "Sabre", damage: 10),
       Weapons(name: "Hache", damage: 8),
       Weapons(name: "Couteau", damage: 3),
       Weapons(name: "Baton", damage: 1),
       Weapons(name: "Epée", damage: 8),
       Weapons(name: "Masse", damage: 5),
       Weapons(name: "Arc", damage: 12),
       Weapons(name: "Katana", damage: 11),
       Weapons(name: "Machette", damage: 8),
       Weapons(name: "Dague", damage: 3),
       Weapons(name: "Poignard", damage: 3),
       Weapons(name: "Fléau", damage: 5),
       Weapons(name: "Arbalète", damage: 10),
       Weapons(name: "Poison", damage: 15)]
    init (name: String, damage: Int) {
            self.name = name
            self.damage = damage
    }

}
