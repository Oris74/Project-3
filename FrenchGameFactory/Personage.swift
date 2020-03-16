//
//  Personage.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Personage {
    var name: String = ""
    let armory: [Weapon]
    var weapon: Weapon
    var lifePoints: Int
    let maxLifePoints: Int

    var damage: Int {  //Getter: global damage = weapon damage+ % of dexterity
       return (weapon.damage + (weapon.damage * dexterity / 100))
    }
    let armor: Int

    let dexterity: Int

    var dead: Bool = false

    static let allClass: [Personage] =  [
        Hunter(),
        Wizard(),
        Paladin(),
        Enchanter(),
        Thief(),
        Priest(),
        Knight()
    ]

    //***********************************************
    init(life: Int, armor: Int, dexterity: Int, armory: [Weapon]) {

        self.maxLifePoints = life
        self.lifePoints =  maxLifePoints
        self.armor = armor
        self.dexterity = dexterity
        self.armory = armory
        self.weapon = Weapon.getWeapon(listWeapons: armory)
    }

    //***********************************************
    func copy() -> Personage {
        let copy = Personage(life: self.lifePoints, armor: self.armor, dexterity: self.dexterity, armory: self.armory)
        return copy
    }

     //********************************************
    func fighterArmory() -> [Weapon] {
        return armory
    }

    //***********************************************
    func getClass() -> String {
        return "Personage"
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
    //*** opponent: Personage who receive the attack
    //*** return Bool:  True => opponent killed
    //**********************************************
    func attack(defender: Personage) -> Int {
        var lostPoint = (damage - (damage * defender.armor/100))

        if defender.lifePoints > lostPoint {
           defender.lifePoints -= lostPoint
        } else {
            lostPoint = defender.lifePoints
            defender.lifePoints = 0
            defender.dead = true
        }
        return lostPoint
    }

    //***********************************************
    func isHealer() -> Int {
        return 0
    }

    //***********************************************
    func healing(comrade: Personage) -> Int {
        print("⚠️ malheureusement \(self.getClass()) n'a pas le don de soigner")
        return 0
    }

    //*************************************************
      static func displayClassList() {
        for (index, fighter) in allClass.enumerated() {
             print("\(index) - \(Utilities.txtColumn(text: fighter.getClass(), size: 10))" +
                 " \t 💛: \(Utilities.txtColumn(text: String(fighter.maxLifePoints), size: 3))" +
                 " \t 🛡: \(Utilities.txtColumn(text: String(fighter.armor), size: 3 ))" +
                 " \t 🎯: \(Utilities.txtColumn(text: String(fighter.dexterity), size: 3 ))")
           }
      }

}
