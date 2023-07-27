//
//  FruitManager.swift
//  TestingSpriteKit
//
//  Created by thaxz on 27/07/23.
//

import Foundation
import SpriteKit

class FruitManager {
    
    static let shared = FruitManager()
    private init() {}
    
     let screen = UIScreen.main.bounds
    
     func createRandomFruit() -> SKSpriteNode {
        let newFruit = SKSpriteNode(imageNamed: "kiwi" )
        newFruit.position = CGPoint(x: screen.width / 2, y: screen.height - 100)
        newFruit.setScale(0.5)
        return newFruit
    }
    
    func getFruitTexture(by name: String) -> FruitTexture {
        FruitTexture.allCases.first{$0.name == name}!
    }
    
}
