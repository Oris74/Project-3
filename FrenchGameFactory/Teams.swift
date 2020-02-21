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
    override init(playerName: String) {
        super.init(playerName: playerName)
    }
    //********* function displayFighterList  **************
    func displayClassList() {
        for (index, fighter) in allClass.enumerated() {
            print("\(index) - \(fighter.getClass()) - Force: \(fighter.maxLifePoints) - Armure: \(fighter.armor) - Dexterité: \(fighter.dexterity)")
         }
    }
    func getFighter(fromTheListOf list: [Personages] ) -> Personages {
         let entry = Utilities.requestEntry(description: "Choisissez un combattant :")
         if let fighterIndex = Int(entry),
            case 0...list.count-1 = fighterIndex,
            !list[fighterIndex].dead {
            return list[fighterIndex]
        } else {
            print("Une erreur est survenue")
            return self.getFighter(fromTheListOf: list)
        }
    }
    func defineCrew() {
        print("\u{001B}[2J")                // ANSI sequence for cleaning  terminal screen
        print(String(repeating: "*", count: 100))
        print("***"+Utilities.textJustifyCenter(text: name, stringLenght: 94)+"***")
        print("***"+Utilities.textJustifyCenter(text: "Constituez votre équipe de 3 guerriers dans la liste suivante", stringLenght: 94)+"***")
        print(String(repeating: "*", count: 100))
        while listOfCombatant.count < nbOfCombatant {
            print("                 Guerrier \(listOfCombatant.count+1) / \(nbOfCombatant) ")
            displayClassList()
            let fighter = getFighter(fromTheListOf: allClass)
            let name = Utilities.requestEntry(description: "Pour votre classe \(fighter.getClass()), saisissez un nom :")
            if fighterNameIsOK(name: name) {
                fighter.name = name
                listOfCombatant.append(fighter)
            } else {
                print("le nom saisi existe déjà. Veuillez recommencer ")
            }
        }
    }
    
    func fighterNameIsOK(name: String) -> Bool {
        let listOfOpponent = super.opponent!.listOfCombatant
        let list = listOfCombatant
        for fighter in listOfOpponent.enumerated() where name == fighter.element.name {
            return false
        }
        for fighter in list.enumerated() where name == fighter.element.name {
            return false
        }
        return true
    }
    func action(opponent: Teams) {
        print(String(repeating: "*", count: 100))
        print(String(repeating: "*", count: 100))
        print("***"+Utilities.textJustifyCenter(text: "\(name) choisissez votre combattant.", stringLenght: 94)+"***")
        print("***"+Utilities.textJustifyCenter(text: "Equipe constituée de \(nbFighterAlive()) combattants valides", stringLenght: 94)+"***")
        print(String(repeating: "*", count: 100))
        displayCrew(team: self)
        let myfighter = getFighter(fromTheListOf: listOfCombatant)
        var choixAction = ""
        if myfighter.isHealer() {
            print("Votre personnage a des compétences de guerisseur")
            repeat {
            choixAction = Utilities.requestEntry(description: "voulez vous soigner votre équipe ? (O/N)")
            } while choixAction != "O" && choixAction != "N"
            switch choixAction {
            case "O":
                print(String(repeating: "*", count: 100))
                print("***"+Utilities.textJustifyCenter(text: "\(name), Choisissez dans votre équipe, le personnage qui sera soigné", stringLenght:94)+"***")
                print(String(repeating: "*", count: 100))
                displayCrew(team: self)
                let myComrade = getFighter(fromTheListOf: listOfCombatant)
                if myfighter.healing(comrade: myComrade) {
                    print("\(myComrade.getClass()) \(myComrade.name) a été soigné !")
                }
            case "N":
                print(String(repeating: "*", count: 100))
                print("***"+Utilities.textJustifyCenter(text: "\(name) Choisissez votre opposant", stringLenght: 94)+"***")
                print("***    l'équipe adverse est composée de \(opponent.nbFighterAlive()) combattants valides ***")
                print(String(repeating: "*", count: 100))
                displayCrew(team: opponent)
                let myOpponent = getFighter(fromTheListOf: opponent.listOfCombatant)
                if myfighter.attack(opponent: myOpponent) {
                    print(String(repeating: "-=", count: 50))
                    print("-=-"+Utilities.textJustifyCenter(text: "Victoire !! le \(myOpponent.getClass()) \(myOpponent.name)  est terrassé", stringLenght: 94)+"-=-")
                    print(String(repeating: "-=", count: 50))
                } else {
                    print(String(repeating: "-=", count: 50))
                    print("-=-"+Utilities.textJustifyCenter(text: "Etat de votre adversaire", stringLenght: 94)+"-=-")
                    print("-=-"+Utilities.textJustifyCenter(text: myOpponent.displayStatus(), stringLenght: 94)+"-=-")
                    print(String(repeating: "-=", count: 50))
                }
            default: break
            }
        }
    }
    func nbFighterAlive() -> Int {
        var alive = 0
        for fighter in listOfCombatant where !fighter.dead {
            alive += 1
        }
        return alive
    }
    func displayCrew(team: Teams) {
        for (index, fighter) in team.listOfCombatant.enumerated() {
            if fighter.dead {
                print("   - \(fighter.displayStatus())")
            } else {
                print("\(index) - \(fighter.displayStatus())")
            }
        }
    }
}
