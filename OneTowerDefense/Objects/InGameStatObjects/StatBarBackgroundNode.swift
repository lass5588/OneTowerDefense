//
//  StatBarBackgroundNode.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 09/08/2022.
//

import Foundation
import SpriteKit

class StatBarBackgroundNode: SKSpriteNode{
    init(location: CGPoint){
        super.init(texture: nil, color: .lightGray, size: CGSize(width: 200, height: 60))
        position = location
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

