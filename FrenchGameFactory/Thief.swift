//
//  Thief.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Thief: Personage {

private let weapons: [Weapon] = [
        Weapon.axe,
        Weapon.knife,
        Weapon.bow,
        Weapon.katana,
        Weapon.machete,
        Weapon.dagger,
        Weapon.poniard,
        Weapon.crossbow
    ]

    //**************************************************
    init(life: Int, armor: Int, dexterity: Int) {
            let weapon = Weapon.getWeapon(listWeapons: weapons)
             super.init(life: life, armor: armor, dexterity: dexterity, weapon: weapon)
    }

    //********************************************
    override func weaponsList() -> [Weapon] {
        return weapons
        }

    //*************************************************
    override func copy() -> Personage {
        let copy = Thief(life: self.lifePoints, armor: self.armor, dexterity: self.dexterity)
        return copy
    }

    //*************************************************
     override func displayStatus() -> String {
        if super.dead {
            return
                "💀 \(Utilities.txtColumn(text: name, size: 10)) de classe" +
                " \(Utilities.txtColumn(text: getClass(), size: 10))" +
                "\t💛: ⚰️ " +
                "\t💪: \(Utilities.txtColumn(text: String(damage), size: 3))" +
                "\t🛡: \(Utilities.txtColumn(text: String(armor), size: 3))" +
                "\t🎯: \(Utilities.txtColumn(text: String(dexterity), size: 3 ))" +
                "\t🗡: \(Utilities.txtColumn(text: weapon.name + "(\(weapon.damage))", size: 15)) "
        } else {
            return
                "👺 \(Utilities.txtColumn(text: name, size: 10)) de classe" +
                " \(Utilities.txtColumn(text: getClass(), size: 10))" +
                "\t💛: \(Utilities.txtColumn(text: String(lifePoints), size: 3))" +
                "\t💪: \(Utilities.txtColumn(text: String(damage), size: 3))" +
                "\t🛡: \(Utilities.txtColumn(text: String(armor), size: 3))" +
                "\t🎯: \(Utilities.txtColumn(text: String(dexterity), size: 3 ))" +
                "\t🗡: \(Utilities.txtColumn(text: weapon.name + "(\(weapon.damage))", size: 15)) "
              }
          }

    //************************************************
    override func getClass() -> String {
        return "Thief"
    }

    //************************************************
    override func isHealer() -> Int {
        return 0
    }

    //************************************************
    override func healing(comrade: Personage) -> Int {
        print("⚠️ malheureusement \(comrade.name) n'a pas le don de soigner")
        return 0
    }

}
