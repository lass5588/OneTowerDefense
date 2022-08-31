//
//  Wave.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 31/08/2022.
//

import Foundation

class Wave {
    var wave: Int = 1
    var waveLength: CFTimeInterval = 10.0
    var lastWaveTIme: CFTimeInterval = 10.0
    var baseEnemiesWave: Int = 3
    var eneminesWave: Int
    var enemySpawnTime: CFTimeInterval
    var lastEnemySpawned: CFTimeInterval
    
    init(){
        eneminesWave = baseEnemiesWave
        enemySpawnTime = waveLength / Double(eneminesWave)
        lastEnemySpawned = 0
    }
    
    func updateWave(){
        wave += 1
        eneminesWave = baseEnemiesWave + wave
        enemySpawnTime = waveLength / Double(eneminesWave)
    }
    
}
