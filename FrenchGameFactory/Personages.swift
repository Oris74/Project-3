//
//  Personages.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Personages {
    var name: String = ""
    var lifePoints: Int
    var damage: Int {
      return (dexterity / 3)
    }
    let maxLifePoints: Int
    let armor: Int
    let dexterity: Int
    var dead: Bool = false
    var chest: Chest?
    init(life: Int, armor: Int, dexterity: Int) {
        self.lifePoints = life
        self.maxLifePoints = lifePoints
        self.armor = armor
        self.dexterity = dexterity
    }
   func copy() -> Personages {
        let copy = Personages(life: self.lifePoints, armor: self.armor, dexterity: self.dexterity)
        return copy
    }
    func getClass() -> String {
        return "Personages"
    }
    func displayStatus() -> String {
        if dead {
            return "\(name) de classe \(getClass()) DECEDE !"
        } else {
            return "\(name) de classe \(getClass()) force:  " +
            "\(lifePoints) Armure: \(armor) Dexterité: \(dexterity)"
        }
    }
    func attack(opponent: Personages) -> Bool {
           opponent.lifePoints -= (damage - (damage/opponent.armor))
           print("-=-"+Utilities.textJustifyCenter(text: "\(opponent.name) perd \((damage - (damage/opponent.armor)))", stringLenght: 94)+"-=-")
           if opponent.lifePoints <= 0 {
               opponent.lifePoints = 0
               opponent.dead = true
               return true
           }
           return false
       }
    func isHealer() -> Bool {
        return false
    }
    func healing(comrade: Personages) {
        print("malheureusement \(comrade.name) n'a pas le don de soigner")
    }
    func getWeapon() -> Weapons {
        return Weapons(name: "Baton", damage: 1)
       }
}
