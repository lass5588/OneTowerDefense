//
//  InGameStatBar.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 06/08/2022.
//

import UIKit
import SpriteKit

class InGameTowerStatBar: SKLabelNode {
    init(location: CGPoint){
        super.init()
        text = "Tower: \nHealth: \(0) / \(0) \nDamage: \(0)"
        horizontalAlignmentMode = .left
        position = location
        fontName = "AvenirNext-Bold"
        fontColor = .black
        fontSize = 13
        numberOfLines = 0 // no bound.
    }
    
    func update(currentHealth: Double, maxHealth: Double, towerDamage: Double){
        text = "Tower: \nHealth: \(String(format: "%.2f", currentHealth)) / \(String(format: "%.2f", maxHealth)) \nDamage: \(String(format: "%.2f", towerDamage))"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
