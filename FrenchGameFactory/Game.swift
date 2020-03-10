//
//  Game.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Game {

    static let players = [
        Player(color: "📗", playerName: "Joueur 1"),
        Player(color: "📕", playerName: "Joueur 2")
    ]

    var nbOfTurn = 1
    var playerTurn = 0

    init() {
    }

    //***************************************************
    func start() {
        var player = defineWhoStart()

        Utilities.blockTxt(typeCar: player.color, blockTxt: [
            player.name,
            "Constituez votre équipe de 3 guerriers dans la liste suivante"
            ])
        player.team.defineSquad()                     // 3 lads choosen by player 0 from class of Personage

        Utilities.blockTxt(typeCar: opponent(player: player).color, blockTxt: [
            opponent(player: player).name,
            "Constituez votre équipe de 3 guerriers dans la liste suivante"
            ])
        opponent(player: player).team.defineSquad()   // 3 lads choosen by player 1 from class of Personage

        Utilities.blockTxt(typeCar: "📣", blockTxt: [
            "LANCEMENT DE LA PARTIE",
            "\(player.name) / \(opponent(player: player).name)"
        ])
        Utilities.blockTxt(typeCar: "📣", blockTxt: [
            "\(player.color) Le joueur " +
            "\(player.name) est choisi pour démarrer la partie",
            " Manche N° \(nbOfTurn)"
        ])

        while true {
            launchRound(player: player, opponent: opponent(player: player))

            if opponent(player: player).isLoser() {
                break
            }
            nbOfTurn += 1
            player = opponent(player: player)                   //define who play for the next round
            Utilities.blockTxt(typeCar: "🏁", blockTxt: [
                " Manche N° \(nbOfTurn)",
                "Au tour de \(player.name) de jouer"
            ])
        }
        displayStatistic(winner: player, loser: opponent(player: player))
        Utilities.blockTxt(typeCar: "--", blockTxt: ["GameOver"])
    }

    //****************************************************
    func defineWhoStart() -> Player {
        let randomPlayer = Int.random(in: 0...1)                 //we threw dies to know who start
        return Game.players[randomPlayer]
       }

    //****************************************************
    func opponent(player: Player) -> Player {
        if player === Game.players[0] {
            return  Game.players[1]
        }
        return Game.players[0]
    }

    //****************************************************
    func displayStatistic(winner: Player, loser: Player) {
        Utilities.blockTxt(typeCar: "🏆", blockTxt: [
            "PARTIE \(winner.name) / \(loser.name)",
            "le gagnant est \(winner.name) en \(nbOfTurn) manches",
            "Il reste \(winner.team.nbFighterAlive()) combattants"
            ])

        winner.team.displaySquad()
        print(Utilities.textJustifyCenter(text: "🩸 EQUIPE PERDANTE 🩸", stringLength: 100))
        loser.team.displaySquad()
    }

    //**************************************************
    func launchRound(player: Player, opponent: Player) {
        Utilities.blockTxt(typeCar: "\(player.color)", blockTxt: [
            "\(player.name) choisissez votre combattant.",
            "Equipe constituée de \(player.team.nbFighterAlive()) combattants valides"
        ])

        player.team.displaySquad()

        let myFighter = Personage.getFighter(fromTheListOf: player.team.combatants)
        manageGift(fighter: myFighter)

        var healerSkill = "N"

        if myFighter.isHealer() > 0 {
            Utilities.blockTxt(typeCar: "💊", blockTxt: [
                "\(myFighter.name) a des compétences de guerisseur"
                ])

        repeat {
            healerSkill = Utilities.requestEntry(description:
                "voulez vous soigner votre équipe ? (O/N)")
            } while healerSkill != "O" && healerSkill != "N"            //we break the loop only for "O" or "N"
        }

        switch healerSkill {
        case "O":                               //we provide care to someone of our team
            Utilities.blockTxt(typeCar: "💊", blockTxt: [
                "\(player.name), Choisissez dans votre équipe, le personnage qui sera soigné"
            ])

            player.team.displaySquad()          //display our own team

            let myComrade = Personage.getFighter(fromTheListOf: player.team.combatants)
            let healPoint = myFighter.healing(comrade: myComrade)

            Utilities.blockTxt(typeCar: "💊", blockTxt: [
                "\(myComrade.name), bénéficie de \(healPoint) points de vie supplémentaires",
                "il reste à \(myFighter.name), \(myFighter.isHealer())" +
                " points de guérison"
            ])

        case "N":                               //we fight someone from the opposing camp
            Utilities.blockTxt(typeCar: "🔪", blockTxt: [
                "\(player.name) Choisissez votre opposant"
            ])

            opponent.team.displaySquad()        //display the opposing team

            let myOpponent = Personage.getFighter(fromTheListOf: opponent.team.combatants)

            let lostPoint = myFighter.attack(opponent: myOpponent)

            if  myOpponent.dead {               // the fight made a winner !!
                Utilities.blockTxt(typeCar: "🎯", blockTxt: [
                    "Victoire !! le \(myOpponent.getClass()) \(myOpponent.name)  est terrassé"
                ])
            }
            Utilities.blockTxt(typeCar: "⚔️", blockTxt: [
                "\(myOpponent.name) perd \(lostPoint) points",
                myOpponent.displayStatus()
            ])
        default: break
        }
    }

    func manageGift(fighter: Personage) {
        let oldWeapon = fighter.weapon
        if fighter.weapon.findChest(fighter: fighter) {
            Utilities.blockTxt(typeCar: "🎁", blockTxt: [
                "\(fighter.name) a découvert un coffre avec une nouvelle arme !!",
                "votre \(oldWeapon.name) (\(oldWeapon.damage)) est remplacé" +
                " par l'arme suivante :\(fighter.weapon.name) (\(fighter.weapon.damage))",
                "Votre \(fighter.getClass()) infligera désormais \(fighter.damage) points de dégats"
            ])
        }
    }
}
