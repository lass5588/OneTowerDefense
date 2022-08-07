//
//  InGameUpradeMenu.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 21/07/2022.
//

import SpriteKit
import SwiftUI

class InGameUpgradeMenu: SKSpriteNode{
    
    init(menuSize: CGSize){
        super.init(texture: nil, color: .white, size: menuSize)
        name = "inGameMenuBackground"
        position = CGPoint(x: menuSize.width / 2, y: menuSize.height / 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
}
