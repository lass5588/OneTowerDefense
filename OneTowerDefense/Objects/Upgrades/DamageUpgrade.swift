//
//  DamageUpgrade.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 29/08/2022.
//

import UIKit

class DamageUpgrade: Upgrade {
    
    override func updateUpgrade(){
        level += 1
        cost = cost * 1.1
    }
}
