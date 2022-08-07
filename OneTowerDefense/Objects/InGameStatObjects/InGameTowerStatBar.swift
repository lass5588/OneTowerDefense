//
//  InGameStatBar.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 06/08/2022.
//

import UIKit
import SpriteKit

class InGameTowerStatBar: SKLabelNode {
    var maxHealth: Double = 0
    var currentHealth: Double = 0
    var towerDamage: Double = 0
    
    init(location: CGPoint){
        super.init()
        text = "Tower: \nHealth: \(0) / \(0) \nDamage: \(0)"
        horizontalAlignmentMode = .right
        position = location
        fontName = "AvenirNext-Bold"
        fontColor = .black
        fontSize = 13
        numberOfLines = 0 // no bound.
    }
    
    func update(currentHealth: Double, maxHealth: Double, towerDamage: Double){
        self.maxHealth = maxHealth
        self.currentHealth = currentHealth
        self.towerDamage = towerDamage
        text = "Tower: \nHealth: \(currentHealth) / \(maxHealth) \nDamage: \(towerDamage)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
