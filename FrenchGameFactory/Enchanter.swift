//
//  Enchanter.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Enchanter: Personage {
     private var healing: Int = 30

     private let weapons: [Weapon] =  [
        Weapon.stick,
        Weapon.dagger,
        Weapon.poniard,
        Weapon.poison,
        Weapon.spell,              //Specifics weapons
        Weapon.incantation
    ]

     //*********************************************
     init(life: Int, armor: Int, dexterity: Int) {
            let weapon = Weapon.getWeapon(listWeapons: weapons)
            super.init(life: life, armor: armor, dexterity: dexterity, weapon: weapon)
     }

    //********************************************
    override func weaponsList() -> [Weapon] {
            return weapons
        }
     //********************************************
    override func copy() -> Personage {                  //allow a deep copy of instance
         let copy = Enchanter(life: self.lifePoints, armor: self.armor, dexterity: self.dexterity)
         return copy
     }

     //********************************************
     override func displayStatus() -> String {
        if super.dead {
            return
                "💀 \(Utilities.txtColumn(text: name, size: 10)) de classe" +
                " \(Utilities.txtColumn(text: getClass(), size: 10))" +
                "\t💛: ⚰️ " +
                "\t💪: \(Utilities.txtColumn(text: String(damage), size: 3))" +
                "\t🛡: \(Utilities.txtColumn(text: String(armor), size: 3))" +
                "\t🎯: \(Utilities.txtColumn(text: String(dexterity), size: 3 ))" +
                "\t🗡: \(Utilities.txtColumn(text: weapon.name + "(\(weapon.damage))", size: 15)) " +
                "\t💊: \(Utilities.txtColumn(text: String(healing), size: 3))"
        } else {
            return
                "👺 \(Utilities.txtColumn(text: name, size: 10)) de classe" +
                " \(Utilities.txtColumn(text: getClass(), size: 10))" +
                "\t💛: \(Utilities.txtColumn(text: String(lifePoints), size: 3))" +
                "\t💪: \(Utilities.txtColumn(text: String(damage), size: 3))" +
                "\t🛡: \(Utilities.txtColumn(text: String(armor), size: 3))" +
                "\t🎯: \(Utilities.txtColumn(text: String(dexterity), size: 3 ))" +
                "\t🗡: \(Utilities.txtColumn(text: weapon.name + "(\(weapon.damage))", size: 15)) " +
                "\t💊: \(Utilities.txtColumn(text: String(healing), size: 3))"
             }
     }

     //*******************************************
     override func getClass() -> String {
         return "Enchanter"
     }

     //*******************************************
     override func isHealer() -> Int {
       return healing                         // the caracter is not a healer anymore
     }

     //*******************************************
     override func healing(comrade: Personage) -> Int {
            var lifeNeeded = comrade.maxLifePoints-comrade.lifePoints

            switch healing {

            case healing where healing > lifeNeeded:
                comrade.lifePoints = comrade.maxLifePoints
                healing-=lifeNeeded
                return lifeNeeded

            case healing where healing <= lifeNeeded:
                comrade.lifePoints += healing
                lifeNeeded = healing
                healing = 0                   // the caracter lose definitly his possibility to provide care

            default: break
            }
            return lifeNeeded
    }
}
