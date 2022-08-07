//
//  InGameStatBar.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 06/08/2022.
//

import UIKit
import SpriteKit

class InGameStatBarHealth: SKLabelNode {
    var maxHealth: Double = 0
    var currentHealth: Double = 0
    
    override init(){
        super.init() // .......... haha
        text = "Health: \(0) / \(0)"
        horizontalAlignmentMode = .center
        position = CGPoint(x: 100, y: 100)
        fontColor = .black
        fontSize = 20
    }
    
    func updateHealth(newMaxHealth: Double, newCurrentHealth: Double){
        maxHealth = newMaxHealth
        currentHealth = newCurrentHealth
        text = "Health: \(newCurrentHealth) / \(newMaxHealth)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
