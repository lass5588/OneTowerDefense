//
//  Enemy.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/07/2022.
//

import Foundation
import SpriteKit

class EnemyNode: SKSpriteNode{
    var health: Double = 10
    var damage: Double = 10
    var enemySpeed: CGFloat = 1
    
    init(startPosition: CGPoint, destination: CGPoint){
        super.init(texture: nil, color: .red, size: CGSize(width: 20, height: 20))
        
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
        position = startPosition
        physicsBody?.affectedByGravity = false
        name = "enemy"
        
        moveEnemy(destination: destination)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
    
    func moveEnemy(destination: CGPoint){
        let path = UIBezierPath()
        
        path.move(to: destination)
        
        let movement = SKAction.move(to: destination, duration: 10)
        let sequence = SKAction.sequence([movement, .removeFromParent()])
        run(sequence)
    }
}
