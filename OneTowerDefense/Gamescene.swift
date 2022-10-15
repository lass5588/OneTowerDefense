//
//  Gamescene.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 23/07/2022.
//

import SpriteKit

class Gamescene: SKScene, SKPhysicsContactDelegate {
    // Objects
    let tower = TowerNode()
    let wave : Wave = Wave()
    let enemyGameValues = EnemyGameValues()
    var screenSizeValues = ScreenSizeValues()
    
    // Views
    var inGameUpgradeMenu: InGameUpgradeMenu! = nil
    var inGameTowerStatBar: InGameTowerStatBar! = nil
    var inGameEnemyStatBar: InGameEnemyStatBar! = nil
    var waveStatbar: WaveStatBar! = nil
    var valuesStatBar: ValuesStatBar! = nil
    
    // Upgrade buttons
    var towerUpgradeButtonDamage: UpgradeButtonFrame! = nil
    var towerUpgradeTextDamage: UpgradeButtonText! = nil
    var towerUpgradeButtonHealth: UpgradeButtonFrame! = nil
    var towerUpgradeTextHealth: UpgradeButtonText! = nil
    var towerUpgradeButtonAttackSpeed: UpgradeButtonFrame! = nil
    var towerUpgradeTextAttackSpeed: UpgradeButtonText! = nil
    var towerUpgradeButtonDefense: UpgradeButtonFrame! = nil
    var towerUpgradeTextdefense: UpgradeButtonText! = nil
    var towerUpgradeButtonCriticalChance: UpgradeButtonFrame! = nil
    var towerUpgradeTextCriticalChance: UpgradeButtonText! = nil
    var towerUpgradeButtonCriticalFactor: UpgradeButtonFrame! = nil
    var towerUpgradeTextCriticalFactor: UpgradeButtonText! = nil
    
    // Upgrades
    var damageUpgrade = DamageUpgrade(upgradeText: "Damage", active: true, level: 1, baseCost: 10)
    var healthUpgrade = HealthUpgrade(upgradeText: "Health", active: true, level: 1, baseCost: 10)
    var attackSpeedUpgrade = AttackSpeedUpgrade(upgradeText: "Attack speed", active: true, level: 1, baseCost: 10)
    var defenseUpgrade = DefenseUpgrade(upgradeText: "Defense %", active: true, maxLevel: 100, level: 1, baseCost: 10)
    var criticalChanceUpgrade = CriticalChanceUpgrade(upgradeText: "Critical chance", active: true, maxLevel: 100, level: 1, baseCost: 10)
    var criticalFactorUpgrade = CriticalFactorUpgrade(upgradeText: "Critical factor", active: true, level: 1, baseCost: 10)
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        inGameTowerStatBar = InGameTowerStatBar(location: CGPoint(x: size.width / 20, y: size.height / 3))
        inGameEnemyStatBar = InGameEnemyStatBar(location: CGPoint(x: size.width / 1.9, y: size.height / 3))
        waveStatbar = WaveStatBar(location: CGPoint(x: size.width / 1.25, y: size.height / 3))
        
        valuesStatBar = ValuesStatBar(location: CGPoint(x: size.width / 4, y: size.height / 1.15), tower: tower)
        addChild(StatBarBackgroundNode(location: CGPoint(x: size.width / 4, y: size.height / 2.75)))
        addChild(inGameTowerStatBar)
        addChild(StatBarBackgroundNode(location: CGPoint(x: size.width / 1.3, y: size.height / 2.75)))
        addChild(inGameEnemyStatBar)
        addChild(waveStatbar)
        addChild(valuesStatBar)
        addChild(InGameUpgradeMenu(parentScene: view.scene!, menuSize: CGSize(width: size.width, height: size.height / 3)))
        
        screenSizeValues.top = size.height
        screenSizeValues.right = size.width
        
        // Each upgrade button needs both text og Spritenode.
        addUpgradesToScene();
        
        tower.setPosition(location: CGPoint(x: size.width / 2, y: size.height / 1.5))
        enemyGameValues.setTowerPosition(towerPosition: tower.towerPosition)
        addChild(tower)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = self.atPoint(location)
        
