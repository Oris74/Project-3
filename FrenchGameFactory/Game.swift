//
//  Game.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Game {
    var playerTurn: Player?
    let player1: Player
    let player2: Player
    var nbOfTurn: Int = 0
    init() {
        let player1Name = Utilities.requestName(name: "Joueur 1")
        self.player1 = Teams(name: player1Name)
        let player2Name = Utilities.requestName(name: "Joueur 2")
        self.player2 = Teams(name: player2Name)
        player1.opponent = player2
        player2.opponent = player1
    }
     //********* function defineWhoStart()  **************
    func defineWhoStart() -> Player {
        let randomPlayer = Int.random(in: 1...2)
        if randomPlayer == 1 {
            print("\nLe joueur 1 est choisi pour demarrer la partie")
            return player1
            }
        print("\nLe joueur 2 est choisi pour demarrer la partie")
        return player2
    }

     //************ function attack()  *******************
    func start() {
        
        player1.team.makeSelection()
        //Teams.selection(player: player1, opponent: player2)
        playerTurn = defineWhoStart()
        nbOfTurn += 1
        result()
    }
   
     /* func selectMyFighter() ->Personages {
          
      }
      func selectOpponent(in team:Teams) ->Personages {
        
      } */
    func result() {
        displayTeam(player: player1)
        displayTeam(player: player2)

    }
    func displayTeam(player: Player) {
        player.team.displayTeam(player: player)
    }
}
