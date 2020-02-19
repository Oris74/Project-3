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

class Teams: Player {
    var listOfCombatant: [Personages] = []
    let allClass: [Personages] =  [Hunter(life: 50, armor: 30, dexterity: 50),
                         Wizard(life: 50, armor: 10, dexterity: 70),
      //                 Warrior(life: 50, armor: 70, dexterity: 50),
      //                 Priest(life: 50, armor: 5, dexterity: 50),
      //                 Enchanter(life: 50, armor: 10, dexterity: 50),
      //                 Druid(life: 50, armor: 5, dexterity: 25),
      //                 Barbarian(life: 50, armor: 60, dexterity: 20),
      //                 Paladin(life: 50, armor: 80, dexterity: 50),
      //                 Monk(life: 50, armor: 5, dexterity: 50),
      //                 Thief(life: 50, armor: 25, dexterity: 70),
      //                 Archer(life: 50, armor: 15, dexterity: 50),
      //                 Ranger(life: 50, armor: 30, dexterity: 50),
                         Knight(life: 50, armor: 90, dexterity: 30)]
    let nbOfCombatant = 3
    var aliveInCrew: Int = 0
    override init(name: String){
        super.init(name: name)
    }
    func displayTeam(player: Player) {
        print("\u{001B}[2J")                // ANSI sequence for cleaning  terminal screen
        print("\n************************************************************************************")
        print("***                              Joueur \(name)                                  ***")
        print("************************************************************************************")
        print("***                       Equipe constituée de \(listOfCombatant.count)  combattants              ******")
        print("************************************************************************************")
    for (index, fighter) in listOfCombatant.enumerated() {
        let className = Utilities.getClassName(object: fighter)
        //let fighterName = fighter.map({ (fighter: fighter) -> String in fighter.name})
       //if let fighter = as?  aClassName: className){
        print("\(index) - \(fighter) - \(className)")
        }
    }
   //********* function displayTeam  **************

  func displayTeam() {
         print("\u{001B}[2J")                // ANSI sequence for cleaning  terminal screen
         print("\n************************************************************************************")
         print("***                              Joueur \(name)                                  ***")
         print("************************************************************************************")
         print("***                       Equipe constituée de \(listOfCombatant.count) combattants                  ******")
         print("************************************************************************************")
        for (index,fighter) in listOfCombatant.enumerated() {
            switch fighter {
            case let fighter as Hunter:
                print("\(index) - \(fighter.displayStatus())")
            case let fighter as Wizard:
                 print("\(index) - \(fighter.displayStatus())")
            case let fighter as Knight:
                 print("\(index) - \(fighter.displayStatus())")
      /*      case let fighter as Warrior:
                 print ("\(index)- \(fighter.displayStatus())")
            case let fighter as Priest:
                 print ("\(index)- \(fighter.displayStatus())")
            case let fighter as Enchanter:
                 print ("\(index)- \(fighter.displayStatus())")
             case let fighter as Druid:
             print ("\(index)- \(fighter.displayStatus())")*/
            default:
                print("la classe de combattant \(fighter) n'est pas connue")
            }
        }
    }
  
    //********* function displayFighterList  **************
    func displayClassList() {
        for (index, fighter) in allClass.enumerated() {
            print("\(index) - \(fighter.getClass())")
         }
    }
    
    func getFighter() -> Personages {
        print("Choisissez un type de personnage : " )
        if let entry = readLine()
            , let fighterIndex = Int(entry)
            , case 0...allClass.count-1 = fighterIndex {
            return allClass[fighterIndex]
        }
        else {
            print("Une erreur est survenue")
            return self.getFighter()
        }
    }
    
    func makeSelection() {
        print("\u{001B}[2J")                // ANSI sequence for cleaning  terminal screen
        print("*****************************************************************")
        print("\(name), constituez votre équipe de 3 guerriers dans la liste suivante:")
       
        while listOfCombatant.count < nbOfCombatant {
            print("                 Guerrier \(listOfCombatant.count+1) / \(nbOfCombatant) ")
            displayClassList()
            let fighter = getFighter()
            let name = Utilities.requestName(name: "Pour votre classe \(fighter.getClass()),")
            if fighterNameIsOK(name: name) {
                fighter.name = name
                listOfCombatant.append(fighter)
            } else {
                print("le nom saisi existe déjà. Veuillez recommencer ")
            }
        }
    }
        
    func fighterNameIsOK(name: String) -> Bool {
        let listOfOpponent = opponent!.team.listOfCombatant
        let list = listOfCombatant
        for fighter in listOfOpponent.enumerated() {
            if name == fighter.element.name {
                return false
            }
        }
        for fighter in list.enumerated() {
            if name == (fighter.element).name {
                return false
            }
        }
   return true
   }
}
