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
             Hunter(life: 40, armor: 20, dexterity: 50),
             Wizard(life: 40, armor: 10, dexterity: 70),
             Paladin(life: 40, armor: 30, dexterity: 50),
             Enchanter(life: 40, armor: 5, dexterity: 60),
             Thief(life: 40, armor: 10, dexterity: 70),
             Priest(life: 40, armor: 5, dexterity: 30),
             Knight(life: 40, armor: 30, dexterity: 40)]

    //***********************************************
    init(life: Int, armor: Int, dexterity: Int, weapon: Weapon) {
        self.maxLifePoints = life
        self.lifePoints =  maxLifePoints
        self.armor = armor
        self.dexterity = dexterity
        self.weapon = weapon
    }

    //***********************************************
    func copy() -> Personage {
        let copy = Personage(life: self.lifePoints, armor: self.armor, dexterity: self.dexterity, weapon: self.weapon)
        return copy
    }

     //********************************************
    func weaponsList() -> [Weapon] {
        return [Weapon.stick, Weapon.dagger]}

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
    func attack(opponent: Personage) -> Int {
        var lostPoint = (damage - (damage * opponent.armor/100))

        if opponent.lifePoints > lostPoint {
           opponent.lifePoints -= lostPoint
        } else {
            lostPoint = opponent.lifePoints
            opponent.lifePoints = 0
            opponent.dead = true
        }
        return lostPoint
    }

    //***********************************************
    func isHealer() -> Int {
        return 0
    }

    //***********************************************
    func healing(comrade: Personage) -> Int {
        print("⚠️ malheureusement \(comrade.name) n'a pas le don de soigner")
        return 0
    }

     //************************************************
     //*** function GetFighter
     //*** list : array of choosen fighter
     //*** chestAttribut: enable or not a new weapon
     //************************************************
     static func getFighter(fromTheListOf list: [Personage]) -> Personage {
          let entry = Utilities.requestEntry(description: "Choisissez un combattant :")

          if let fighterIndex = Int(entry),
             case 0...list.count-1 = fighterIndex,
             !list[fighterIndex].dead {
             return list[fighterIndex]
         } else {
             print("⚠️ Une erreur est survenue")
             return self.getFighter(fromTheListOf: list)
         }
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
