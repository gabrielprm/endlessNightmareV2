//
//  Background.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import Foundation
import SpriteKit

class Background: SKNode {
    
    var firstBackground: SKSpriteNode! = nil
    var secondBackground: SKSpriteNode! = nil
    
    override init() {
        super.init()
        
        self.zPosition = -1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.zPosition = -1
        
        firstBackground = childNode(withName: "fundo1") as? SKSpriteNode
        secondBackground = childNode(withName: "fundo2") as? SKSpriteNode
        
        let timeDuration: TimeInterval = 3
        let wait = SKAction.wait(forDuration: timeDuration)
        let fadeOut = SKAction.fadeOut(withDuration: timeDuration)
        let fadeIn = SKAction.fadeIn(withDuration: timeDuration)
        var nextTexture = 2
        
        let sequence = SKAction.sequence([wait, fadeOut, SKAction.run {
//            self.firstBackground.run(SKAction.animate(with: self.textures, timePerFrame: 0))
            self.firstBackground.texture = AssetsReference.instance.backgrounds[nextTexture]
            
            nextTexture = nextTexture + 1 > AssetsReference.instance.backgrounds.capacity - 1 ? 0 : nextTexture + 1
        }, wait, fadeIn, SKAction.run {
//            self.secondBackground.run(SKAction.animate(with: self.textures, timePerFrame: 0))
            
            self.secondBackground.texture = AssetsReference.instance.backgrounds[nextTexture]
            
            nextTexture = nextTexture + 1 > AssetsReference.instance.backgrounds.capacity - 1 ? 0 : nextTexture + 1
        }])
        
        self.firstBackground.run(SKAction.repeatForever(sequence))
    }
}
