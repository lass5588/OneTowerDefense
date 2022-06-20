//
//  ContentView.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/06/2022.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    @State var xPosPlayer: CGFloat = 200
    @State var yPosPlayer: CGFloat = 300
    
    @State var xPosEnemy: CGFloat = 200
    @State var yPosEnemy: CGFloat = 600
    
    @State var counter = 0
    
    
    var body: some View {
        ZStack{
            
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .position(x: xPosPlayer, y: yPosPlayer)
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 50)
                .position(x: xPosEnemy, y: yPosEnemy)
                .gesture(DragGesture().onChanged({value in
                    self.xPosEnemy = value.location.x
                    self.yPosEnemy = value.location.y
                    self.checkCollision()
                }))
            
            
        }
    }
    
    func checkCollision(){
        if abs(self.xPosEnemy - self.xPosPlayer) < 100 && abs(self.yPosEnemy - self.yPosPlayer) < 100{
            counter += 1
            print("A collision has occured \(counter) number of times.")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
