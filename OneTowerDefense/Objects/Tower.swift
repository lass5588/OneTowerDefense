//
//  Tower.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/06/2022.
//

import Foundation
import SwiftUI

struct Tower: View{
    var width: CGFloat = 50
    var height: CGFloat = 50
    var xPos: CGFloat = 200
    var yPos: CGFloat = 300
    
    var health: Double = 10
    var damage: Double = 1
    var attackSpeed: Double = 1

    var body: some View{
        Circle()
            .frame(width: width, height: height)
            .position(x: xPos, y: yPos)
            .foregroundColor(.blue)
    }
}
