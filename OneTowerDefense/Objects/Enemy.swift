//
//  Enemy.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/07/2022.
//

import Foundation
import SpriteKit

class EnemyNode: SKSpriteNode{
    var Health: Double = 10
    var Damage: Double = 10
    
    init(startPosition: CGPoint){
        super.init(texture: nil, color: .red, size: CGSize(width: 20, height: 20))
        
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
        position = startPosition
        physicsBody?.affectedByGravity = false
        name = "enemy"
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
}
