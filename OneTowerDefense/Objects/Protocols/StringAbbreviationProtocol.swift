//
//  StringAbbreviationProtocol.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 31/08/2022.
//

import Foundation

protocol StringAbbreviation {
    func intToStringAbbreviation(num: Int) -> String
    func doubleToStringAbbreviation(num: Double) -> String
}

extension StringAbbreviation{
    func intToStringAbbreviation(num: Int) -> String {
        var newString: String = ""
        
        if num < 1000 {
            newString = "\(num)"
        }
        
        if num >= 1000 && num < 1000000 {
            newString = "\(num / 1000)K"
        }
        
        if num >= 1000000 && num < 1000000000 {
            newString = "\(num / 1000000)M"
        }
        
        return newString
    }
    
    func doubleToStringAbbreviation(num: Double) -> String {
        var newString: String = ""
        
        if num < 1000 {
            newString = "\(String(format: "%.2f", num))"
        }
        
        if num >= 1000 && num < 1000000 {
            newString = "\(String(format: "%.2f", num / 1000))K"
        }
        
        if num >= 1000000 && num < 1000000000 {
            newString = "\(String(format: "%.2f", num / 1000000))M"
        }
        
        return newString
    }
}
