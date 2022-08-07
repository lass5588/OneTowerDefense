//
//  InGamEnemyStatBar.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 07/08/2022.
//

import SpriteKit
import UIKit

class InGamEnemyStatBar: SKLabelNode {
    var enemyHealth: Double = 0
    var enemyDamage: Double = 0
    
    init(location: CGPoint){
        super.init()
        text = "Enemy base: \nHealth: \(0) \nAttack: \(0)"
        horizontalAlignmentMode = .left
        position = location
        fontName = "AvenirNext-Bold"
        fontColor = .black
        fontSize = 13
        numberOfLines = 0 // no bound.
    }
    
    func update(enemyHealth: Double, enemyDamage: Double){
        self.enemyHealth = enemyHealth
        self.enemyDamage = enemyDamage
        text = "Enemy base: \nHealth: \(enemyHealth) \nAttack: \(enemyDamage)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
