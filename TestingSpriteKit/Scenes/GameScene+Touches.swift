//
//  GameScene+Touches.swift
//  TestingSpriteKit
//
//  Created by thaxz on 27/07/23.
//

import SpriteKit
import SwiftUI

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
                self.nowFruit = FruitManager.shared.createRandomFruit()
                self.addChild(self.nowFruit)
                self.nowFruit.setScale(0)
                self.nowFruit.run(.scale(to: 0.5, duration: 0.2))
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

struct GameSceneTouches_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
