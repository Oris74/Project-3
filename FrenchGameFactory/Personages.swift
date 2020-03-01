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
    let maxLifePoints: Int

    var damage: Int {
       return (dexterity / 100)
    }
    let armor: Int

    let dexterity: Int

    var dead: Bool = false

    //***********************************************
    init(life: Int, armor: Int, dexterity: Int) {
        self.lifePoints = life
        self.maxLifePoints = lifePoints
        self.armor = armor
        self.dexterity = dexterity
    }

    //***********************************************
    func copy() -> Personages {
        let copy = Personages(life: self.lifePoints, armor: self.armor, dexterity: self.dexterity)
        return copy
    }

    //***********************************************
    func getClass() -> String {
        return "Personages"
    }

    //***********************************************
    func displayStatus() -> String {
        if dead {
            return "💀 \(Utilities.txtColumn(text: name, size: 10)) de classe" +
                   " \(Utilities.txtColumn(text: getClass(), size: 10)) ⚰️ !"
            } else {
               return "👺 \(Utilities.txtColumn(text: name, size: 10)) de classe" +
                   " \(Utilities.txtColumn(text: getClass(), size: 10))" +
                   "\t💛: \(Utilities.txtColumn(text: String(lifePoints), size: 3))" +
                   "\t🛡: \(Utilities.txtColumn(text: String(armor), size: 3))" +
                   "\t🏃: \(Utilities.txtColumn(text: String(dexterity), size: 3))"
            }
        }

    //***********************************************
    //*** function attack
    //*** opponent: personages who receive the attack
    //*** return Bool:  True => opponent killed
    //**********************************************
    func attack(opponent: Personages) -> Bool {
        let lostPoint = (damage - (damage * opponent.armor/100))
        opponent.lifePoints -= lostPoint

        if opponent.lifePoints > 0 {
           Utilities.blockTxt(typeCar: "⚔️",
                              blockTxt: ["\(opponent.name) perd \(lostPoint) points",
                              opponent.displayStatus()]
            )
        return false
        }

        opponent.lifePoints = 0              //if lifepoint < 0 then lifepoint = 0
        opponent.dead = true
        return true
    }

    //***********************************************
    func isHealer() -> Bool {
        return false
    }

    //***********************************************
    func healing(comrade: Personages) {
        print("⚠️ malheureusement \(comrade.name) n'a pas le don de soigner")
    }

    //**********************************************
    func getWeapon() -> Weapons {
        return Weapons.stick
    }

    //*********************************************
    func gotChest() {
    }
}
