//
//  TeamBuider.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 11/03/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//
class TeamBuilder {
    static let nbOfCombatant = 3

     //*********************************************
    //*** function create
    //*** manage the creation of 3 fighters
    //*********************************************
    static func create(for player: inout Player) {

        Utilities.blockTxt(typeCar: player.flag, blockTxt: [
                        player.name,
                        "Constituez votre équipe de 3 guerriers dans la liste suivante"
                        ])

        while player.team.combatants.count < nbOfCombatant {
            print(Utilities.textJustifyCenter(text:
                "Guerrier \(player.team.combatants.count+1) / \(nbOfCombatant)", stringLength: 100))

            Personage.displayClassList()

            let fighter = TeamManager.requestFighter(fromList:
            Personage.allClass).copy()   // deep copy of instance

            player.team.combatants.append(fighter)          //Add fighter to the team

            repeat {

                let name = Utilities.requestEntry(description:
                    "Pour votre classe \(fighter.getClass()), saisissez un nom :")

                if TeamManager.checkNameInDouble(name: name, player: player ) {
                    Utilities.blockTxt(typeCar: "⚠️", blockTxt: [
                    "le nom saisi existe déjà. Veuillez recommencer"
                    ])
                } else {
                    fighter.name = name
                    break
                }

            } while true
        }
    }
}
