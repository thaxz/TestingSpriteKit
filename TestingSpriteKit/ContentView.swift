//
//  ContentView.swift
//  TestingSpriteKit
//
//  Created by thaxz on 26/07/23.
//

import SpriteKit
import SwiftUI

struct ContentView: View {
    // Configurating scene
    var scene: SKScene {
        let scene = SKScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return scene
    }
    var body: some View {
       // Presenting game scene
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
