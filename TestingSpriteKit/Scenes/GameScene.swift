//
//  GameScene.swift
//  TestingSpriteKit
//
//  Created by thaxz on 27/07/23.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    var nowFruit: SKSpriteNode!
    
    let screen = UIScreen.main.bounds
    
    // Right when the scene is presented
    override func didMove(to view: SKView) {
       makeUI()
        makeNowFruit()
    }
    
    func makeUI(){
        // Creating background
        let background = SKSpriteNode(color: UIColor.theme.background, size: CGSize(width: screen.width, height: screen.height))
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        // Just like UIKit, adding to view hierarchy
        addChild(background)
        // Creating and configuring floor
        let floor = SKSpriteNode(color: UIColor.theme.floor, size: CGSize(width: screen.width, height: screen.height / 5))
        floor.anchorPoint = CGPoint.zero
        floor.position = CGPoint.zero
        addChild(floor)
    }
    
    func makeNowFruit(){
        nowFruit = SKSpriteNode(imageNamed: "grape" )
        nowFruit.position = CGPoint(x: screen.width / 2, y: screen.height - 100)
        nowFruit.setScale(0.5)
        addChild(nowFruit)
    }
    
}

// MARK: - Touches
extension GameScene {
    
    // When start touching
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    // When start moving
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    // When touches end
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}

struct GameScene_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
