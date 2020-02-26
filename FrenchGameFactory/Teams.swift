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
            // swiftlint:disable:next line_length
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
            print(Utilities.textJustifyCenter(text: "Guerrier \(listOfCombatant.count+1) / \(nbOfCombatant)", stringLenght: 100))
            displayClassList()
            let cloneFighter = getFighter(fromTheListOf: allClass)
            //let cloneFighter = fighter.copy()
            let name = Utilities.requestEntry(description: "Pour votre classe \(cloneFighter.getClass()), saisissez un nom :")
            if fighterNameIsOK(name: name) {
                cloneFighter.name = name
                listOfCombatant.append(cloneFighter)
            } else {
                print(String(repeating: "!", count: 100))
                print("!!!"+Utilities.textJustifyCenter(text: "le nom saisi existe déjà. Veuillez recommencer", stringLenght: 94)+"!!!")
                print(String(repeating: "!", count: 100))
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
        print("***"+Utilities.textJustifyCenter(text: "\(name) choisissez votre combattant.", stringLenght: 94)+"***")
        print("***"+Utilities.textJustifyCenter(text: "Equipe constituée de \(nbFighterAlive()) combattants valides", stringLenght: 94)+"***")
        print(String(repeating: "*", count: 100))
        displayCrew(team: self)
        let myFighter = getFighter(fromTheListOf: listOfCombatant)
        var healerSkill = "N"
        if myFighter.isHealer() {
            print(Utilities.textJustifyCenter(text: "Votre personnage a des compétences de guerisseur", stringLenght: 100))
            repeat {
                healerSkill = Utilities.requestEntry(description: "voulez vous soigner votre équipe ? (O/N)")
            } while healerSkill != "O" && healerSkill != "N"
        }
        print(String(repeating: "-=", count: 50))
        switch healerSkill {
        case "O":
            print("***"+Utilities.textJustifyCenter(text: "\(name), Choisissez dans votre équipe, le personnage qui sera soigné", stringLenght: 94)+"***")
            print(String(repeating: "-=", count: 50))
            displayCrew(team: self)
            let myComrade = getFighter(fromTheListOf: listOfCombatant)
            myFighter.healing(comrade: myComrade)
        case "N":
            print("-=-"+Utilities.textJustifyCenter(text: "\(name) Choisissez votre opposant", stringLenght: 94)+"-=-")
            print("-=-"+Utilities.textJustifyCenter(text: "l'équipe adverse est composée de \(opponent.nbFighterAlive()) combattants valides", stringLenght: 94)+"-=-")
            print(String(repeating: "-=", count: 50))
            displayCrew(team: opponent)
            let myOpponent = getFighter(fromTheListOf: opponent.listOfCombatant)
            print("\n\n"+String(repeating: "-=", count: 50))
            if myFighter.attack(opponent: myOpponent) {
                print("-=-"+Utilities.textJustifyCenter(text: "Victoire !! le \(myOpponent.getClass()) \(myOpponent.name)  est terrassé", stringLenght: 94)+"-=-")
            } else {
                print("-=-"+Utilities.textJustifyCenter(text: myOpponent.displayStatus(), stringLenght: 94)+"-=-")
            }
        default: break
        }
          print(String(repeating: "-=", count: 50))
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
                print("  - \(fighter.displayStatus())")
            } else {
                print("\(index) - \(fighter.displayStatus())")
            }
        }
    }
}
