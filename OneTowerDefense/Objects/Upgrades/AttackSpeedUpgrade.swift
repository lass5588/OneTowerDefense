//
//  AttackSpeedUpgrade.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 08/10/2022.
//

import Foundation

class AttackSpeedUpgrade: Upgrade{
    
    override func updateUpgrade(){
        level += 1
        cost = cost * 1.15
    }
}
