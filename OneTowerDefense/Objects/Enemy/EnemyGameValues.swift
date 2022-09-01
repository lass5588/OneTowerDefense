//
//  EnemyGameValues.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 01/09/2022.
//

import Foundation
import SpriteKit

class EnemyGameValues{
    let enemyBaseStats = EnemyBaseStats()
    var health: Double
    var attack: Double
    var enemySpeed: CGFloat
    let cashKill: Double
    let coinsKill: Double
    var towerPosition: CGPoint = CGPoint(x: 0, y: 0) // placeholder
    
    init(){
        health = enemyBaseStats.baseHealth
        attack = enemyBaseStats.baseAttack
        enemySpeed = enemyBaseStats.baseSpeed
        cashKill = enemyBaseStats.baseCashKill
        coinsKill = enemyBaseStats.baseCoinsKill
    }
    
    func setTowerPosition(towerPosition: CGPoint){
        self.towerPosition = towerPosition
    }
}
