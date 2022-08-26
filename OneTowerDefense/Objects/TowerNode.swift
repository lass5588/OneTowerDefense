//
//  Tower.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/06/2022.
//

import SpriteKit

class TowerNode: SKSpriteNode{
    var towerPosition: CGPoint = CGPoint(x: 100, y: 100)
    
    // property values.
    var maxHealth: Double = 100.0
    var health: Double = 100.0
    var healthLevel: Int = 1
    var damage: Double = 1.0
    var damageLevel: Int = 1
    var attackSpeed: Double = 1
    var attackSpeedLevel: Int = 1
    var criticalHitChance: Int = 1
    var criticalHitChangeLevel: Int = 0
    
    
    // Below values should maybe be put someplace else.
    var cash: Double = 10.0
    var coins: Int = 0
    var gems: Int = 0
    
    init(){
        super.init(texture: nil, color: .white, size: CGSize(width: 20, height: 20))
        
        physicsBody = SKPhysicsBody(circleOfRadius: 15)
        physicsBody?.isDynamic = false
        position = towerPosition
        // watch this video with more explanation as it might not be optimal: https://www.youtube.com/watch?v=MLMIdhpnd_Y&list=PLuoeXyslFTuas6GrfsUiFPShGXmaVDbgN&index=166
        physicsBody!.contactTestBitMask = self.physicsBody!.collisionBitMask
        name = "tower"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
    
    func setPosition(location: CGPoint){
        position = location
        towerPosition = location
    }
    
    func takeDamage(damage: Double){
        health -= damage
        if health <= 0 {
            print("Game over.")
        }
    }
    
    func upgradeHealth(){
        health += 10
        maxHealth += 10
    }
    
    func upgradeDamage(){
        damage += 0.2
    }
    
    func addCash(addCash: Double){ cash += addCash }
}
