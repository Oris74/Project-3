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
                               Weapons.hache,
                               Weapons(name: "Epée", damage: 8),
                               Weapons(name: "Katana", damage: 11),
                               Weapons.dague,
                               Weapons.poignard,
                               Weapons(name: "Arbalète", damage: 10)]
   override init(life: Int, armor: Int, dexterity: Int) {
        if let myWeapon = weapons.randomElement() {
            self.weapon = myWeapon
        } else {
            self.weapon = Weapons(name: "dague", damage: 3)
        }
        super.init(life: life, armor: armor, dexterity: dexterity)
    }
   override func copy() -> Personages {
        let copy = Knight(life: self.lifePoints, armor: self.armor, dexterity: self.dexterity)
        return copy
    }
   override func displayStatus() -> String {
          if super.dead {
              return "\(name) de classe \(getClass()) DECEDE !"
          } else {
              if chest != nil {
                  return "\u{001B}[0;34m\(name) de classe \(getClass()) Force: " +
                      "\(super.lifePoints) Arme : \(weapon.name) (\(weapon.damage)) Dégats infligés: \(super.damage). \u{001B}[0;35m Coffre Découvert !!"
              } else {
                  return "\u{001B}[0;34m\(name) de classe \(getClass()) Force: " +
                         "\(super.lifePoints) Arme : \(weapon.name) (\(weapon.damage)) Dégats infligés: \(super.damage) "
              }

          }
      }
   override func attack(opponent: Personages) -> Bool {
         opponent.lifePoints -= (damage - (damage/opponent.armor))
         print("-=-"+Utilities.textJustifyCenter(text: "\(opponent.name) perd \((damage - (damage/opponent.armor)))", stringLenght: 94)+"-=-")
         if opponent.lifePoints <= 0 {
             opponent.lifePoints = 0
             opponent.dead = true
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
   override func healing(comrade: Personages) {
              print("Malheureusement, un chevalier ne peut soigner pesonne")
      }
   override func getWeapon()-> Weapons {
              if let myWeapon = weapons.randomElement() {
                 return myWeapon
              } else {
                 return Weapons(name: "Baton", damage: 1)
              }
          }
}
