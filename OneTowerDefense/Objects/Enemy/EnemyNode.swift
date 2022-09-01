//
//  Enemy.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/07/2022.
//

import Foundation
import SpriteKit

class EnemyNode: SKSpriteNode, Enemy{
    var health: Double
    var attack: Double
    var enemySpeed: CGFloat
    var towerPosition: CGPoint
    var startPosition: CGPoint = CGPoint(x: 0, y: 0)
    
    init(screenSizeValues: ScreenSizeValues, enemyGameValues: EnemyGameValues){
        self.health = enemyGameValues.health
        self.attack = enemyGameValues.attack
        self.enemySpeed = enemyGameValues.enemySpeed
        self.towerPosition = enemyGameValues.towerPosition
        
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
