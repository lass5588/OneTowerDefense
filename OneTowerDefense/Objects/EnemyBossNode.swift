//
//  EnemyBossNode.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 27/07/2022.
//

import UIKit
import SpriteKit

class EnemyBossNode: SKSpriteNode, Enemy {
    var health: Double = 100
    var damage: Double = 100
    var enemeySpeed: CGFloat = 1
    
    init(screenSizeValues: ScreenSizeValues, destination: CGPoint){
        super.init(texture: nil, color: .red, size: CGSize(width: 40, height: 40))
        
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 40))
        position = randomSpawnLocation(screenSizeValues: screenSizeValues)
        physicsBody?.affectedByGravity = false
        name = "enemy"
        
        moveEnemy(destination: destination)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }

}