//
//  Tower.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/06/2022.
//

import SpriteKit

class TowerNode: SKSpriteNode{
    var Health: Double = 10
    var Damage: Double = 10
    
    init(){
        super.init(texture: nil, color: .white, size: CGSize(width: 20, height: 20))
        
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
        physicsBody?.isDynamic = false
        position = CGPoint(x: size.width / 2, y: size.height / 1.5)
        // watch this video with more explanation as it might not be optimal: https://www.youtube.com/watch?v=MLMIdhpnd_Y&list=PLuoeXyslFTuas6GrfsUiFPShGXmaVDbgN&index=166
        physicsBody?.contactTestBitMask = self.physicsBody?.collisionBitMask ?? 0
        name = "tower"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
}
