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
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        let enemy = EnemyNode(startPosition: location, destination: tower.towerPosition)
        print(location)
        
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
    
    func randomSpawn(){
        
        //let num = Int.random(in: 0..4)
        
        for _ in 1...100{
            print(Int.random(in: 0...3))
        }
        
    }
}
