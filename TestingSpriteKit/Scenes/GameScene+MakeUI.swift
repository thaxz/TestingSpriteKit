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
        self.ground = SKSpriteNode(color: UIColor.theme.floor, size: CGSize(width: screen.width, height: 10))
        ground.anchorPoint = CGPoint.zero
        ground.position = CGPoint(x: 0, y: screen.height/5)
        ground.physicsBody = SKPhysicsBody(
            edgeFrom: CGPoint(x: 0, y: ground.size.height),
            to: CGPoint(x: ground.size.width, y: ground.size.height)
        )
        ground.physicsBody?.categoryBitMask = 0xFFFFFFFF >> 1
        ground.physicsBody?.contactTestBitMask = 0xFFFFFFFF >> 1
        addChild(ground)
    }
    
    func makeScore() {
        scoreNode = SKSpriteNode()
        scoreNode.position = CGPoint(x: 30, y: screen.height - 50)
        scoreNode.setScale(0.5)
        addChild(scoreNode)
        
        updateScore()
    }
    
    func updateScore() {
        scoreNode.removeAllChildren()
        
        var scoreCopy = score
        var arr: [Int] = []
        
        if scoreCopy == 0 {
            arr.append(0)
        } else {
            while scoreCopy != 0 {
                arr.append(scoreCopy % 10)
                scoreCopy /= 10
            }
        }
        
        var cnt = 0
        while arr.count != 0 {
            let last = arr.popLast()!
            let node = SKSpriteNode(imageNamed: "number/\(last)")
            node.position = CGPoint(x: cnt * 70, y: 0)
            cnt += 1
            scoreNode.addChild(node)
        }
    }
    
    func makeNowFruit(){
        nowFruit = fruitUtil.randomFruit()
        addChild(nowFruit)
    }
    
}
