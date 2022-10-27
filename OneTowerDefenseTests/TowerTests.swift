//
//  TowerTests.swift
//  OneTowerDefenseTests
//
//  Created by Lasse Andersen on 25/10/2022.
//

import XCTest
@testable import OneTowerDefense

final class TowerTests: XCTestCase {

    let tower = TowerNode()
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_tower_take_damage(){
        tower.takeDamage(hitDamage: 10.0)
        XCTAssertEqual(tower.health, 90.5)
    }
    
    func test_tower_take_damage_two(){
        tower.takeDamage(hitDamage: 20.0)
        XCTAssertEqual(tower.health, 81.0)
    }
    
    func test_tower_defense_upgrade_cost(){
        tower.cash = 100.0
        tower.upgradeDefense(cost: 20.0)
        XCTAssertEqual(tower.cash, 80.0)
    }
}
