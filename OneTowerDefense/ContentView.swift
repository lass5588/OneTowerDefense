//
//  ContentView.swift
//  OneTowerDefense
//
//  Created by Lasse Andersen on 20/06/2022.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    let upgradeMenuColor = Color(red: 23/255, green: 33/255, blue: 101/255)
    
    var scene: SKScene{
        let scene = Gamescene()
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var body: some View {
        
        let screenWidth  = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        SpriteView(scene: scene)
            .frame(width: screenWidth, height: screenHeight)
            .ignoresSafeArea()
        
//        VStack{
//            GeometryReader { geomerty in
//                VStack{
//                    VStack{
//                        Tower()
//
//                        BasicEnemy(damage: 1, health: 5, speed: 2)
//
//                        Circle()
//                            .frame(width: 50, height: 50)
//                            .SKPhysicsBody(circleOfRadius: 50)
//                    }
//                    VStack{
//                        HStack{
//                            Text("Damage")
//                                .multilineTextAlignment(.center)
//                                .padding()
//                                .frame(width: 200, height: 50)
//                                .background(Rectangle().fill(Color.gray).shadow(radius: 3))
//
//                            Text("Health")
//                                .multilineTextAlignment(.center)
//                                .padding()
//                                .frame(width: 200, height: 50)
//                                .background(Rectangle().fill(Color.gray).shadow(radius: 3))
//                        }
//
//                    }
//                    //.frame(width: geomerty.size.width, height: geomerty.size.height * 0.08)
//
//                    VStack{
//                        Rectangle()
//                            .fill(upgradeMenuColor)
//                            .frame(width: 400, height: 300)
//                    }
//                }
//            }
//        }
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
