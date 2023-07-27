//
//  GameScene+Collisions.swift
//  TestingSpriteKit
//
//  Created by thaxz on 27/07/23.
//

import SpriteKit
import SwiftUI

// MARK: - Collisions

extension GameScene {
    
    // When the contact begins
    func didBegin(_ contact: SKPhysicsContact) {
        // Setting every collision
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let contactPoint = contact.bodyA.node?.position.x
        for fruit in FruitTexture.allCases {
           let fruitBit = fruit.bitmask | fruit.bitmask
            // if it's a collision, the fruit disappears
            if fruitBit == collision {
                let nodeA = contact.bodyA.node!
                let nodeB = contact.bodyB.node!
                
               let newFruitPosition = CGPoint(
                x: (nodeA.position.x + nodeB.position.x) / 2,
                y: (nodeA.position.y + nodeB.position.y) / 2
                )
                
                    run(.sequence([
                        .run {
                            nodeA.run(.fadeOut(withDuration: 0.1))
                            nodeB.run(.fadeOut(withDuration: 0.1))
                        },
                        .run {
                            nodeA.removeFromParent()
                            nodeB.removeFromParent()
                        },
                        .run {
                            self.generateNewFruitFromPosition(position: newFruitPosition)
                            
                        }
                    
                    ]))
                
                
            }
        }
    }
    
    func generateNewFruitFromPosition(position: CGPoint){
        // setting new fruit
        let fruit = fruitUtil.createRandomFruit()
        fruit.position = position
        fruit.physicsBody = SKPhysicsBody(circleOfRadius: fruit.size.height/2)
        let bitmask = fruitUtil.getFruitTexture(by: fruit.name!).bitmask
        fruit.physicsBody?.categoryBitMask = bitmask
        fruit.physicsBody?.contactTestBitMask = bitmask
        addChild(fruit)
        //animation
        fruit.setScale(0)
        fruit.run(.scale(to: 0.5, duration: 0.3))
    }
    
    // When the contact ends
    func didEnd(_ contact: SKPhysicsContact) {
        
    }
    
    
    
}

struct GameSceneCollisions_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
