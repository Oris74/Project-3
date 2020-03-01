//
//  Teams.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Teams: Player {
    var listOfCombatant: [Personages] = []
    let allClass: [Personages] =  [Hunter(life: 40, armor: 20, dexterity: 50),
                         Wizard(life: 40, armor: 10, dexterity: 70),
                         Priest(life: 40, armor: 5, dexterity: 30),
                         Paladin(life: 40, armor: 30, dexterity: 50),
                         Enchanter(life: 40, armor: 5, dexterity: 60),
                         Thief(life: 40, armor: 10, dexterity: 70),
                         Knight(life: 40, armor: 30, dexterity: 40)]
    let nbOfCombatant = 3
    var aliveInSquad = 0
    let teamColors: String

    init(teamColors: String, playerName: String) {
        self.teamColors = teamColors
        super.init(playerName: playerName)
    }

    //*************************************************
    func defineSquad() {
        Utilities.blockTxt(typeCar: teamColors,
                        blockTxt: [name,
                        "Constituez votre équipe de 3 guerriers dans la liste suivante"]
        )
        while listOfCombatant.count < nbOfCombatant {
            print(Utilities.textJustifyCenter(text: "Guerrier \(listOfCombatant.count+1) / \(nbOfCombatant)",
                stringLength: 100))

            displayClassList()

            let fighter = getFighter(fromTheListOf: allClass, chestAttribution: false).copy()   // deep copy of instance
            let name = Utilities.requestEntry(description:
                "Pour votre classe \(fighter.getClass()), saisissez un nom :")

            if fighterNameIsOK(name: name) {
                fighter.name = name
                listOfCombatant.append(fighter)                                    //Add fighter to the team
            } else {
                Utilities.blockTxt(typeCar: "⚠️", blockTxt: ["le nom saisi existe déjà. Veuillez recommencer"])
            }
        }
    }

    //**************************************************
    func action(opponent: Teams) {
        Utilities.blockTxt(typeCar: "\(teamColors)",
                           blockTxt: ["\(name) choisissez votre combattant.",
                                      "Equipe constituée de \(nbFighterAlive()) combattants valides"]
        )

        displaySquad(team: self)

        let myFighter = getFighter(fromTheListOf: listOfCombatant, chestAttribution: true)
        var healerSkill = "N"

        if myFighter.isHealer() {
            Utilities.blockTxt(typeCar: "⚠️",
                               blockTxt: ["\(myFighter.name)  a des compétences de guerisseur"]
            )

            repeat {
                  healerSkill = Utilities.requestEntry(description: "voulez vous soigner votre équipe ? (O/N)")
            } while healerSkill != "O" && healerSkill != "N"            //we break the loop only for "O" or "N"
        }

        switch healerSkill {
        case "O":               //we provide care to someone of our team
              Utilities.blockTxt(typeCar: "💉",
                                 blockTxt: ["\(name), Choisissez dans votre équipe, le personnage qui sera soigné"]
              )

              displaySquad(team: self)            //display our own team

              let myComrade = getFighter(fromTheListOf: listOfCombatant, chestAttribution: false)
              myFighter.healing(comrade: myComrade)

        case "N":               //we fight someone from the opposing camp
              Utilities.blockTxt(typeCar: "🔪",
                                 blockTxt: ["\(name) Choisissez votre opposant"]
              )

              displaySquad(team: opponent)        //display the opposing team

              let myOpponent = getFighter(fromTheListOf: opponent.listOfCombatant, chestAttribution: false)

              if myFighter.attack(opponent: myOpponent) {
                  Utilities.blockTxt(typeCar: "🎯",                 // the fight made a winner !!
                                     blockTxt: ["Victoire !! le \(myOpponent.getClass())" +
                                     " \(myOpponent.name)  est terrassé"])
              }
        default: break
          }
    }

    //************************************************
    //*** function GetFighter
    //*** list : array of choosen fighter
    //*** chestAttribut: enable or not a new weapon
    //************************************************
    func getFighter(fromTheListOf list: [Personages], chestAttribution: Bool ) -> Personages {
         let entry = Utilities.requestEntry(description: "Choisissez un combattant :")

         if let fighterIndex = Int(entry),
            case 0...list.count-1 = fighterIndex,
            !list[fighterIndex].dead {

            if chestAttribution,
                fighterIndex == Int.random(in: 0...5) {         //1 in 6 chance of having the gift
                list[fighterIndex].gotChest()                   //change weapon belong to the choosen fighter
            }
            return list[fighterIndex]
        } else {
            print("⚠️ Une erreur est survenue")
            return self.getFighter(fromTheListOf: list, chestAttribution: chestAttribution)
        }
    }

    //******************************************************
    func displaySquad(team: Teams) {
        for (index, fighter) in team.listOfCombatant.enumerated() {
            if fighter.dead {
                print("  - \(fighter.displayStatus())")
            } else {
                print("\(index) - \(fighter.displayStatus())")
            }
        }
    }

    //*************************************************
    //*** function fighterNameIsOK
    //*** check if the name of the fighter already exists in the game
    //*************************************************
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

    //*************************************************
     func displayClassList() {
         for (index, fighter) in allClass.enumerated() {
            print("\(index) - \(Utilities.txtColumn(text: fighter.getClass(), size: 10))" +
                " \t 💛: \(Utilities.txtColumn(text: String(fighter.maxLifePoints), size: 3))" +
                " \t 🛡: \(Utilities.txtColumn(text: String(fighter.armor), size: 3 ))" +
                " \t 🎯: \(Utilities.txtColumn(text: String(fighter.dexterity), size: 3 ))")
          }
     }

    //******************************************************
    func nbFighterAlive() -> Int {
        var alive = 0
        for fighter in listOfCombatant where !fighter.dead {
            alive += 1
        }
        return alive
    }

}
