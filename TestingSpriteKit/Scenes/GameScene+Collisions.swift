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
        for fruit in FruitTexture.allCases {
           let fruitBit = fruit.bitmask | fruit.bitmask
            // if it's a collision, the fruit disappears
            if fruitBit == collision {
                contact.bodyA.node?.run(.fadeOut(withDuration: 0.1))
                contact.bodyB.node?.run(.fadeOut(withDuration: 0.1))
            }
        }
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