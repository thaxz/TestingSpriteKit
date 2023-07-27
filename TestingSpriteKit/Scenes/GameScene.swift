//
//  GameScene.swift
//  TestingSpriteKit
//
//  Created by thaxz on 27/07/23.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    
    var nowFruit: SKSpriteNode = SKSpriteNode()
    var scoreNode: SKSpriteNode = SKSpriteNode()
    var groundFruits: [SKSpriteNode] = []
    
    let screen = UIScreen.main.bounds
    
    // Right when the scene is presented
    override func didMove(to view: SKView) {
        // Adding physics to the whole screen, like a box
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        makeUI()
        makeScore()
        makeNowFruit()
    }
    
}



struct GameScene_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
