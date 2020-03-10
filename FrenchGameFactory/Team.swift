//
//  Team.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Team {
    var combatants: [Personage] = []
    let nbOfCombatant = 3
    private var aliveInSquad = 0

    init() {
    }

    //*************************************************
     func defineSquad() {

         while combatants.count < nbOfCombatant {
            print(Utilities.textJustifyCenter(text:
                "Guerrier \(combatants.count+1) / \(nbOfCombatant)", stringLength: 100))

            Personage.displayClassList()
            let fighter = Personage.getFighter(fromTheListOf:
                Personage.allClass).copy()   // deep copy of instance

            repeat {
                let name = Utilities.requestEntry(description:
                    "Pour votre classe \(fighter.getClass()), saisissez un nom :")
                if fighterNameIsOK(name: name) {
                    fighter.name = name
                    break
                } else {
                    Utilities.blockTxt(typeCar: "⚠️", blockTxt: [
                        "le nom saisi existe déjà. Veuillez recommencer"
                    ])
            }
        } while true

        combatants.append(fighter)                                    //Add fighter to the team
        }
    }

    //******************************************************
    func displaySquad() {
        for (index, fighter) in combatants.enumerated() {
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
        let player1 = Game.players[0]
        for fighter in player1.team.combatants.enumerated() where name == fighter.element.name {
            return false
        }

        let player2 = Game.players[1]
        for fighter in player2.team.combatants.enumerated() where name == fighter.element.name {
            return false
        }
        return true
    }

    //******************************************************
    func nbFighterAlive() -> Int {
        var alive = 0
        for fighter in combatants where !fighter.dead {
            alive += 1
        }
        return alive
    }

}
