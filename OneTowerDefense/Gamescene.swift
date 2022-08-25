//
//  Gamescene.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 23/07/2022.
//

import SpriteKit

class Gamescene: SKScene, SKPhysicsContactDelegate {
    let tower = TowerNode()
    var screenSizeValues = ScreenSizeValues()
    var inGameUpgradeMenu: InGameUpgradeMenu! = nil
    var inGameTowerStatBar: InGameTowerStatBar! = nil
    var inGameEnemyStatBar: InGameEnemyStatBar! = nil
    var valuesStatBar: ValuesStatBar! = nil
    let enemyBaseStats = EnemyBaseStats();
    
    var counter : Int = 0
    var spawnTime : CFTimeInterval = 2.0
    var lastSpawnTime : CFTimeInterval = 2.0
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        inGameUpgradeMenu = InGameUpgradeMenu(parentScene: view.scene!, menuSize: CGSize(width: size.width, height: size.height / 3))
        inGameTowerStatBar = InGameTowerStatBar(location: CGPoint(x: size.width / 20, y: size.height / 3))
        inGameEnemyStatBar = InGameEnemyStatBar(location:  CGPoint(x: size.width / 1.7, y: size.height / 3))
        valuesStatBar = ValuesStatBar(location: CGPoint(x: size.width / 4, y: size.height / 1.15))
        addChild(StatBarBackgroundNode(location: CGPoint(x: size.width / 4, y: size.height / 2.75)))
        addChild(inGameTowerStatBar)
        addChild(StatBarBackgroundNode(location: CGPoint(x: size.width / 1.3, y: size.height / 2.75)))
        addChild(inGameEnemyStatBar)
        addChild(valuesStatBar)
        addChild(inGameUpgradeMenu)
        
        let upgradeButtonFrame1 = UpgradeButtonFrame(location: CGPoint(x: size.width / 4, y: size.height / 3.5), nameReference: "towerDamageUpgrade")
        let upgradeButtonText1 = UpgradeButtonText(location: CGPoint(x: size.width / 20, y: size.height / 3.75), nameReference: "towerDamageUpgrade", upgradeText: "Damage", value: tower.damage, level: 4, cost: 100)
        let upgradeButtonFrame2 = UpgradeButtonFrame(location: CGPoint(x: size.width / 1.3, y: size.height / 3.5), nameReference: "towerHealthUpgrade")
        addChild(upgradeButtonFrame1)
        addChild(upgradeButtonText1)
        addChild(upgradeButtonFrame2)
        
        screenSizeValues.top = size.height
        screenSizeValues.right = size.width
        screenSizeValues.buttom = 0
        screenSizeValues.left = 0
        
        tower.setPosition(location: CGPoint(x: size.width / 2, y: size.height / 1.5)) // shit solution, but it needs to be set in a place which inherits from view.
        addChild(tower)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = self.atPoint(location)
        
        let enemy = EnemyNode(screenSizeValues: screenSizeValues, towerPosition: tower.towerPosition)
        addChild(enemy)
        
        counter += 1
        if(counter == 10){ // should be replaced with a wave based solution.
            let bossEnenmy = EnemyBossNode(screenSizeValues: screenSizeValues, towerPosition: tower.towerPosition)
            addChild(bossEnenmy)
        }
        
        // upgrade button touched
        objectsTouched(nodeTouched: touchedNode)
    }
    
    override func update(_ currentTime: TimeInterval) {
        guard childNode(withName: "enemy") != nil else { return }
        
        inGameTowerStatBar.update(currentHealth: tower.health, maxHealth: tower.maxHealth, towerDamage: tower.damage)
        inGameEnemyStatBar.update(enemyHealth: 10, enemyDamage: 10) //needs to be generic.
        valuesStatBar.update(cash: tower.cash, coins: tower.coins, gems: tower.gems)
        
        if currentTime - lastSpawnTime > spawnTime {
            lastSpawnTime = currentTime
            let targetEnemy = returnClosestEnemy()
            let projectileTest = ProjectileNode(startPosition: tower.towerPosition, targetDestination: targetEnemy.position, speed: 200)
            addChild(projectileTest)
        }
    }
    
    func collision(towerNode: SKNode, enemyNode: SKNode){
        let enemy: Enemy = enemyNode as! Enemy
        tower.takeDamage(damage: enemy.damage)
        
        let newEnemyPos: CGPoint = enemy.pushEnemyBackPoint()
        
        let sequence = SKAction.sequence(
            [enemy.moveEnemyAction(from: enemy.position, to: newEnemyPos, speedscaler: 5),
             enemy.moveEnemyAction(from: newEnemyPos, to: enemy.towerPosition)])
        
        enemy.run(sequence)
    }
    
    func collision(projectileNode: SKNode, enemyNode: SKNode){
        let enemy: Enemy = enemyNode as! Enemy // Not fan, but it works and is used by others
        projectileNode.removeFromParent()
        enemy.takeDamage(damage: tower.damage)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        // Enemy hits tower
        if nodeA.name == "tower" && nodeB.name == "enemy"{
            collision(towerNode: nodeA, enemyNode: nodeB)
        } else if nodeB.name == "tower" && nodeA.name == "enemy"{
            collision(towerNode: nodeB, enemyNode: nodeA)
        }
        
        // Projectile hist enemy
        if nodeA.name == "projectile" && nodeB.name == "enemy"{
            collision(projectileNode: nodeA, enemyNode: nodeB)
        } else if(nodeB.name == "projectile" && nodeA.name == "enemy"){
            collision(projectileNode: nodeB, enemyNode: nodeA)
        }
    }
    
    func returnClosestEnemy() -> Enemy {
        let activeEnemies = children.compactMap{ $0 as? Enemy} // returns array without nil.
        
        var closestEnemy: Enemy = activeEnemies[0]
        var closestEnemyDistance: CGFloat = 0
        
        for enemy in activeEnemies{
            let distance = hypot(tower.position.x - enemy.position.x, tower.position.y - enemy.position.y)
            if closestEnemyDistance == 0 { closestEnemyDistance = distance }
            if distance < closestEnemyDistance {
                closestEnemy = enemy
                closestEnemyDistance = distance
            }
        }
        
        return closestEnemy
    }
    
    func objectsTouched(nodeTouched: SKNode){
        switch(nodeTouched.name){
            case "towerDamageUpgrade":
                tower.upgradeDamage()
            case "towerHealthUpgrade":
                tower.upgradeHealth()
        default:
            return
        }
    }
}
