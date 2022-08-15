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
    var enemeySpeed: CGFloat = 50
    var towerPosition: CGPoint
    var startPosition: CGPoint = CGPoint(x: 0, y: 0)
    
    init(screenSizeValues: ScreenSizeValues, towerPosition: CGPoint){
        self.towerPosition = towerPosition
        super.init(texture: nil, color: .red, size: CGSize(width: 10, height: 10))
        
        startPosition = randomSpawnLocation(screenSizeValues: screenSizeValues)
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
        position = startPosition
        physicsBody?.affectedByGravity = false
        physicsBody!.contactTestBitMask = self.physicsBody!.collisionBitMask
        name = "enemy"
        
        run(moveEnemyAction(from: startPosition, to: towerPosition))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
}
