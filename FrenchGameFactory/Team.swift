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

    //******************************************************
    func nbFighterAlive() -> Int {
        var alive = 0
        for fighter in combatants where !fighter.dead {
            alive += 1
        }
        return alive
    }

}
