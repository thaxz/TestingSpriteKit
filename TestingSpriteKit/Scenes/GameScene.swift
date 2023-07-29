//
//  GameScene.swift
//  TestingSpriteKit
//
//  Created by thaxz on 27/07/23.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var nowFruit: SKSpriteNode!
    var scoreNode: SKSpriteNode = SKSpriteNode()
    var groundFruits: [SKSpriteNode] = []
    
    var score: Int = 0 {
        didSet {
            updateScore()
        }
    }
    
    var fruitUtil: FruitUtil!
    
    let screen = UIScreen.main.bounds
    
    // Right when the scene is presented
    override func didMove(to view: SKView) {
        view.showsFPS = true
        view.showsNodeCount = true
        // Adding physics to the whole screen, like a box
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsWorld.contactDelegate = self
        fruitUtil = FruitUtil()
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
