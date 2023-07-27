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
        // Making sure there's a touch
        guard let touch = touches.first else {return}
        // Getting touch coords
        let location = touch.location(in: self)
        // Adding all actions
        nowFruit.run(.sequence([
            //move according to the x coord of the touch
            .moveTo(x: location.x, duration: 0.3),
            .run {
                // Adding physics
                self.nowFruit.physicsBody = SKPhysicsBody(circleOfRadius: self.nowFruit.size.height / 2)
            },
                .wait(forDuration: 1),
            .run {
                // Adding to the array of fallenfruits
                self.groundFruits.append(self.nowFruit)
                // Creating a random fruit
                self.nowFruit = createRandomFruit()
            }
        ]))
        
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
