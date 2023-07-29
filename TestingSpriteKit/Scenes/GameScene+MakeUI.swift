//
//  GameScene+MakeUI.swift
//  TestingSpriteKit
//
//  Created by thaxz on 27/07/23.
//

import SwiftUI
import SpriteKit

// MARK: Build UI

extension GameScene {
    
    func makeUI(){
        // Creating background
        let background = SKSpriteNode(color: UIColor.theme.background, size: CGSize(width: screen.width, height: screen.height))
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        // Just like UIKit, adding to view hierarchy
        addChild(background)
        // Creating and configuring floor
        let solid = SKSpriteNode(color: UIColor.theme.solid, size: CGSize(width: screen.width, height: screen.height / 5))
        solid.anchorPoint = CGPoint.zero
        solid.position = CGPoint.zero
        addChild(solid)
        let ground = SKSpriteNode(color: UIColor.theme.floor, size: CGSize(width: screen.width, height: 10))
        ground.anchorPoint = CGPoint.zero
        ground.position = CGPoint(x: 0, y: screen.height/5)
        ground.physicsBody = SKPhysicsBody(
            edgeFrom: CGPoint(x: 0, y: ground.size.height),
            to: CGPoint(x: ground.size.width, y: ground.size.height)
        )
        addChild(ground)
    }
    
    func makeScore(){
        scoreNode = SKSpriteNode(imageNamed: "number/0")
        scoreNode.position = CGPoint.init(x: 50, y: screen.height - 100)
        scoreNode.setScale(0.8)
        addChild(scoreNode)
    }
    
    func makeNowFruit(){
        nowFruit = fruitUtil.randomFruit()
        addChild(nowFruit)
    }
    
}
