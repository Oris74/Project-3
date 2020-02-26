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
    let weapons: [Weapons] =  [Weapons.hache,
                               Weapons.couteau,
                               Weapons.arc,
                               Weapons.katana,
                               Weapons.machette,
                               Weapons.dague,
                               Weapons.poignard,
                               Weapons.arbalete]

    override init(life: Int, armor: Int, dexterity: Int) {
         if let myWeapon = weapons.randomElement() {
                   self.weapon = myWeapon
               } else {
                   self.weapon = Weapons(name: "gague", damage: 3)
               }
        super.init(life: life, armor: armor, dexterity: dexterity)
    }
    override func copy() -> Personages {
        let copy = Hunter(life: self.lifePoints, armor: self.armor, dexterity: self.dexterity)
        return copy
    }
    override func displayStatus() -> String {
        if super.dead {
            return "\(name) de classe \(getClass()) DECEDE !"
        } else {
            if chest != nil {
                return "\(name) de classe \(getClass()) Force: " +
                    "\(super.lifePoints) Arme : \(weapon.name) (\(weapon.damage)) Dégats infligés: \(super.damage). \u{1F381} "
            } else {
                return "\(name) de classe \(getClass()) Force: " +
                       "\(super.lifePoints) Arme : \(weapon.name) (\(weapon.damage)) Dégats infligés: \(super.damage) "
            }
        }
    }

   override func attack(opponent: Personages) -> Bool {
        opponent.lifePoints -= (damage - (damage/opponent.armor))
        print("-=-"+Utilities.textJustifyCenter(text: "\(opponent.name) perd \((damage - (damage/opponent.armor))) points", stringLenght: 94)+"-=-")
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
   override func healing(comrade: Personages) {
        print("malheureusement \(comrade.name) n'a pas le don de soigner")
    }
   override func getWeapon() -> Weapons {
           if let myWeapon = weapons.randomElement() {
              return myWeapon
           } else {
              return Weapons(name: "Baton", damage: 1)
           }
       }
}
