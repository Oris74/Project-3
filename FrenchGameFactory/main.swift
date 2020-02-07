//
//  main.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

//*****************************************************************
//*** class Game
//*****************************************************************

class Game {
    var playerTurn: Player
    var player1: Player
    var player2: Player
    var nbOfTurn: Int = 0
    init() {
        self.player1 = Player(name: "Joueur 1")
        self.player2 = Player(name: "Joueur 2")
        self.playerTurn = self.player1
    }
    
 
     //********* function defineWhoStart()  **************
    
    func defineWhoStart() -> Player {
        let randomPlayer = Int.random(in:1...2)
        if randomPlayer == 1 {
            return self.player1
        }
        return player2
    }
    
    
     //************ function attack()  *******************
        
    func attack() {
        
    }
    
}

//****************************************************************
//***  Class Player
//***  manage a player
//***************************************************************

class Player: Teams {
    var name: String
    var playerTeam: Teams?
    init(name: String) {
        self.name = name
        super.init()
        self.playerTeam = defineTeamToPlayer()
    }
    func defineTeamToPlayer() ->Teams {
        var myTeam: Teams
        myTeam=Teams()
        return myTeam
    }
    
    //********* function requestPlayerName  **************
     
     func requestPlayerName(defaultName: String) ->Player {
         print ("\n \(defaultName) : Saisisez votre nom (\(defaultName)): " )
         if let playerName = readLine()  {
              return Player(name: playerName)
         }
         else {
              return Player(name: defaultName)
             }
     }
     
}

//****************************************************************
//***  Class Teams
//***  manage a team of 3 fighters
//***************************************************************

class Teams {
    var listOfCharacters: [Characters] = []
    let nbOfCharacters = 3
    
    init() {
        for _ in 1...nbOfCharacters {
            addNewCharacter()
        }
    }
    
    
    func addNewCharacter() {
       let newFighter = Characters()
       listOfCharacters.append(newFighter)
        
        print("\(newFighter.fighterSelected) vient de rejointe l'équipe avec \(newFighter.maxLifePoints)!")
      }
      
    
    func DisplayTeam() {
        print("\nTon equipe est constituée de \(listOfCharacters.count)")
        for teams in listOfCharacters {
            print("\n\(teams.fighterSelected) dispose de \(teams.currentLifePoints) points de vie !")
        }
    }
}
   
    //****************************************************************
    //***  Class Characters
    //***  Randomly select a character from a list of fighters
    //*****************************************************************

class Characters {
    var fighterSelected: String
    var weaponUsed: Weapons
    var currentLifePoints: Int
    let maxLifePoints: Int
    let fighter: [String:Int] = ["Fighter 1":50, "Fighter 2":50,"Fighter 3":50,"Fighter 4":50,"Fighter 5":50,"Fighter 6":50,"Fighter 7":50,"Fighter 8":50,"Fighter 9":50,"Fighter 10":50]
    
    // [String:Int] => name : Point of life
    init() {
        if let fighterFound = fighter.randomElement() {
            self.fighterSelected = fighterFound.key
            self.maxLifePoints = fighterFound.value
            
        
        self.currentLifePoints = maxLifePoints
        self.weaponUsed = Weapons()
        }
    }
    /*func selectCharacter() -> fighter {
        if let myFighter = fighter.randomElement(){
        return myFighter
        }*/
    }
    //****************************************************************
    //***  Class Weapons
    //***  define caracteristics of weapons affected to fighters
    //****************************************************************

class Weapons {
    let name: String
    let damage: Int
    let listOfWeapons: [String:Int] =  ["Sabre":10,"Hache":8,"Couteau":3,"Baton":1,"Epée":8,"Masse":5,"Arc":12,"Katana":11,"Machette":8,"Dague":3,"Poignard":3,"Fléau":5, "Arbalète":15]
    init () {
        if let weapon = listOfWeapons.randomElement() {
            self.name = weapon.key
            self.damage = weapon.value
        }
        
    }
    func CreateWeapon() {
        
    }
}
    
    //****************************************************************************
    //***  Class Chest
    //***  manage when a chest is assigned to fighter and which weapon is inside
    //****************************************************************************
    
class Chest {
    var itemInChest: Weapons
    init(){
        
    }
    func selectRandomItem() {
        
    }
}

    
//***************************************************************************
// MARK: Main
//***************************************************************************
  
