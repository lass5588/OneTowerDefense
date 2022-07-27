//
//  Tower.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/06/2022.
//

import SpriteKit

class TowerNode: SKSpriteNode{
    var health: Double = 10
    var damage: Double = 10
    var towerPosition: CGPoint = CGPoint(x: 100, y: 100)
    var kage : String = "this is fucked"
    
    init(){
        super.init(texture: nil, color: .white, size: CGSize(width: 20, height: 20))
        
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
        physicsBody?.isDynamic = false
        position = towerPosition
        // watch this video with more explanation as it might not be optimal: https://www.youtube.com/watch?v=MLMIdhpnd_Y&list=PLuoeXyslFTuas6GrfsUiFPShGXmaVDbgN&index=166
        physicsBody?.contactTestBitMask = self.physicsBody?.collisionBitMask ?? 0
        name = "tower"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
    
    func setPosition(location: CGPoint){
        position = location
        towerPosition = location
    }
}
