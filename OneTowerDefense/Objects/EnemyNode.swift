//
//  Enemy.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/07/2022.
//

import Foundation
import SpriteKit

class EnemyNode: SKSpriteNode, Enemy{
    var health: Double = 3
    var damage: Double = 10
    var enemeySpeed: CGFloat = 20
    
    init(screenSizeValues: ScreenSizeValues, destination: CGPoint){
        super.init(texture: nil, color: .red, size: CGSize(width: 10, height: 10))
        
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
        position = randomSpawnLocation(screenSizeValues: screenSizeValues)
        physicsBody?.affectedByGravity = false
        physicsBody!.contactTestBitMask = self.physicsBody!.collisionBitMask
        name = "enemy"
        
        moveEnemy(destination: destination, startPosition: position)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
}
