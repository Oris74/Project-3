//
//  Game.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Game {
    var playerTurn:Player
    let player1:Player
    let player2:Player
    var nbOfTurn: Int = 0
    init() {
        let player1Name = Utilities.requestName(typeOfName: "Joueur", number:1)
        self.player1 = Player(name: player1Name)
        let player2Name = Utilities.requestName(typeOfName: "Joueur", number: 2)
        self.player2 = Player(name: player2Name)
        
        self.playerTurn = defineWhoStart()
        partyGame()
    }
     
     //********* function defineWhoStart()  **************
    
    func defineWhoStart() -> Player {
        let randomPlayer = Int.random(in:1...2)
        if randomPlayer == 1 {
            print("\nLe joueur 1 est choisi pour demarrer la partie")
            return self.player1
            }
        print("\nLe joueur 2 est choisi pour demarrer la partie")
        return player2
    }
   
     //************ function attack()  *******************
        
    func partyGame() {
              
        nbOfTurn += 1
        Utilities.result()
        
    }
      func selectMyFighter() ->Personages {
          
      }
      func selectOpponent(in team:Teams) ->Personages {
          
      }
    
}
