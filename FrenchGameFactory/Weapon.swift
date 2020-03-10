//
//  Weapon.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation
  class Weapon {
        let name: String
        let damage: Int

        static let saber: Weapon = Weapon(name: "Sabre", damage: 20)
        static let axe: Weapon = Weapon(name: "Hache", damage: 28)
        static let knife: Weapon = Weapon(name: "Couteau", damage: 10)
        static let stick: Weapon = Weapon(name: "Baton", damage: 5)
        static let sword: Weapon = Weapon(name: "Epée", damage: 15)
        static let mace: Weapon = Weapon(name: "Masse", damage: 15)
        static let bow: Weapon = Weapon(name: "Arc", damage: 20)
        static let katana: Weapon = Weapon(name: "Katana", damage: 21)
        static let machete: Weapon = Weapon(name: "Machette", damage: 18)
        static let dagger: Weapon = Weapon(name: "Dague", damage: 5)
        static let poniard: Weapon = Weapon(name: "Poignard", damage: 5)
        static let flail: Weapon = Weapon(name: "Fléau", damage: 10)
        static let crossbow: Weapon = Weapon(name: "Arbalète", damage: 25)
        static let poison: Weapon = Weapon(name: "Poison", damage: 15)
        static let spell: Weapon = Weapon(name: "Sortilège", damage: 25)
        static let incantation: Weapon = Weapon(name: "Incantation", damage: 15)

        init (name: String, damage: Int) {
                self.name = name
                self.damage = damage
        }

    //*******************************************
    static func getWeapon(listWeapons: [Weapon]) -> Weapon {
        if let myWeapon = listWeapons.randomElement() {
                  return myWeapon
        }
        return Weapon.stick
    }

    //*******************************************
    func findChest(fighter: Personage) -> Bool {
         let oldWeapon = fighter.weapon
         let aDie = Int.random(in: 0...2)        //we launch a die
         if aDie == 0 {         //1 in 3 chance of having the gift
             repeat {
                let newWeapon = Weapon.getWeapon(listWeapons: fighter.weaponsList())
                if oldWeapon !== newWeapon {
                    fighter.weapon = newWeapon
                    return true
                }
             } while true
         }
        return false
     }
}
