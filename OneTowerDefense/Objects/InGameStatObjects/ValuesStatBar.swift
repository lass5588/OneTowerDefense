//
//  ValuesStatBar.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 09/08/2022.
//

import Foundation
import SpriteKit

class ValuesStatBar: SKLabelNode{
    
    init(location: CGPoint){
        super.init()
        text = "Cash: \(0) \nCoins: \(0) \nGems: \(0)"
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
    
    func update(cash: Double, coins: Int, gems: Int){
        text = "Cash: \(cash) \nCoins: \(coins) \nGems: \(gems)"
    }
}