        objectsTouched(nodeTouched: touchedNode)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Move these to areas there it changes, ritgh now it is every frame, resulting in overhead.
        inGameTowerStatBar.update(currentHealth: tower.health, maxHealth: tower.maxHealth, towerDamage: tower.damage)
        inGameEnemyStatBar.update(enemyHealth: enemyGameValues.health, enemyDamage: enemyGameValues.attack)
        valuesStatBar.update(tower: tower)

        if childNode(withName: "enemy") != nil {
            if currentTime - tower.projectileLastSpawnTime > tower.projectileSpawnTime {
                addChild(tower.shootProjectile(currentTime: currentTime, targetEnemy: getClosestEnemy() as! EnemyNode))
            }
        }
        
        if currentTime - wave.lastWaveTIme > wave.waveLength {
            wave.lastWaveTIme = currentTime
            wave.updateWave()
            waveStatbar.update(wave: wave.wave, timer: wave.waveLength)
            if wave.wave == 5 {
                addChild(EnemyBossNode(screenSizeValues: screenSizeValues, enemyGameValues: enemyGameValues))
            }
        }
        
        if currentTime - wave.lastEnemySpawned > wave.enemySpawnTime {
            wave.lastEnemySpawned = currentTime
            addChild(EnemyNode(screenSizeValues: screenSizeValues, enemyGameValues: enemyGameValues))
        }
        
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
    
    func collision(towerNode: SKNode, enemyNode: SKNode){
        let enemy: Enemy = enemyNode as! Enemy
        tower.takeDamage(damage: enemy.attack)
        
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
        if enemy.health <= 0 {
            enemy.die()
            tower.addCash(addCash: enemyGameValues.cashKill)
            valuesStatBar.update(tower: tower)
        }
    }
    
