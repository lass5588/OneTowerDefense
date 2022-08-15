//
//  Enemy.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 27/07/2022.
//

import Foundation
import SpriteKit

protocol Enemy: SKSpriteNode{
    var health: Double { get set }
    var damage: Double { get set }
    var enemeySpeed: CGFloat { get set }
    var towerPosition: CGPoint { get set }
    var startPosition: CGPoint { get set }
    
    func moveEnemyAction(from startlocation: CGPoint, to destination: CGPoint) -> SKAction
    func moveEnemyAction(from startlocation: CGPoint, to destination: CGPoint, speedscaler: CGFloat) -> SKAction
    func randomSpawnLocation(screenSizeValues: ScreenSizeValues) -> CGPoint
    func takeDamage(damage: Double)
}

extension Enemy{
    func moveEnemyAction(from startlocation: CGPoint, to destination: CGPoint) -> SKAction{
        let enemyTravelTime = travelTime(to: destination, from: startlocation, at: enemeySpeed)
        return SKAction.move(to: destination, duration: TimeInterval(enemyTravelTime))
    }
    
    func moveEnemyAction(from startlocation: CGPoint, to destination: CGPoint, speedscaler: CGFloat) -> SKAction{
        let enemyTravelTime = travelTime(to: destination, from: startlocation, at: enemeySpeed * speedscaler)
        return SKAction.move(to: destination, duration: TimeInterval(enemyTravelTime))
    }
    
    // Consider division by 0 (Seems to work, tested manually with fixed enemy value.)
    func pushEnemyBackPoint() -> CGPoint {
        let scaler: CGFloat = 5
        let towerEnemyDifference: CGPoint = CGPoint(x: startPosition.x - towerPosition.x,
                                                    y: startPosition.y - towerPosition.y)
        let pushBack: CGPoint = CGPoint(x: towerEnemyDifference.x / scaler,
                                        y: towerEnemyDifference.y / scaler)
        let newPos: CGPoint = CGPoint(x: towerPosition.x + pushBack.x,
                                      y: towerPosition.y + pushBack.y)
        return newPos
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
    
    func takeDamage(damage: Double){
        health -= damage
        if health <= 0 {
            self.removeFromParent()
        }
    }
    
    // https://stackoverflow.com/questions/51662688/how-can-i-set-a-speed-to-a-moveto-method-in-swift
    func travelTime(to target: CGPoint, from start: CGPoint, at speed: CGFloat) -> TimeInterval{
        let distance = hypot(target.x - start.x, target.y - start.y)
        return TimeInterval(distance/speed)
    }
}
