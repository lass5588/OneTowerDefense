//
//  BasicEnemy.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/07/2022.
//

import Foundation
import SwiftUI

struct BasicEnemy: Enemy{
    var damage: Double
    var health: Double
    var speed: Double
    @State var xPos: CGFloat = 200
    @State var yPos: CGFloat = 600
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View{
        Rectangle()
            .fill(Color.red)
            .frame(width: 20, height: 20)
            .position(x: xPos, y: yPos)
            
    }
    
    func move(){
        yPos -= 2
        
    }

}
