//
//  ValuesStatBar.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 09/08/2022.
//

import Foundation
import SpriteKit

class ValuesStatBar: SKLabelNode, StringAbbreviation{
    
    init(location: CGPoint, tower: TowerNode){
        super.init()
        text = "Cash: \(tower.cash) \nCoins: \(tower.coins) \nGems: \(tower.gems)"
        horizontalAlignmentMode = .right
        position = location
        //fontName = "AvenirNext-Bold"
        fontColor = .white
        fontSize = 16
        numberOfLines = 0 // no bound.
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(tower: TowerNode){
        text = "Cash: " + doubleToStringAbbreviation(num: tower.cash) + "\nCoins: " + doubleToStringAbbreviation(num: tower.coins) + "\nGems: " + intToStringAbbreviation(num: tower.gems)
    }
}
