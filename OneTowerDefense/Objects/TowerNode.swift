//
//  Tower.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/06/2022.
//

import SpriteKit

class TowerNode: SKSpriteNode{
    var towerPosition: CGPoint = CGPoint(x: 100, y: 100)
    
    // Property values.
    var maxHealth: Double = 100.0
    var health: Double = 100.0
    var defense: Double = 1.0
    var damage: Double = 1.0
    var criticalHitChance: Double = 1.0
    var criticalFactor: Double = 2.0;
    
    // Projectile
    var projectileSpawnTime : CFTimeInterval
    var projectileLastSpawnTime : CFTimeInterval
    
    // Below values should maybe be put someplace else.
    var cash: Double = 100.0
    var coins: Double = 0.0
    var gems: Int = 0
    
    init(){
        projectileSpawnTime = 2.0
        projectileLastSpawnTime = 2.0
        
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
    
    func shootProjectile(currentTime: TimeInterval, targetEnemy: EnemyNode) -> ProjectileNode{
        projectileLastSpawnTime = currentTime
        return ProjectileNode(startPosition: towerPosition, targetDestination: targetEnemy.position, speed: 200)
    }
    
    func upgradeHealth(cost: Double){
        health += 10
        maxHealth += 10
        cash -= cost
    }
    
    func upgradeDamage(cost: Double){
        damage += 0.2
        cash -= cost
    }
    
    func upgradeAttackSpeed(cost: Double){
        if projectileSpawnTime > 0.10{
            projectileSpawnTime -= 0.05
            projectileLastSpawnTime -= 0.05
            cash -= cost
        }
    }
    
    func addCash(addCash: Double){ cash += addCash }
}
