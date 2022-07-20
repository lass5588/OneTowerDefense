//
//  ContentView.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack{
            
            Tower()
            
            BasicEnemy(damage: 1, health: 5, speed: 2)
                
            
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 100, height: 50)
//                .position(x: xPosEnemy, y: yPosEnemy)
//                .gesture(DragGesture().onChanged({value in
//                    self.xPosEnemy = value.location.x
//                    self.yPosEnemy = value.location.y
//                    self.checkCollision()
//                }))
            
            
        }
    }
    
//    func checkCollision(){
//        if abs(self.xPosEnemy - self.xPosPlayer) < 75 && abs(self.yPosEnemy - self.yPosPlayer) < 50{
//            counter += 1
//            print("A collision has occured \(counter) number of times.")
//        }
//    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
