//
//  wizard.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

//****************************************************************
//***  Class Wizard
//***
//****************************************************************

class Wizard: Personages {
    var healing: Int = 25
    var damage: Int {
               let globalDamage = (weapon.damage * dexterity * armor)/3
               return globalDamage
       }
    let weapon: Weapons
    let weapons: [Weapons] =  [Weapons(name: "Sabre", damage: 10),
            Weapons(name: "Baton", damage: 1),
            Weapons(name: "Dague", damage: 3),
            Weapons(name: "Poignard", damage: 3),
            Weapons(name: "Poison", damage: 15),
            Weapons(name: "Sortilège", damage: 30),
            Weapons(name: "Incantation", damage: 15)]
    override init(life: Int, armor: Int, dexterity: Int) {
        if let myWeapon = weapons.randomElement() {
             self.weapon = myWeapon
        } else {
             self.weapon =  Weapons(name: "Baton", damage: 1)
        }
        super.init(life: life, armor: armor, dexterity: dexterity)
    }
    func displayStatus() -> String {
            return "\(name) de classe \(getClass()) dispose de\(lifePoints) points de vie ! Arme utilisée : \(weapon.name) => Dégat: \(weapon.damage). Soins : \(healing)"
        }
    
    override func getClass() -> String {
         return "Wizard"
     }
}
