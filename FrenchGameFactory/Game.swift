//
//  Game.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Game {
    var teamTurn: Teams?
    let team1: Teams
    let team2: Teams
    var nbOfTurn: Int = 0
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
        if randomPlayer == 1 {
            print("\nLe joueur \(team1.name) est choisi pour démarrer la partie")
            return team1
            }
        print("\nLe joueur \(team2.name) est choisi pour demarrer la partie")
        return team2
    }

     //************ function attack()  *******************
    func start() {
        team1.defineCrew()
        team2.defineCrew()
        teamTurn = defineWhoStart()
        while team1.nbFighterAlive() > 0 && team2.nbFighterAlive() > 0 {
            nbOfTurn += 1
            teamTurn!.action(opponent: teamTurn!.opponent!)
            changeTurn()
        }
        isWinner()
        print("**** GameOver ****")
    }
     /* func selectMyFighter() ->Personages {
          
      }
      func selectOpponent(in team:Teams) ->Personages {
        
      } */
    func changeTurn() {
        if teamTurn === team1 {
            teamTurn = team2
        } else {
            teamTurn = team1
        }
        print("************************************************************************")
        print("***     c'est au tour du joueur \(teamTurn!.name) de jouer          ****")
        print("************************************************************************")
    }
    func doWinner() {
        print("")
    }
    func isWinner() {
        if team1.nbFighterAlive() == 0 {
            displayWinner(team: team1)
        } else {
            displayWinner(team: team2)
        }
    }
    func displayWinner(team: Teams) {
        print("\u{001B}[2J")                // ANSI sequence for cleaning  terminal screen
        print("\n************************************************************************************")
        print("***                           le joueur \(team.name) est victorieux en                           ***")
        print("************************************************************************************")
        print("***                       Equipe constituée de \(team.listOfCombatant.count)  combattants                    ***")
        print("************************************************************************************")
        team.displayCrew(team: team)
       }
}
