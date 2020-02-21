//
//  Knight.swift
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
class Knight: Personages {
    override var damage: Int {
        return (weapon.damage + (dexterity / 3))
    }
    let weapon: Weapons
    let weapons: [Weapons] =  [Weapons(name: "Sabre", damage: 10),
       Weapons(name: "Hache", damage: 8),
       Weapons(name: "Epée", damage: 8),
       Weapons(name: "Katana", damage: 11),
       Weapons(name: "Dague", damage: 3),
       Weapons(name: "Poignard", damage: 3),
       Weapons(name: "Arbalète", damage: 10)]
    override init(life: Int, armor: Int, dexterity: Int) {
        if let myWeapon = weapons.randomElement() {
            self.weapon = myWeapon
        } else {
            self.weapon = Weapons(name: "Dague", damage: 3)
        }
        super.init(life: life, armor: armor, dexterity: dexterity)
    }
    override func displayStatus() -> String {
        if super.dead {
            return "\(super.name) de classe \(getClass()) DECEDE !"
        } else {
            return "\(super.name) de classe \(getClass()) Force: \(lifePoints) Arme: \(weapon.name) => Dégat: \(weapon.damage). Armure: \(armor)"
        }
    }
  override func attack(opponent: Personages) -> Bool {
        opponent.lifePoints -= damage
        if opponent.lifePoints <= 0 {
            opponent.lifePoints = 0
            opponent.dead = true
            print("Victoire !! Votre adversaire est terrassé")
            return true
        }
        return false
    }
    override func getClass() -> String {
        return "Knight"
    }
    override func isHealer() -> Bool {
        return false
    }
     override func healing(comrade: Personages) -> Bool {
              print("Malheureusement, un chevalier ne peut soigner pesonne")
        return false
      }
}
