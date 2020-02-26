//
//  Priest.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

//****************************************************************
//***  Class Wizard
//***
//****************************************************************

class Priest: Personages {
     var healing: Int = 50
  override init(life: Int, armor: Int, dexterity: Int) {
        super.init( life: 50, armor: 5, dexterity: 50)
      }
  override func isHealer() -> Bool {
        return true
       }
  override func healing(comrade: Personages) {
          let lifeNeeded = maxLifePoints-lifePoints
          print(String(repeating: "-=", count: 50))
          switch healing {
          case 0:
              print("-=-"+Utilities.textJustifyCenter(
                text: "Malheureusement, votre soigneur manque d'energie. Il doit se reposer", stringLenght: 94
                )+"-=-")
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
}
