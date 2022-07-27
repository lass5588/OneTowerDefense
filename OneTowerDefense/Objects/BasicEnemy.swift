//
//  BasicEnemy.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/07/2022.
//

import Foundation
import SwiftUI

struct BasicEnemy{
    var damage: Double
    var health: Double
    var speed: Double
    @State var xPos: CGFloat = 200
    @State var yPos: CGFloat = 200
    
    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View{
        Rectangle()
            .fill(.red)
            .frame(width: 20, height: 20)
            .position(x: xPos, y: yPos)
            .onReceive(timer){ _ in
                move()
            }
            
    }
    
    func move(){
        yPos -= 1
        
    }

}
