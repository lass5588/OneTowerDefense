//
//  Gamescene.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 23/07/2022.
//

import UIKit
import SpriteKit

class Gamescene: SKScene, SKPhysicsContactDelegate {
    let tower = TowerNode()
    var screenSizeValues = ScreenSizeValues()
    
    var counter : Int = 0
    var counterTimer : Int = 0
    var spawnTime : CFTimeInterval = 1.0
    var lastSpawnTime : CFTimeInterval = 1.0
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        screenSizeValues.top = size.height
        screenSizeValues.right = size.width
        screenSizeValues.buttom = 0
        screenSizeValues.left = 0
        
        tower.setPosition(location: CGPoint(x: size.width / 2, y: size.height / 1.5)) // shit solution, but it needs to be set in a place which inherits from view.
        addChild(tower)
        let enemy = EnemyNode(screenSizeValues: screenSizeValues, destination: tower.towerPosition)
        addChild(enemy)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let location = touch.location(in: self)
        let enemy = EnemyNode(screenSizeValues: screenSizeValues, destination: tower.towerPosition)
        addChild(enemy)
        counter += 1
        
        if(counter == 10){
            let bossEnenmy = EnemyBossNode(screenSizeValues: screenSizeValues, destination: tower.towerPosition)
            addChild(bossEnenmy)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        var testNode : SKNode
        
        if(currentTime - lastSpawnTime > spawnTime){
            counterTimer += 1
            lastSpawnTime = currentTime
            testNode = childNode(withName: "enemy")!
            let projectileTest = ProjectileNode(startPosition: tower.towerPosition, targetDestination: testNode.position)
            addChild(projectileTest)
        }
    }
    
    func collision(between towerNode: SKNode, object: SKNode){
        print("Yaah collision.")
        tower.health -= 1
        print(tower.health)
    }
    
    func collision(between projectileNode: SKNode, enemyNode: SKNode){
        projectileNode.removeFromParent()
    }
    
    func destroy(enemy: SKNode){
        // removeFromParen() // Should be called in collision...
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA.name == "tower" && nodeB.name == "enemy"{
            collision(between: nodeA, object: nodeB)
        } else if nodeB.name == "tower" && nodeA.name == "enemy"{
            collision(between: nodeB, object: nodeA)
        }
        
        if nodeA.name == "projectile" && nodeB.name == "enemy"{
            collision(between: nodeA, enemyNode: nodeB)
        } else if(nodeB.name == "projectile" && nodeA.name == "enemy"){
            collision(between: nodeB, enemyNode: nodeA)
        }
    }
}
