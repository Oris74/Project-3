//
//  Chest.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

    //****************************************************************************
    //***  Class Chest
    //***  manage when a chest is assigned to fighter and which weapon is inside
    //****************************************************************************
class Chest {
    var itemInChest: Weapons
    init(weapons: Weapons) {
        self.itemInChest = weapons
    }
}
