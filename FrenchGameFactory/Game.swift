//
//  Game.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Game {

    let team1: Teams
    let team2: Teams

    var nbOfTurn: Int = 1
    var teamTurn: Teams?

    init() {
        let player1Name = Utilities.requestEntry(description: "Joueur 1 - Veuillez saisir votre nom : ")
        self.team1 = Teams(playerName: player1Name)
        let player2Name = Utilities.requestEntry(description: "Joueur 2 - Veuillez saisir votre nom : ")
        self.team2 = Teams(playerName: player2Name)
        team1.opponent = team2
        team2.opponent = team1
    }

     //********* function defineWhoStart()  **************
    func defineWhoStart() -> Teams {
        let randomPlayer = Int.random(in: 1...2)
        print(String(repeating: "\n", count: 1))
        print(String(repeating: "-", count: 100))
        Utilities.printLine("LANCEMENT DE LA PARTIE")
        print("---"+Utilities.textJustifyCenter(text: "\(team1.name) / \(team2.name)", stringLenght: 94)+"---")

        if randomPlayer == 1 {
            print("---"+Utilities.textJustifyCenter(text: "Le joueur \(team1.name) est choisi pour démarrer la partie", stringLenght: 94)+"---")
            print(String(repeating: "-", count: 100))
            print("\n")
            return team1
        }

        let text = Utilities.textJustifyCenter(
            text: "Le joueur \(team2.name) est choisi pour démarrer la partie",
            stringLenght: 94
        )
        print("---"+text+"---")
        print(String(repeating: "-", count: 100))
        print(String(repeating: "\n", count: 1))
        return team2
    }

     //************ function attack()  *******************
    func start() {
        team1.defineCrew()
        team2.defineCrew()
        teamTurn = defineWhoStart()
        defineTurn(change: false)
        repeat {
            nbOfTurn += 1
            assignChest()
            teamTurn!.action(opponent: teamTurn!.opponent!)
            defineTurn(change: true)
        } while !gotWinner()
        print("\n")
        print("****"+Utilities.textJustifyCenter(text: "GameOver", stringLenght: 92)+"****")
    }

    func defineTurn(change: Bool) {
        if change {
            if teamTurn === team1 {
                teamTurn = team2
            } else {
                teamTurn = team1
            }
        }
        print("\n")
        print(String(repeating: "-=", count: 50))
        print("-=-"+Utilities.textJustifyCenter(text: " Manche N° \(nbOfTurn)", stringLenght: 94)+"-=-")
        print("-=-"+Utilities.textJustifyCenter(text: "Au tour de \(teamTurn!.name) de jouer", stringLenght: 94)+"-=-")
        print(String(repeating: "-=", count: 50))
    }
    
    /*
     *
     */
    func gotWinner() -> Bool {
        if team1.nbFighterAlive() == 0 {
            displayWinner(team: team2)
            return true
        } else if team2.nbFighterAlive() == 0 {
            displayWinner(team: team2)
            return true
        } else {
            return false
        }
    }
    
    func displayWinner(team: Teams) {
        print(String(repeating: "@", count: 100))
        print("@@@" + Utilities.textJustifyCenter(text: "PARTIE \(team1.name) / \(team2.name)", stringLenght: 94) + "@@@")
        print(String(repeating: "@", count: 100))
        print("@@@" + Utilities.textJustifyCenter(text: "le gagnant est \(team.name) en \(teamTurn!) manches", stringLenght: 94) + "@@@")
        print(String(repeating: "@", count: 100))
        print("@@@" + Utilities.textJustifyCenter(text: "Il reste  se compose de \(team.nbFighterAlive()) combattants", stringLenght: 94) + "@@@")
        print(String(repeating: "@", count: 100))
        team.displayCrew(team: team)
        print(String(repeating: "@", count: 100))
    }
    func assignChest() {
       let randomFighter = Int.random(in: 0...5)
        switch randomFighter {
        case 0...2:
            for (index, fighter) in team1.listOfCombatant.enumerated() {
                if index == randomFighter {
                    let chest = Chest(weapons: fighter.getWeapon())
                    fighter.chest = chest
                } else {
                    fighter.chest = nil
                }
            }
        case 3...5:
            for (index, fighter) in team2.listOfCombatant.enumerated() {
              if (index+3) == randomFighter {
                    let chest = Chest(weapons: fighter.getWeapon())
                    fighter.chest = chest
                } else {
                    fighter.chest = nil
                }
            }
        default: break
        }
    }

}
