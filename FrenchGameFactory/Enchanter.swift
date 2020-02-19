//
//  Enchanter.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 04/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

//****************************************************************
//***  Class Enchanter
//***
//****************************************************************
class Enchanter: Personages {
   override init(life: Int, armor: Int, dexterity: Int) {
        super.init(life: 50, armor: 10, dexterity: 50)
      }
}
