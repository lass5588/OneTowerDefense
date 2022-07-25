//
//  Gamescene.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 23/07/2022.
//

import UIKit
import SpriteKit

class Gamescene: SKScene, SKPhysicsContactDelegate {
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        let tower = SKSpriteNode(color: .green, size: CGSize(width: 20, height: 20))
        tower.position = CGPoint(x: size.width / 2, y: size.height / 2)
        tower.physicsBody = SKPhysicsBody(circleOfRadius: 13)
        tower.physicsBody?.isDynamic = false
        // watch this video with more explanation as it might not be optimal: https://www.youtube.com/watch?v=MLMIdhpnd_Y&list=PLuoeXyslFTuas6GrfsUiFPShGXmaVDbgN&index=166
        tower.physicsBody?.contactTestBitMask = tower.physicsBody?.collisionBitMask ?? 0
        tower.name = "tower"
        addChild(tower)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        let box = SKSpriteNode(color: .red, size: CGSize(width: 20, height: 20))
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
        box.physicsBody!.affectedByGravity = false
        box.name = "enemy"
        addChild(box)
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
