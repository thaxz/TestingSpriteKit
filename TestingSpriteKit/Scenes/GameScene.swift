//
//  GameScene.swift
//  TestingSpriteKit
//
//  Created by thaxz on 27/07/23.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    
    // Right when the scene is presented
    override func didMove(to view: SKView) {
        // Creating background
        let background = SKSpriteNode(color: UIColor(named: "backgroundColor")!, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        // Just like UIKit, adding to view hierarchy
        addChild(background)
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
