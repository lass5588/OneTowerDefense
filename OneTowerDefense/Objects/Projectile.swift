//
//  Projectile.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 27/07/2022.
//

import UIKit
import SpriteKit

class Projectile: SKSpriteNode {
    
    init(){
        super.init(texture: nil, color: .yellow, size: CGSize(width: 5, height: 5))
        
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 5, height: 5))
        //position
        physicsBody?.affectedByGravity = false
        name = "projectile"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
    
    func moveProjectil(destination: CGPoint){
        let path = UIBezierPath()
        
        path.move(to: destination)
        
        let movement = SKAction.move(to: destination, duration: 3)
        let sequence = SKAction.sequence([movement, .removeFromParent()])
        run(sequence)
    }
}
