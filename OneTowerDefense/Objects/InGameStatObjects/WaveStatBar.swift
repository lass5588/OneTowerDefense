//
//  WaveStatBar.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 31/08/2022.
//

import SpriteKit
import UIKit

class WaveStatBar: SKLabelNode{
    init(location: CGPoint){
        super.init()
        text = "Wave: 0 \nTime: 0"
        horizontalAlignmentMode = .left
        position = location
        fontName = "AvenirNext-Bold"
        fontColor = .black
        fontSize = 13
        numberOfLines = 0 // no bound.
    }
    
    func update(wave: Int, timer: TimeInterval){
        text = "Wave: \(wave)\n Time: \(timer)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
