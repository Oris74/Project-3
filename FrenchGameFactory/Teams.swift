//
//  Teams.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

//****************************************************************
//***  Class Teams
//***  manage a team of 3 fighters
//***************************************************************

class Teams {
    var listOfCombatant: [Personages] = []
    let nbOfCombatant = 3
    init() {
      }
   //********* function displayTeam  **************

    func displayTeam(player: Player) {
         print("\u{001B}[2J")                // ANSI sequence for cleaning  terminal screen
         print("\n************************************************************************************")
         print("***                              Joueur \(player.name)                                  ***")
         print("************************************************************************************")
         
         print("***                       Equipe constituée de \(player.myTeam.listOfCombatant.count) combattants                  ******")
         print("************************************************************************************")
        for (index,team) in player.myTeam.listOfCombatant.enumerated() {
             print("\(index) - \(team.fighterSelected) dispose de \(String(team.currentLifePoints)) points de vie ! Arme utilisée : \(team.weaponUsed.name) => Dégat: \(team.weaponUsed.damage)")
        }
    }
     
 //********* function teamSelection  **************
    
    static func selection()->Teams {
        print("\u{001B}[2J")                // ANSI sequence for cleaning  terminal screen
        print("*******************************************************")
        print("Constituez votre équipe de 3 guerriers dans la liste suivante:")
      
        while listOfCombatant.count < nbOfCombatant {
            var fighter = Personages(name: "", life: 0)
            print("                 Guerrier \(listOfCombatant.count+1) / \(nbOfCombatant) ")
            displayFighterList(listTeam: listOfCombatant)
            if selectPersonage(fighter: &fighter) {
                listOfCombatant.append(fighter)
            }
        }
    }
    
     //********* function displayFighterList  **************
    func displayFighterList(listTeam: [Combatant]) {
        var alreadyRegisted: Bool
        for (index,listOfFighter) in fighters.enumerated() {
            alreadyRegisted = false
            for fighter in listTeam {
                if (fighter.fighterSelected.contains(listOfFighter.key)) {
                    alreadyRegisted = true
                }
        }
        if !alreadyRegisted {
                print("\(index) - \(listOfFighter.key) dispose de \(listOfFighter.value) de vie")
                
            }
        }
    }
    
     //********* function selectCombatant  **************
    func selectPersonage(fighter: inout Personages) {
        print ("\nfaites votre choix: " )
        if let indexFighter = readLine()  {
             if let index = Int(indexFighter)  {
                  if index < fighter.count {
                     fighter.name = Array(fighter)[index].key
                     fighter.maxLifePoints =  Array(fighters)[index].value
                     fighter.lifePoints = fighter.maxLifePoints
                     return true
                    }
                }
            }
     return false
    }
    
  
}