    func getClosestEnemy() -> Enemy {
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
            if tower.cash >= damageUpgrade.cost{
                tower.upgradeDamage(cost: damageUpgrade.cost)
                damageUpgrade.updateUpgrade()
                towerUpgradeTextDamage.updateText(upgrade: damageUpgrade, value: tower.damage)
            }
        case "towerHealthUpgrade":
            if tower.cash >= healthUpgrade.cost{
                tower.upgradeHealth(cost: healthUpgrade.cost)
                healthUpgrade.updateUpgrade()
                towerUpgradeTextHealth.updateText(upgrade: healthUpgrade, value: tower.health)
            }
        case "towerAttackSpeedUpgrade":
            if tower.cash >= attackSpeedUpgrade.cost{
                tower.upgradeAttackSpeed(cost: attackSpeedUpgrade.cost)
                attackSpeedUpgrade.updateUpgrade()
                towerUpgradeTextAttackSpeed.updateText(upgrade: attackSpeedUpgrade, value: tower.projectileSpawnTime)
            }
        case "towerDefenseUpgrade":
            if tower.cash >= attackSpeedUpgrade.cost{
                tower.upgradeDefense(cost: defenseUpgrade.cost)
                defenseUpgrade.updateUpgrade()
                towerUpgradeTextdefense.updateText(upgrade: defenseUpgrade, value: tower.defense)
            }
        case "towerCriticalChanceUpgrade":
            if tower.cash >= attackSpeedUpgrade.cost{
                tower.upgradeCriticalChance(cost: criticalChanceUpgrade.cost)
                criticalChanceUpgrade.updateUpgrade()
                towerUpgradeTextCriticalChance.updateText(upgrade: criticalChanceUpgrade, value: tower.criticalHitChance)
            }
        case "towerCriticalFactorUpgrade":
            if tower.cash >= attackSpeedUpgrade.cost{
                tower.upgradeCriticalFactor(cost: criticalFactorUpgrade.cost)
                criticalFactorUpgrade.updateUpgrade()
                towerUpgradeTextCriticalFactor.updateText(upgrade: criticalFactorUpgrade, value: tower.criticalFactor)
            }
        default:
            return
        }
    }
    
    // TODO: Fix CGPoint placement, should be automatically indexed in the area.
    // TODO: Fix placement with by dividing by height and width, as it scales weird, use something more constant.
    func addUpgradesToScene(){
        towerUpgradeButtonDamage = UpgradeButtonFrame(location: CGPoint(x: size.width / 4, y: size.height / 3.5), nameReference: "towerDamageUpgrade")
        towerUpgradeTextDamage = UpgradeButtonText(location: CGPoint(x: size.width / 20, y: size.height / 3.75), nameReference: "towerDamageUpgrade", upgradeText: damageUpgrade.upgradeText, value: tower.damage, level: damageUpgrade.level, cost: damageUpgrade.cost)
        
        towerUpgradeButtonHealth = UpgradeButtonFrame(location: CGPoint(x: size.width / 1.3, y: size.height / 3.5), nameReference: "towerHealthUpgrade")
        towerUpgradeTextHealth = UpgradeButtonText(location: CGPoint(x: size.width / 1.75, y: size.height / 3.75), nameReference: "towerHealthUpgrade", upgradeText: healthUpgrade.upgradeText, value: tower.maxHealth, level: healthUpgrade.level, cost: healthUpgrade.cost)
        
        towerUpgradeButtonAttackSpeed = UpgradeButtonFrame(location: CGPoint(x: size.width / 4, y: size.height / 4.75), nameReference: "towerAttackSpeedUpgrade")
        towerUpgradeTextAttackSpeed = UpgradeButtonText(location: CGPoint(x: size.width / 20, y: size.height / 5.25), nameReference: "towerAttackSpeedUpgrade", upgradeText: attackSpeedUpgrade.upgradeText, value: tower.projectileSpawnTime, level: attackSpeedUpgrade.level, cost: attackSpeedUpgrade.cost)
        
        towerUpgradeButtonDefense = UpgradeButtonFrame(location: CGPoint(x: size.width / 1.3, y: size.height / 4.75), nameReference: "towerDefenseUpgrade")
        towerUpgradeTextdefense = UpgradeButtonText(location: CGPoint(x: size.width / 1.75, y: size.height / 5.25), nameReference: "towerDefenseUpgrade", upgradeText: defenseUpgrade.upgradeText, value: tower.defense, level: defenseUpgrade.level, cost: defenseUpgrade.cost)
        
        towerUpgradeButtonCriticalChance = UpgradeButtonFrame(location: CGPoint(x: size.width / 4, y: size.height / 7.5), nameReference: "towerCriticalChanceUpgrade")
        towerUpgradeTextCriticalChance = UpgradeButtonText(location: CGPoint(x: size.width / 20, y: size.height / 8.5), nameReference: "towerCriticalChanceUpgrade", upgradeText: criticalChanceUpgrade.upgradeText, value: tower.criticalHitChance, level: criticalChanceUpgrade.level, cost: criticalChanceUpgrade.cost)
        
        towerUpgradeButtonCriticalFactor = UpgradeButtonFrame(location: CGPoint(x: size.width / 1.3, y: size.height / 7.5), nameReference: "towerCriticalFactorUpgrade")
        towerUpgradeTextCriticalFactor = UpgradeButtonText(location: CGPoint(x: size.width / 1.75, y: size.height / 8.5), nameReference: "towerCriticalFactorUpgrade", upgradeText: criticalFactorUpgrade.upgradeText, value: tower.criticalFactor, level: criticalFactorUpgrade.level, cost: criticalFactorUpgrade.cost)
        
        addChild(towerUpgradeButtonDamage)
        addChild(towerUpgradeTextDamage)
        addChild(towerUpgradeButtonHealth)
        addChild(towerUpgradeTextHealth)
        addChild(towerUpgradeButtonAttackSpeed)
        addChild(towerUpgradeTextAttackSpeed)
        addChild(towerUpgradeButtonDefense)
        addChild(towerUpgradeTextdefense)
        addChild(towerUpgradeButtonCriticalChance)
        addChild(towerUpgradeTextCriticalChance)
        addChild(towerUpgradeButtonCriticalFactor)
        addChild(towerUpgradeTextCriticalFactor)
    }
}
