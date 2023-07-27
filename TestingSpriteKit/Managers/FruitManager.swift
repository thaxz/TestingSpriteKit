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
    
    private var randomCount = 0
    
    private let randomList = [
        FruitTexture.grape,
        FruitTexture.cherry,
        FruitTexture.orange,
        FruitTexture.lemon,
        FruitTexture.kiwi
    ]
    
     let screen = UIScreen.main.bounds
    
     func createRandomFruit() -> SKSpriteNode {
         randomCount += 1
         var fruit: SKSpriteNode
         var name: String
         switch randomCount {
         case 1...3:
             name = FruitTexture.grape.name
         case 4:
             name = FruitTexture.cherry.name
         case 5:
             name = FruitTexture.orange.name
         default:
             name = randomList.randomElement()!.name
         }
         fruit = SKSpriteNode(imageNamed: name)
         fruit.position = CGPoint(x: screen.width / 2, y: screen.height - 50)
         fruit.setScale(0.5)
         fruit.name = name
         return fruit
    }
    
    func getFruitTexture(by name: String) -> FruitTexture {
        FruitTexture.allCases.first{$0.name == name}!
    }
    
    
    
}
