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
    let weapons: [Weapons] =  [Weapons.sabre,
                               Weapons.baton,
                               Weapons.dague,
                               Weapons.poignard,
                               Weapons.poison,
                               Weapons.sortilege,
                               Weapons.incantation]

    override init(life: Int, armor: Int, dexterity: Int) {
        if let myWeapon = weapons.randomElement() {
            self.weapon = myWeapon
          } else {
              self.weapon = Weapons(name: "dague", damage: 3)
          }
          super.init(life: life, armor: armor, dexterity: dexterity)
    }
   override func copy() -> Personages {
        let copy = Wizard(life: self.lifePoints, armor: self.armor, dexterity: self.dexterity)
        return copy
    }
   override func displayStatus() -> String {
        if super.dead {
            return "\(name) de classe \(getClass()) DECEDE !"
        } else {
            if chest != nil {
                return "\(name) de classe \(getClass()) Force: " +
                    "\(super.lifePoints) Arme : \(weapon.name) (\(weapon.damage)) Dégats infligés: \(super.damage). \u{001B}[0;35m Coffre Découvert !!"
            } else {
                return "\(name) de classe \(getClass()) Force: " +
                "\(super.lifePoints) Arme : \(weapon.name) (\(weapon.damage)) Dégats infligés: \(super.damage) "
            }
              
        }
    }
    override func attack(opponent: Personages) -> Bool {
           opponent.lifePoints -= (damage - (damage/opponent.armor))
           print("-=-"+Utilities.textJustifyCenter(text: "\(opponent.name) perd \((damage - (damage/opponent.armor)))", stringLenght: 94)+"-=-")
           if opponent.lifePoints <= 0 {
               opponent.lifePoints = 0
               opponent.dead = true
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
   override func healing(comrade: Personages)  {
        let lifeNeeded = maxLifePoints-lifePoints
        print(String(repeating: "-=", count: 50))
        switch healing {
        case 0:
            print("-=-"+Utilities.textJustifyCenter(text: "Malheureusement, votre soigneur manque d'energie. Il doit se reposer", stringLenght: 94)+"-=-")
        case healing where healing > lifeNeeded:
            comrade.lifePoints = comrade.maxLifePoints
            healing-=lifeNeeded
            print("-=-"+Utilities.textJustifyCenter(text: "\(comrade.name), beneficie de \(lifeNeeded) points de vie ", stringLenght: 94)+"-=-")
        case healing where healing < lifeNeeded:
            comrade.lifePoints += healing
            print("-=-"+Utilities.textJustifyCenter(text: "\(comrade.name), beneficie de \(healing) points de vie ", stringLenght: 94)+"-=-")
            healing = 0
        default: break
        }
        print("-=-"+Utilities.textJustifyCenter(text: "\(name), dispose désormais de \(healing) points de guerisseur", stringLenght: 94)+"-=-")
    }
    override func getWeapon()-> Weapons {
        if let myWeapon = weapons.randomElement() {
           return myWeapon
        } else {
           return Weapons(name: "Baton", damage: 1)
        }
    }
}
