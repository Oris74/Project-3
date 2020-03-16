//
//  TeamManager.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 11/03/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

class TeamManager {
    static func pickFighter(fromList: [Personage], index: Int) -> Personage? {
         if case 0...fromList.count-1 = index,
                      !fromList[index].dead {
                      return fromList[index]
         } else {
            return nil
         }
    }

    //************************************************
    //*** function requestFighter
    //*** list : array of choosen fighter
    //************************************************
    static func requestFighter(fromList list: [Personage]) -> Personage {
        let entry = Utilities.requestIntEntry(description: "Choisissez un combattant :",
                                              fromValue: 0, toValue: list.count-1 )

        if let fighter = pickFighter(fromList: list, index: entry) {
            return fighter
        } else {
            print("⚠️ Une erreur est survenue")
            return self.requestFighter(fromList: list)
        }
    }

    //*************************************************
    //*** function checkNameInDouble
    //*** check if the name of the fighter already exists in the game
    //*************************************************
    static func checkNameInDouble(name: String, player: Player) -> Bool {
        for fighter in player.team.combatants.enumerated() where name == fighter.element.name {
                return true
        }
        if let opposent = player.opposent {
            for fighter in opposent.team.combatants.enumerated() where name == fighter.element.name {
                    return true
                }
        }
        return false
      }
}
