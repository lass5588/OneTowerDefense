//
//  EnemyBaseValues.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 08/08/2022.
//

import Foundation

// This could be a struct and should be read from either a JSON or Database, but it works fine for now.
class EnemyBaseStats{
    let baseHealth: Double = 3.0
    let baseAttack: Double = 1.0
    let baseSpeed: Double = 20
}
