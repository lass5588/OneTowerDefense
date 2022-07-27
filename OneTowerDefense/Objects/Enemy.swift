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
    func randomSpawnLocation(screenSizeValues: ScreenSizeValues) -> CGPoint
}

extension Enemy{
    func moveEnemy(destination: CGPoint){
        let path = UIBezierPath()
        
        path.move(to: destination)
        
        let movement = SKAction.move(to: destination, duration: 10)
        let sequence = SKAction.sequence([movement, .removeFromParent()])
        run(sequence)
    }
    
    func randomSpawnLocation(screenSizeValues: ScreenSizeValues) -> CGPoint {
        let num = Int.random(in: 0...3)
        var spawnLocation : CGPoint = CGPoint(x: 0, y: 0)
        
        switch(num){
        case 0: // Top
            spawnLocation = CGPoint(x: CGFloat.random(in: 0...screenSizeValues.right), y: screenSizeValues.top)
        case 1: // Right
            let offset = screenSizeValues.top / 3
            spawnLocation = CGPoint(x: screenSizeValues.right, y: (CGFloat.random(in: 0...screenSizeValues.top / 1.5) + offset))
        case 2: // Buttom
            spawnLocation = CGPoint(x: CGFloat.random(in: 0...screenSizeValues.right), y: screenSizeValues.top / 3)
        case 3: // Left
            let offset = screenSizeValues.top / 3
            spawnLocation = CGPoint(x: 0, y: (CGFloat.random(in: 0...screenSizeValues.top / 1.5) + offset))
        default:
            print("spawn is broke...")
        }
        
        return spawnLocation
    }
}
