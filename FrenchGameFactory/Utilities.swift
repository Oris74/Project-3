//
//  utilities.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

//****************************************************************
 //***  Class Utilities
 //***  define caracteristics of weapons affected to fighters
 //****************************************************************

class Utilities {
    static func requestName(typeOfName: String, number num: Int ) -> String {
         print ("\(typeOfName) N° \(num) Saisisez un nom : " )
         if let name = readLine()  {
               return name
          } else {
               return ""
         }
    }
    static func result(player1: Player, player2: Player) ->Bool{
        return true
    }
}
