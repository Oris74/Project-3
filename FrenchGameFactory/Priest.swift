//
//  Priest.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

class Priest: Personage {
    private var healing: Int = 15

    //*********************************************
    init() {
        let armory: [Weapon] = [
            Weapon.saber,
            Weapon.stick,
            Weapon.dagger,
            Weapon.poniard,
            Weapon.poison,
            Weapon.spell,              //Specifics weapons
            Weapon.incantation
        ]
        super.init(life: 40, armor: 5, dexterity: 30, armory: armory)
    }

   //********************************************
    override func copy() -> Personage {                           //allow a deep copy of instance
        let copy = Priest()
        return copy
    }

    //********************************************
     override func displayStatus() -> String {
        if super.dead {
            return
                "💀 \(Utilities.txtColumn(text: name, size: 10)) de classe" +
                " \(Utilities.txtColumn(text: getClass(), size: 10))" +
                "\t💛: ⚰️ " +
                "\t💪: \(Utilities.txtColumn(text: String(damage), size: 3))" +
                "\t🛡: \(Utilities.txtColumn(text: String(armor), size: 3))" +
                "\t🎯: \(Utilities.txtColumn(text: String(dexterity), size: 3 ))" +
                "\t🗡: \(Utilities.txtColumn(text: weapon.name + "(\(weapon.damage))", size: 15)) " +
                "\t💊: \(Utilities.txtColumn(text: String(healing), size: 3))"
        } else {
            return
                "👺 \(Utilities.txtColumn(text: name, size: 10)) de classe" +
                " \(Utilities.txtColumn(text: getClass(), size: 10))" +
                "\t💛: \(Utilities.txtColumn(text: String(lifePoints), size: 3))" +
                "\t💪: \(Utilities.txtColumn(text: String(damage), size: 3))" +
                "\t🛡: \(Utilities.txtColumn(text: String(armor), size: 3))" +
                "\t🎯: \(Utilities.txtColumn(text: String(dexterity), size: 3 ))" +
                "\t🗡: \(Utilities.txtColumn(text: weapon.name + "(\(weapon.damage))", size: 15)) " +
                "\t💊: \(Utilities.txtColumn(text: String(healing), size: 3))"
        }
    }

    //*******************************************
    override func getClass() -> String {
        return "Priest"
    }

    //*******************************************
    override func isHealer() -> Int {
        return healing          //return the car points of the personage 
    }

    //*******************************************
    //*** function healing
    //*** comrade : fighter who receive the care
    //*** return the quantity of care points used
    //*******************************************
    override func healing(comrade: Personage) -> Int {
        var lifeNeeded = comrade.maxLifePoints-comrade.lifePoints

        switch healing {

        case healing where healing > lifeNeeded:
            comrade.lifePoints = comrade.maxLifePoints
            healing-=lifeNeeded

        case healing where healing <= lifeNeeded:
            comrade.lifePoints += healing
            lifeNeeded = healing
            healing = 0               // the caracter lose definitly his possibility to provide care

        default: break
        }
        return lifeNeeded
    }

}
