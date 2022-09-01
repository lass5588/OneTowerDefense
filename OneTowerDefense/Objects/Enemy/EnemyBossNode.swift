//
//  EnemyBossNode.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 27/07/2022.
//

import Foundation
import SpriteKit

class EnemyBossNode: SKSpriteNode, Enemy {
    var health: Double
    var attack: Double
    var enemySpeed: CGFloat
    var towerPosition: CGPoint
    var startPosition: CGPoint = CGPoint(x: 0, y: 0)
    
    init(screenSizeValues: ScreenSizeValues, enemyGameValues: EnemyGameValues){
        self.health = enemyGameValues.health * 5
        self.attack = enemyGameValues.attack * 2
        self.enemySpeed = enemyGameValues.enemySpeed / 2
        self.towerPosition = enemyGameValues.towerPosition
        
        super.init(texture: nil, color: .red, size: CGSize(width: 40, height: 40))
        
        startPosition = randomSpawnLocation(screenSizeValues: screenSizeValues)
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 40))
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
