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
        scene.backgroundColor = SKColor.darkGray
        return scene
    }
    
    var body: some View {
        
        let screenWidth  = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        SpriteView(scene: scene)
            .frame(width: screenWidth, height: screenHeight)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
