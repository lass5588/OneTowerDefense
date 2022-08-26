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
        text = "\(upgradeText): \(String(format: "%.2f", value)) \nlevel: \(level) - cost: \(String(format: "%.2f", cost))"
        name = nameReference
        position = location
        fontName = "AvenirNext-bold"
        fontColor = .white
        fontSize = 12
        numberOfLines = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateText(upgrade: Upgrade, value: Any){
        text = "\(upgrade.upgradeText): \(String(format: "%.2f", value as! CVarArg)) \nlevel: \(upgrade.level) - cost: \(String(format: "%.2f", upgrade.cost))"
    }
}
