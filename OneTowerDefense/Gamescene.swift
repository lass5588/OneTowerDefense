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
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        addChild(tower)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        let enemy1 = EnemyNode(startPosition: location)
        addChild(enemy1)
    }
    
    func collision(between tower: SKNode, object: SKNode){
        // Do something.
        print("Yaah collision.")
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
}
