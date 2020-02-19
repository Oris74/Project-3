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
    var damage: Int {
          let globalDamage = (weapon.damage * dexterity * armor)/3
          return globalDamage
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
    func displayStatus() -> String {
              return "\(name) de classe \(getClass()) dispose de " +
          "\(super.lifePoints) points de vie ! Arme utilisée : \(weapon.name) => Dégat: \(weapon.damage)."
          }
    override func getClass() -> String {
        return "Hunter"
    }
}
