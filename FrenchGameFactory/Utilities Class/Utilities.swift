//
//  Utilities.swift
//  FrenchGameFactory
//
//  Created by Laurent Debeaujon on 12/02/2020.
//  Copyright © 2020 Laurent Debeaujon. All rights reserved.
//

import Foundation

 class Utilities {

    //*******************************************************
    //*** function requestEntry
    //*** Manage alphanumeric entry
    //*******************************************************
    static func requestEntry(description: String) -> String {

        print("\(description)" )                                    //Display the requested question

        if let entry = readLine() {
            if entry == "" {
                return requestEntry(description: description)       //recursive function in case of blank entry
            }
        return entry
        }
        return requestEntry(description: description)
    }

    //*******************************************************
    //*** function requestIntEntry
    //*** Manage numeric entry according to a range of values
    //*******************************************************
    static func requestIntEntry(description: String, fromValue: Int, toValue: Int) -> Int {

        print("\(description)" )              //Display the question

        if let entry = readLine() {
            if let intEntry = Int(entry),
                intEntry >= fromValue,
                intEntry <= toValue {
                return intEntry
            }
        }
        return requestIntEntry(description: description, fromValue: fromValue, toValue: toValue)
       }

    //**************************************************
    //*** function textJustifyCenter
    //*** Center text on a line
    //**************************************************
    static func textJustifyCenter(text: String, stringLength: Int) -> String {
        let middleString: Int
        middleString = (stringLength-text.count) / 2
        let remainder = (stringLength-text.count) % 2

        return String(repeating: " ", count: middleString) + "\(text)" +
               String(repeating: " ", count: (middleString + remainder))
    }

    //**************************************************
    //*** function blockTxt()
    //*** format a block text with a line feed at the beginning
    //**************************************************
    static func blockTxt(typeCar: String, blockTxt: [String]) {
        print("\n"+String(repeating: typeCar, count: 50))
        for row in blockTxt {
            print(Utilities.textJustifyCenter(text: row, stringLength: 100))
        }
        print(String(repeating: typeCar, count: 50))
    }

    //**************************************************
    //*** function txtColumn
    //*** text: text to format  size: length
    //*** return: formated string with size expected
    //***********************************************************
    static func txtColumn(text: String, size: Int) -> String {
        let stringLength = text.count
        if size < stringLength {
            return String(text.prefix(size))        //truncate the text if too long
        } else {
            return text+String(repeating: " ", count: size - stringLength)  // add space to get the size 
        }
    }
}
