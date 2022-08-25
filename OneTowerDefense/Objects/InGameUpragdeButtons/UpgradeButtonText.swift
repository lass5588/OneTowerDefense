//
//  upgradeButtonText.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 25/08/2022.
//

import Foundation
import SpriteKit

class UpgradeButtonText: SKLabelNode{
    init(location: CGPoint, nameReference: String, upgradeText: String, value: Double, level: Int, cost: Double){
        super.init()
        horizontalAlignmentMode = .left
        text = "\(upgradeText): \(value) \n level: \(level) - cost: \(cost)"
        name = nameReference
        position = location
        fontName = "AvenirNext-bold"
        fontColor = .white
        fontSize = 14
        numberOfLines = 2 // no bound.
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
