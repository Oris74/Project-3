//
//  TeamBuider.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 11/03/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//
class TeamBuilder {
    private static let nbOfCombatant = 3
    private var allCreatedFighters = [Personage]()

    //*********************************************
    //*** function create
    //*** manage the creation of 3 fighters
    //*********************************************
    func create(for player: Player) -> [Personage] {
        var fighters = [Personage]()            //store

        Utilities.blockTxt(typeCar: player.flag, blockTxt: [
                        player.name,
                        "Constituez votre équipe de 3 guerriers dans la liste suivante"
                        ])

        while fighters.count < Self.nbOfCombatant {
            print(Utilities.textJustifyCenter(text:
                "Guerrier \(fighters.count+1) / \(Self.nbOfCombatant)", stringLength: 100))

            Self.displayClassList()

            let fighter = TeamBuilder.requestFighter(fromList:
            Personage.allClass).copy()   // deep copy of instance

            fighters.append(fighter)     //Add fighter to the team
            repeat {

                let name = Utilities.requestEntry(description:
                    "Pour votre classe \(fighter.getClass()), saisissez un nom :")

                if TeamBuilder.checkNameInDouble(name: name,
                                                 allCreatedFighters: allCreatedFighters + fighters
                    ) {     //concatenation of fighters arrays
                    Utilities.blockTxt(typeCar: "⚠️", blockTxt: [
                    "le nom saisi existe déjà. Veuillez recommencer"
                    ])
                } else {
                    fighter.name = name
                    break
                }
            } while true
        }
        allCreatedFighters += fighters      //add array of fighters to the global fighters list
        return fighters
    }

    //**************************************
    private static func pickFighter(fromList: [Personage], index: Int) -> Personage? {
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
    private static func checkNameInDouble(name: String, allCreatedFighters: [Personage]) -> Bool {
        for fighter in allCreatedFighters where name == fighter.name {
            return true
        }
        return false
    }

    //*************************************************
     private static func displayClassList() {
        for (index, fighter) in Personage.allClass.enumerated() {
            print("\(index) - \(Utilities.txtColumn(text: fighter.getClass(), size: 10))" +
                " \t 💛: \(Utilities.txtColumn(text: String(fighter.maxLifePoints), size: 3))" +
                " \t 🛡: \(Utilities.txtColumn(text: String(fighter.armor), size: 3 ))" +
                " \t 🎯: \(Utilities.txtColumn(text: String(fighter.dexterity), size: 3 ))"
            )
        }
    }
}
