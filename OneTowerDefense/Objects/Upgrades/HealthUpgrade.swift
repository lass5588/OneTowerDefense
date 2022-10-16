//
//  HealthUpgrade.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 29/08/2022.
//

import Foundation

class HealthUpgrade: Upgrade{
    
    override func updateUpgrade(){
        level += 1
        cost = cost * 1.06
    }
}
