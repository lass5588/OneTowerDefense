//
//  Upgrade.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 25/08/2022.
//

import Foundation

class Upgrade{
    var upgradeText: String
    var hasMaxLevel: Bool
    var maxLevel: Int
    var level: Int
    var baseCost: Double
    var cost: Double
    
    init(upgradeText: String, maxLevel: Int, level: Int, baseCost: Double){
        self.upgradeText = upgradeText
        self.hasMaxLevel = true
        self.maxLevel = maxLevel
        self.level = level
        self.baseCost = baseCost
        cost = baseCost * Double(level)
    }
    
    init(upgradeText: String, level: Int, baseCost: Double){
        self.upgradeText = upgradeText
        self.hasMaxLevel = false
        self.maxLevel = 0
        self.level = level
        self.baseCost = baseCost
        cost = baseCost * Double(level)
    }
    
    func updateUpgrade(){
        level += 1
        cost = baseCost * Double(level)
    }
}
