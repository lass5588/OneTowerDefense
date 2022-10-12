//
//  DefeseUpgrade.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 09/10/2022.
//

import Foundation

class DefenseUpgrade: Upgrade{
    
    override func updateUpgrade(){
        level += 1
        cost = cost * 1.2
    }
}
