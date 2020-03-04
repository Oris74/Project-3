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
    static let saber: Weapons = Weapons(name: "Sabre", damage: 20)
    static let axe: Weapons = Weapons(name: "Hache", damage: 28)
    static let knife: Weapons = Weapons(name: "Couteau", damage: 10)
    static let stick: Weapons = Weapons(name: "Baton", damage: 5)
    static let sword: Weapons = Weapons(name: "Epée", damage: 15)
    static let mace: Weapons = Weapons(name: "Masse", damage: 15)
    static let bow: Weapons = Weapons(name: "Arc", damage: 20)
    static let katana: Weapons = Weapons(name: "Katana", damage: 21)
    static let machete: Weapons = Weapons(name: "Machette", damage: 18)
    static let dagger: Weapons = Weapons(name: "Dague", damage: 5)
    static let poniard: Weapons = Weapons(name: "Poignard", damage: 5)
    static let flail: Weapons = Weapons(name: "Fléau", damage: 10)
    static let crossbow: Weapons = Weapons(name: "Arbalète", damage: 25)
    static let poison: Weapons = Weapons(name: "Poison", damage: 15)
    static let spell: Weapons = Weapons(name: "Sortilège", damage: 25)
    static let incantation: Weapons = Weapons(name: "Incantation", damage: 15)

    let name: String
    let damage: Int

    init (name: String, damage: Int) {
            self.name = name
            self.damage = damage
    }

}
