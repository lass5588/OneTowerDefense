//
//  UpgradeButtonFrame.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 15/08/2022.
//

import Foundation
import SpriteKit

class UpgradeButtonFrame: SKSpriteNode{
    init(location: CGPoint, nameReference: String){
        super.init(texture: nil, color: .darkGray, size: CGSize(width: 200, height: 60))
        position = location
        name = nameReference
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
