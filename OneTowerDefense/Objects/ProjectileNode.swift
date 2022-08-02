//
//  Projectile.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 27/07/2022.
//

import UIKit
import SpriteKit

class ProjectileNode: SKSpriteNode {
    
    init(startPosition: CGPoint, targetDestination: CGPoint){
        super.init(texture: nil, color: .yellow, size: CGSize(width: 5, height: 5))
        
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 5, height: 5))
        position = startPosition
        //physicsBody?.affectedByGravity = false
        physicsBody?.isDynamic = false
        physicsBody!.contactTestBitMask = self.physicsBody!.collisionBitMask
        name = "projectile"
        
        moveProjectil(destination: targetDestination)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
    
    func moveProjectil(destination: CGPoint){
        let path = UIBezierPath()
        let scalar : CGFloat = 1.0
        
        let newX : CGFloat = destination.x - position.x
        let newY : CGFloat = destination.y - position.y
        
        let differencePoint = CGPoint(x: newX * scalar, y: newY * scalar)

        let newPoint = CGPoint(x: differencePoint.x + destination.x, y: differencePoint.y + destination.y)
        
        path.move(to: newPoint)
        
        let movement = SKAction.move(to: newPoint, duration: 3)
        let sequence = SKAction.sequence([movement, .removeFromParent()])
        run(sequence)
    }
}
