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
   
    static let sabre: Weapons = Weapons(name: "Sabre", damage: 10)
    static let hache: Weapons = Weapons(name: "Hache", damage: 8)
    static let couteau: Weapons = Weapons(name: "Couteau", damage: 3)
    static let baton: Weapons = Weapons(name: "Baton", damage: 1)
    static let epee: Weapons = Weapons(name: "Epée", damage: 8)
    static let masse: Weapons = Weapons(name: "Masse", damage: 5)
    static let arc: Weapons = Weapons(name: "Arc", damage: 12)
    static let katana: Weapons = Weapons(name: "Katana", damage: 11)
    static let machette: Weapons = Weapons(name: "Machette", damage: 8)
    static let dague: Weapons = Weapons(name: "Dague", damage: 3)
    static let poignard: Weapons = Weapons(name: "Poignard", damage: 3)
    static let fleau: Weapons = Weapons(name: "Fléau", damage: 5)
    static let arbalete: Weapons = Weapons(name: "Arbalète", damage: 10)
    static let poison: Weapons = Weapons(name: "Poison", damage: 15)
    static let sortilege: Weapons = Weapons(name: "Sortilège", damage: 30)
    static let incantation: Weapons = Weapons(name: "Incantation", damage: 15)
    
    init (name: String, damage: Int) {
            self.name = name
            self.damage = damage
    }

}
