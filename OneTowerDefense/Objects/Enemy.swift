//
//  Enemy.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 27/07/2022.
//

import Foundation
import SpriteKit

protocol Enemy : SKSpriteNode{
    var health : Double { get set }
    var damage : Double { get set }
    var enemeySpeed : CGFloat { get set }
    func moveEnemy(destination: CGPoint)
}

extension Enemy{
    func moveEnemy(destination: CGPoint){
        let path = UIBezierPath()
        
        path.move(to: destination)
        
        let movement = SKAction.move(to: destination, duration: 10)
        let sequence = SKAction.sequence([movement, .removeFromParent()])
        run(sequence)
    }
}
