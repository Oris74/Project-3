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
    static func requestEntry(description: String) -> String {
        print("\(description)" )
        if let entry = readLine() {
            if entry == "" {
                return requestEntry(description: description)
            }
        return entry
        }
        return requestEntry(description: description)
    }
    static func textJustifyCenter(text: String, stringLenght: Int) -> String {
        let middleString: Int
        middleString = (stringLenght-text.count) / 2
        let remainder = (stringLenght-text.count)%2
        return String(repeating: " ", count: middleString) + "\(text)" + String(repeating: " ", count: (middleString + remainder))
    }
}
