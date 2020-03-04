//
//  Enchanter.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Enchanter: Personages {
     override var damage: Int {  //Getter: global damage = weapon damage+ % of dexterity
          return (weapon.damage + (weapon.damage * dexterity / 100))
     }
     private var healing: Int = 30
     private var weapon: Weapons
     private let weapons: [Weapons] =  [Weapons.stick,
                                Weapons.dagger,
                                Weapons.poniard,
                                Weapons.poison,
                                Weapons.spell,              //Specifics weapons
                                Weapons.incantation]

     //*********************************************
     override init(life: Int, armor: Int, dexterity: Int) {
        if let myWeapon = weapons.randomElement() {       //weapon randomly selected from the list of the personage class
             self.weapon = myWeapon
           } else {
             self.weapon = Weapons.stick
           }
           super.init(life: life, armor: armor, dexterity: dexterity)
     }

     //********************************************
     override func copy() -> Personages {                  //allow a deep copy of instance
         let copy = Enchanter(life: self.lifePoints, armor: self.armor, dexterity: self.dexterity)
         return copy
     }

     //********************************************
     override func displayStatus() -> String {
             if super.dead {
                 return "💀 \(Utilities.txtColumn(text: name, size: 10)) de classe" +
                        " \(Utilities.txtColumn(text: getClass(), size: 10))" +
                        "\t💛: ⚰️ " +
                        "\t💪: \(Utilities.txtColumn(text: String(damage), size: 3))" +
                        "\t🛡: \(Utilities.txtColumn(text: String(armor), size: 3))" +
                        "\t🎯: \(Utilities.txtColumn(text: String(dexterity), size: 3 ))" +
                        "\t🗡: \(Utilities.txtColumn(text: weapon.name + "(\(weapon.damage))", size: 15)) " +
                        "\t💊: \(Utilities.txtColumn(text: String(healing), size: 3))"
             } else {
                return "👺 \(Utilities.txtColumn(text: name, size: 10)) de classe" +
                    " \(Utilities.txtColumn(text: getClass(), size: 10))" +
                    "\t💛: \(Utilities.txtColumn(text: String(lifePoints), size: 3))" +
                    "\t💪: \(Utilities.txtColumn(text: String(damage), size: 3))" +
                    "\t🛡: \(Utilities.txtColumn(text: String(armor), size: 3))" +
                    "\t🎯: \(Utilities.txtColumn(text: String(dexterity), size: 3 ))" +
                    "\t🗡: \(Utilities.txtColumn(text: weapon.name + "(\(weapon.damage))", size: 15)) " +
                    "\t💊: \(Utilities.txtColumn(text: String(healing), size: 3))"
             }
         }

     //***********************************************
     //*** function attack
     //*** opponent: personages who receive the attack
     //*** return Bool:  True => opponent killed
     //**********************************************
     override func attack(opponent: Personages) -> Bool {
        opponent.lifePoints -= (damage - (damage * opponent.armor/100))             //damage applied depends on the weapon used and the armor
        if opponent.lifePoints > 0 {
             Utilities.blockTxt(typeCar: "⚔️",
                               blockTxt: ["\(opponent.name) perd \(damage - (damage * opponent.armor/100)) points",
                               opponent.displayStatus()]
             )
             return false
        }
        opponent.lifePoints = 0
        opponent.dead = true
        return true
     }

     //*******************************************
     override func getClass() -> String {
         return "Enchanter"
     }

     //*******************************************
     override func isHealer() -> Bool {
         if healing > 0 {
             return true
         }
         return false                                        // the caracter is not a healer anymore
     }

     //*******************************************
     override func healing(comrade: Personages) {
         let lifeNeeded = comrade.maxLifePoints-comrade.lifePoints

         switch healing {
         case healing where healing > lifeNeeded:
             comrade.lifePoints = comrade.maxLifePoints
             healing-=lifeNeeded
             Utilities.blockTxt(typeCar: "💊",
                                blockTxt: ["\(comrade.name), bénéficie de \(lifeNeeded) points de vie supplémentaires",
                                          "il reste à \(name), \(healing) points de guérison"]
             )
         case healing where healing <= lifeNeeded:
             comrade.lifePoints += healing
             Utilities.blockTxt(typeCar: "💊",
                                blockTxt: ["\(comrade.name), beneficie de \(healing) points de vie",
                                 "il reste à \(name), 0 points de guérison"]
             )
             healing = 0                                     // the caracter lose definitly his possibility to provide care
         default: break
         }
     }

     //*******************************************
     override func getWeapon() -> Weapons {                   // return randomly, a different weapon than the former one
         if let myWeapon = weapons.randomElement() {
             if myWeapon !== weapon {
                 return myWeapon
             }
         }
         return getWeapon()                                  // recursif function if the new weapon is the same
     }

     //*******************************************
     override func gotChest() {
           let chest = getWeapon()
           let oldWeapon = weapon
           weapon = chest
           Utilities.blockTxt(typeCar: "🎁",
                              blockTxt: ["\(name) a découvert un coffre avec une nouvelle arme !!",
                                        "votre \(oldWeapon.name) (\(oldWeapon.damage)) est remplacé" +
                                        " par l'arme suivante :\(chest.name) (\(chest.damage))",
                                        "Votre \(getClass()) infligera désormais \(damage) points de dégats"]
            )
       }

}
