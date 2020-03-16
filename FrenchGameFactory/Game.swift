//
//  Game.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Game {
    var players: [Player] = []
    var attacker: Player?
    var defender: Player {
        if attacker === players[0] {
            return  players[1]
        }
        return players[0]
    }

    var nbOfTurn = 1
   // var playerTurn = 0

    init() {
        self.players.append(
            PlayerBuilder.requestPlayerName(flag: "📗", defaultName: "Joueur1")
        )
        self.players.append(
            PlayerBuilder.requestPlayerName(flag: "📕", defaultName: "Joueur2")
        )
        players[0].opposent = players[1]
        players[1].opposent = players[0]
        self.attacker = defineWhoStart()
    }

    //***************************************************
    func start() {

        // 3 lads choosen by players from class of Personages
        TeamBuilder.create(for: &players[0])
        TeamBuilder.create(for: &players[1])

        Utilities.blockTxt(typeCar: "📣", blockTxt: [
            "LANCEMENT DE LA PARTIE",
            "\(attacker!.name) / \(defender.name)"
        ])
        Utilities.blockTxt(typeCar: "📣", blockTxt: [
            "\(attacker!.flag) Le joueur " +
            "\(attacker!.name) est choisi pour démarrer la partie",
            " Manche N° \(nbOfTurn)"
        ])

        while true {
            launchRound(attacker: attacker!, defender: defender)

            if defender.isLoser() {
                break
            }
            nbOfTurn += 1
            attacker = defender               //layers roles are change
            Utilities.blockTxt(typeCar: "🏁", blockTxt: [
                " Manche N° \(nbOfTurn)",
                "Au tour de \(attacker!.name) de jouer"
            ])
        }
        displayStatistic(winner: attacker!, loser: defender)
        Utilities.blockTxt(typeCar: "--", blockTxt: ["GameOver"])
    }

    //****************************************************
    func defineWhoStart() -> Player {
        let randomPlayer = Int.random(in: 0...1)                 //we threw dies to know who start
        return players[randomPlayer]
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
    func launchRound(attacker: Player, defender: Player) {
        Utilities.blockTxt(typeCar: "\(attacker.flag)", blockTxt: [
            "\(attacker.name) choisissez votre combattant.",
            "Equipe constituée de \(attacker.team.nbFighterAlive()) combattants valides"
        ])

        attacker.team.displaySquad()

        let myFighter = TeamManager.requestFighter(fromList: attacker.team.combatants)
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
                "\(attacker.name), Choisissez dans votre équipe, le personnage qui sera soigné"
            ])

            attacker.team.displaySquad()          //display our own team

            let myComrade = TeamManager.requestFighter(fromList: attacker.team.combatants)

            let healPoint = myFighter.healing(comrade: myComrade)

            Utilities.blockTxt(typeCar: "💊", blockTxt: [
                "\(myComrade.name), bénéficie de \(healPoint) points de vie supplémentaires",
                "il reste à \(myFighter.name), \(myFighter.isHealer())" +
                " points de guérison"
            ])

        case "N":                               //we fight someone from the opposing camp
            Utilities.blockTxt(typeCar: "🔪", blockTxt: [
                "\(attacker.name) Choisissez votre opposant"
            ])

            defender.team.displaySquad()        //display the opposing team

            let myOpponent = TeamManager.requestFighter(fromList: defender.team.combatants)

            let lostPoint = myFighter.attack(defender: myOpponent)

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
