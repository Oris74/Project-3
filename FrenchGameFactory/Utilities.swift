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
    static func requestName(name: String) -> String {
         print("\(name) Saisisez un nom : " )
         if let getName = readLine()  {
               return getName
          }
        return ""
    }
    
    class func getClassName(object: AnyObject)-> String {
           return String(describing: type(of: object))
    }
   
  
     /*        var alreadyRegisted: Bool
        for (index,listOfFighter) in team.listOfCombatant.enumerated() {
                alreadyRegisted = false
                for fighter in listOfFighter {
                    if (fighter  .name.contains(listOfFighter.name) {
                        alreadyRegisted = true
                    }
            }
            if !alreadyRegisted {
                    print("\(index) - \(listOfFighter.key) dispose de \(listOfFighter.value) de vie")
                    
                }
            }*/

}
