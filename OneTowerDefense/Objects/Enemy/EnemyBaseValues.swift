//
//  EnemyBaseValues.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 08/08/2022.
//

import Foundation

// This should be read from either a JSON or Database, but it works fine for now.
struct EnemyBaseStats{
    let baseHealth: Double = 2.0
    let baseAttack: Double = 2.0
    let baseSpeed: Double = 20.0
    let baseCashKill: Double = 10.0
    let baseCoinsKill: Double = 1.0
}
