//
//  EnemyBossNode.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 27/07/2022.
//

import Foundation
import SpriteKit

class EnemyBossNode: SKSpriteNode, Enemy {
    var health: Double = 100
    var damage: Double = 100
    var enemeySpeed: CGFloat = 10
    var destination: CGPoint
    var startPosition: CGPoint = CGPoint(x: 0, y: 0)
    
    init(screenSizeValues: ScreenSizeValues, destination: CGPoint){
        self.destination = destination
        super.init(texture: nil, color: .red, size: CGSize(width: 40, height: 40))
        
        startPosition = randomSpawnLocation(screenSizeValues: screenSizeValues)
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 40))
        position = startPosition
        physicsBody?.affectedByGravity = false
        physicsBody!.contactTestBitMask = self.physicsBody!.collisionBitMask
        name = "enemy"
        
        moveEnemy(startlocation: startPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
}
