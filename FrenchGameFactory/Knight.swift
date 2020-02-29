//
//  Knight.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Knight: Personages {
   override var damage: Int {  //Getter: global damage = weapon damage+ % of dexterity
        return (weapon.damage + (weapon.damage * dexterity / 100))
   }
    var weapon: Weapons
    let weapons: [Weapons] =  [Weapons.saber,
                               Weapons.axe,
                               Weapons.sword,
                               Weapons.katana,
                               Weapons.dagger,
                               Weapons.poniard,
                               Weapons.crossbow]

    //*************************************************
    override init(life: Int, armor: Int, dexterity: Int) {
        if let myWeapon = weapons.randomElement() {
            self.weapon = myWeapon
        } else {
            self.weapon = Weapons.dagger
        }
        super.init(life: life, armor: armor, dexterity: dexterity)
    }

    //*************************************************
   override func copy() -> Personages {
        let copy = Knight(life: self.lifePoints, armor: self.armor, dexterity: self.dexterity)
        return copy
    }

      //*************************************************
    override func displayStatus() -> String {
        if super.dead {
            return "💀 \(Utilities.txtColumn(text: name, size: 10)) de classe" +
                   " \(Utilities.txtColumn(text: getClass(), size: 10)) ⚰️ !"
            } else {
               return "👺 \(Utilities.txtColumn(text: name, size: 10)) de classe" +
                   " \(Utilities.txtColumn(text: getClass(), size: 10))" +
                   "\t💛: \(Utilities.txtColumn(text: String(lifePoints), size: 3))" +
                   "\t💪: \(Utilities.txtColumn(text: String(damage), size: 3))" +
                   "\t🛡: \(Utilities.txtColumn(text: String(armor), size: 3))" +
                   "\t🗡: \(Utilities.txtColumn(text: weapon.name + "(\(weapon.damage))", size: 15)) "
            }
        }

    //***********************************************
    //*** function attack
    //*** opponent: personages who receive the attack
    //*** return Bool:  True => opponent killed
    //**********************************************
     override func attack(opponent: Personages) -> Bool {
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

    //**********************************************
    override func getClass() -> String {
        return "Knight"
    }

    //**********************************************
    override func isHealer() -> Bool {
        return false
    }

    //**********************************************
    override func healing(comrade: Personages) {
        print("⚠️ Malheureusement, un chevalier ne peut soigner pesonne")
    }

    //**********************************************
    override func getWeapon() -> Weapons {
        if let myWeapon = weapons.randomElement() {
            if myWeapon !== weapon {
                return myWeapon
            }
        }
        return getWeapon()
   }

    //**********************************************
    override func gotChest() {
        let chest = getWeapon()
        let oldWeapon = weapon
        weapon = chest
        Utilities.blockTxt(typeCar: "🎁",
                           blockTxt: ["\(name) a découvert un coffre avec une nouvelle arme !!",
                                    "votre \(oldWeapon.name) (\(oldWeapon.damage)) est remplacé par l'arme suivante :" +
                                    "\(chest.name) (\(chest.damage))",
                                    "Votre \(getClass()) infligera désormais \(damage) points de dégats"]
        )
   }

}
