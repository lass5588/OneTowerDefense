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
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        screenSizeValues.top = size.height
        screenSizeValues.right = size.width
        screenSizeValues.buttom = 0
        screenSizeValues.left = 0
        
        print(screenSizeValues)
        
        tower.setPosition(location: CGPoint(x: size.width / 2, y: size.height / 1.5)) // shit solution, but it needs to be set in a place which inherits from view.
        
        addChild(tower)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let location = touch.location(in: self)
        let enemy = EnemyNode(screenSizeValues: screenSizeValues, destination: tower.towerPosition)
        counter += 1
        
        if(counter == 10){
            let bossEnenmy = EnemyBossNode(screenSizeValues: screenSizeValues, destination: tower.towerPosition)
            addChild(bossEnenmy)
        }
        
        addChild(enemy)
    }
    
    func collision(between towerNode: SKNode, object: SKNode){
        // Do something.
        print("Yaah collision.")
        tower.health -= 1
        print(tower.health)
    }
    
    func destroy(enemy: SKNode){
        // removeFromParen()
        // just print.
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA.name == "tower"{
            collision(between: nodeA, object: nodeB)
        } else if nodeB.name == "tower"{
            collision(between: nodeB, object: nodeA)
        }
    }
    
//    func randomSpawn() -> CGPoint {
//        let num = Int.random(in: 0...3)
//        var spawnLocation : CGPoint = CGPoint(x: 0, y: 0)
//
//        switch(num){
//        case 0: // Top
//            spawnLocation = CGPoint(x: CGFloat.random(in: 0...screenSizeValues.right), y: screenSizeValues.top)
//        case 1: // Right
//            let offset = screenSizeValues.top / 3
//            spawnLocation = CGPoint(x: screenSizeValues.right, y: (CGFloat.random(in: 0...screenSizeValues.top / 1.5) + offset))
//        case 2: // Buttom
//            spawnLocation = CGPoint(x: CGFloat.random(in: 0...screenSizeValues.right), y: screenSizeValues.top / 3)
//        case 3: // Left
//            let offset = screenSizeValues.top / 3
//            spawnLocation = CGPoint(x: 0, y: (CGFloat.random(in: 0...screenSizeValues.top / 1.5) + offset))
//        default:
//            print("spawn is broke...")
//        }
//
//        return spawnLocation
//    }
}
