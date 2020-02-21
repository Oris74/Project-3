//
//  Hunter.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

//****************************************************************
//***  Class Wizard
//***
//****************************************************************
class Hunter: Personages {
 override var damage: Int {
        return (weapon.damage + (dexterity / 2))
       }
    let weapon: Weapons
    let weapons: [Weapons] =  [Weapons(name: "Hache", damage: 8),
    Weapons(name: "Couteau", damage: 3),
    Weapons(name: "Arc", damage: 12),
    Weapons(name: "Katana", damage: 11),
    Weapons(name: "Machette", damage: 8),
    Weapons(name: "Dague", damage: 3),
    Weapons(name: "Poignard", damage: 3),
    Weapons(name: "Arbalète", damage: 10)]

    override init(life: Int, armor: Int, dexterity: Int) {
        if let weapon = weapons.randomElement() {
             self.weapon = weapon
        } else {
             self.weapon =  Weapons(name: "Dague", damage: 3)
        }
        super.init(life: life, armor: armor, dexterity: dexterity)
    }
    override func displayStatus() -> String {
        if super.dead {
            return "\(name) de classe \(getClass()) DECEDE !"
        } else {
            return "\(name) de classe \(getClass()) Force: " +
          "\(super.lifePoints) Arme : \(weapon.name) => Dégat: \(damage)."
        }
    }
    override func attack(opponent: Personages) -> Bool {
        opponent.lifePoints -= (damage - opponent.armor)
        if opponent.lifePoints <= 0 {
            opponent.lifePoints = 0
            opponent.dead = true
            return true
        }
        return false
    }
    override func getClass() -> String {
        return "Hunter"
    }
    override func isHealer() -> Bool {
        return false
       }
    override func healing(comrade: Personages) -> Bool {
        print("malheureusement \(comrade.name) n'a pas le don de soigner")
        return false
    }
}
