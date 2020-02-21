//
//  wizard.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

//****************************************************************
//***  Class Wizard
//***
//****************************************************************

class Wizard: Personages {
    var healing: Int = 25
    override var damage: Int {
        return    (weapon.damage + (dexterity/3))
       }
    let weapon: Weapons
    let weapons: [Weapons] =  [Weapons(name: "Sabre", damage: 10),
            Weapons(name: "Baton", damage: 1),
            Weapons(name: "Dague", damage: 3),
            Weapons(name: "Poignard", damage: 3),
            Weapons(name: "Poison", damage: 15),
            Weapons(name: "Sortilège", damage: 30),
            Weapons(name: "Incantation", damage: 15)]
    override init(life: Int, armor: Int, dexterity: Int) {
        if let myWeapon = weapons.randomElement() {
             self.weapon = myWeapon
        } else {
             self.weapon =  Weapons(name: "Baton", damage: 1)
        }
        super.init(life: life, armor: armor, dexterity: dexterity)
    }
    override func displayStatus() -> String {
        if super.dead {
            return "\(super.name) de classe \(getClass()) DECEDE !"
        } else {
            return "\(super.name) de classe \(getClass()) Force: \(lifePoints) Arme: \(weapon.name) => Dégat: \(weapon.damage). Armure: \(armor) Soins : \(healing)"
        }
    }    
    override func attack(opponent: Personages) -> Bool {
          opponent.lifePoints -= (damage - opponent.armor)
          if opponent.lifePoints <= 0 {
              opponent.lifePoints = 0
              opponent.dead = true
              print("Victoire !! Votre adversaire est terrassé")
              return true
          }
          return false
      }
    override func getClass() -> String {
        return "Wizard"
    }
    override func isHealer() -> Bool {
        return true
    }
   override func healing(comrade: Personages) -> Bool {
        let lifeNeeded = maxLifePoints-lifePoints
        switch healing {
        case 0:
            print("Malheureusement, votre soigneur manque d'energie. Il doit se reposer")
            return false
        case healing where healing > lifeNeeded:
            comrade.lifePoints = comrade.maxLifePoints
            healing-=lifeNeeded
        case healing where healing < lifeNeeded:
            comrade.lifePoints += healing
            healing = 0
        default: break
        }
        return true
    }
}
