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

    var nbOfTurn = 1
    var teamTurn: Teams?                            // instense of the team selected for the next turn

    init() {
        let player1Name = Utilities.requestEntry(description: "📗 Joueur 1 - Veuillez saisir votre nom : ")
        self.team1 = Teams(teamColors: "📗", playerName: player1Name)

        let player2Name = Utilities.requestEntry(description: "📕 Joueur 2 - Veuillez saisir votre nom : ")
        self.team2 = Teams(teamColors: "📕", playerName: player2Name)

        team1.opponent = team2
        team2.opponent = team1
    }

    //***************************************************
    func start() {
        team1.defineSquad()                                      // 3 lads choosen by player from class of personages
        team2.defineSquad()
        teamTurn = defineWhoStart()

        repeat {
            teamTurn!.action(opponent: teamTurn!.opponent!)
            if gotWinner() {
                break
            }
            nbOfTurn += 1
            changeTurn()                                        //define who play for the next round
        } while true
        Utilities.blockTxt(typeCar: "🏆",
                           blockTxt: ["GameOver"]
        )
    }

    //****************************************************
       func defineWhoStart() -> Teams {
           let randomPlayer = Int.random(in: 1...2)                 //we thew dies to know who start
           Utilities.blockTxt(typeCar: "📣",
                              blockTxt: ["LANCEMENT DE LA PARTIE",
                              "\(team1.name) / \(team2.name)"]
           )

           if randomPlayer == 1 {
               Utilities.blockTxt(typeCar: "📣",
                                  blockTxt: ["📗 Le joueur \(team1.name) est choisi pour démarrer la partie",
                                            " Manche N° \(nbOfTurn)"]
               )
               return team1
           }
           Utilities.blockTxt(typeCar: "📣",
                              blockTxt: ["📕 Le joueur \(team2.name) est choisi pour démarrer la partie",
                                        " Manche N° \(nbOfTurn)"]
           )
           return team2
       }

    //****************************************************
    func changeTurn() {
        if teamTurn === team1 {
                teamTurn = team2
            } else {
                teamTurn = team1
            }
        Utilities.blockTxt(typeCar: "🏁",
                           blockTxt: [" Manche N° \(nbOfTurn)",
                            "Au tour de \(teamTurn!.name) de jouer"]
        )
    }

    //****************************************************
    func gotWinner() -> Bool {
        if team1.nbFighterAlive() == 0 {
            displayWinner(team: team2)
            return true
        } else if team2.nbFighterAlive() == 0 {
            displayWinner(team: team1)
            return true
        } else {
            return false
        }
    }

    //****************************************************
    func displayWinner(team: Teams) {
        Utilities.blockTxt(typeCar: "🏆",
                           blockTxt: ["PARTIE \(team1.name) / \(team2.name)",
                           "le gagnant est \(team.name) en \(nbOfTurn) manches",
                           "Il reste \(team.nbFighterAlive()) combattants"]
        )
        team.displaySquad(team: team)
    }

}
