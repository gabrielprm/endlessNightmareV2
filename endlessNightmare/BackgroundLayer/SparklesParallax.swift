//
//  ParallaxBrilho.swift
//  endlessNightmare
//
//  Created by Victor Henrique Caliope Soares on 30/07/21.
//

import Foundation
import SpriteKit

class Sparkles: SKSpriteNode{
    
    static func movSparkles(sparkles1: SKSpriteNode, sparkles2: SKSpriteNode, count: CGFloat, initialPosition: CGPoint) {
        
        if sparkles1.position.x <= -1200 {
            sparkles1.position = CGPoint(x: initialPosition.x, y: initialPosition.y)
        } else if sparkles2.position.x <= -1200 {
            sparkles2.position = CGPoint(x: initialPosition.x, y: initialPosition.y)
        }
        
        sparkles1.run(SKAction.moveBy(x: -count, y: 0, duration: 0.1))
        
        sparkles2.run(SKAction.moveBy(x: -count, y: 0, duration: 0.1))
    }
    
    
}
