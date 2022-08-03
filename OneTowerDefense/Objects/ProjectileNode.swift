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
    
    func moveProjectil(destination: CGPoint, startPosition: CGPoint){
        let path = UIBezierPath()
        let scalar : CGFloat = 2.0

        // Origin is at the buttom left, therefore the tower position should de subtracted.
        let newX : CGFloat = destination.x - position.x
        let newY : CGFloat = destination.y - position.y

        let differencePoint = CGPoint(x: newX * scalar, y: newY * scalar)

        let newPoint = CGPoint(x: differencePoint.x + destination.x, y: differencePoint.y + destination.y)

        path.move(to: newPoint)

        let projectileTravelTime = travelTime(to: newPoint, from: startPosition, at: 100)

        let movement = SKAction.move(to: newPoint, duration: TimeInterval(projectileTravelTime))
        let sequence = SKAction.sequence([movement, .removeFromParent()])
        run(sequence)
    }
    
    // https://stackoverflow.com/questions/51662688/how-can-i-set-a-speed-to-a-moveto-method-in-swift
    func travelTime(to target: CGPoint, from start: CGPoint, at speed: CGFloat) -> TimeInterval{
        let distance = hypot(target.x - start.x, target.y - start.y)
        return TimeInterval(distance/speed)
    }
}
