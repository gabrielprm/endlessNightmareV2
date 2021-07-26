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
    var thirdBackground: SKSpriteNode! = nil
    var fourthBackground: SKSpriteNode! = nil
    
    let fundo1 = SKTexture(imageNamed: "FundoTeste1")
    let fundo2 = SKTexture(imageNamed: "FundoTeste2")
    let fundo3 = SKTexture(imageNamed: "FundoTeste3")
    let fundo4 = SKTexture(imageNamed: "FundoTeste4")
    
    var textures: [SKTexture] {
        return [fundo1, fundo2, fundo3, fundo4]
    }
    
    override init() {
//        let background = SKTexture(imageNamed: "background")
        
//        super.init(texture: fundo1, color: .clear, size: fundo1.size())
        
//        self.setScale(1.5)
//        self.position = position
        super.init()
        
        self.zPosition = -1
        
        let animation = SKAction.animate(with: textures, timePerFrame: 1)
        let runAnimation = SKAction.repeatForever(animation)
        
        run(runAnimation)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        self.zPosition = -1
        
//        let firstBackground = SKSpriteNode(texture: fundo1, size: CGSize(width: 750, height: 1334))
//        let secondBackground = SKSpriteNode(texture: fundo2, size: CGSize(width: 750, height: 1334))
//        let thirdBackground = SKSpriteNode(texture: fundo3, size: CGSize(width: 750, height: 1334))
//        let fourthBackground = SKSpriteNode(texture: fundo4, size: CGSize(width: 750, height: 1334))
//
//        addChild(firstBackground)
//        addChild(secondBackground)
//        addChild(thirdBackground)
//        addChild(fourthBackground)
//
//        firstBackground.zPosition = -1
//        secondBackground.zPosition = -2
//        thirdBackground.zPosition = -3
//        fourthBackground.zPosition = -4
        
        firstBackground = childNode(withName: "fundo1") as? SKSpriteNode
        secondBackground = childNode(withName: "fundo2") as? SKSpriteNode
//        thirdBackground = childNode(withName: "fundo3") as? SKSpriteNode
//        fourthBackground = childNode(withName: "fundo4") as? SKSpriteNode
        
        let timeDuration: TimeInterval = 5
        let wait = SKAction.wait(forDuration: timeDuration)
        let fadeOut = SKAction.fadeOut(withDuration: timeDuration)
        let fadeIn = SKAction.fadeIn(withDuration: timeDuration)
        var nextTexture = 2
        
//        let sequence = SKAction.sequence([wait, fadeOut, SKAction.run {
////            self.firstBackground.run(SKAction.animate(with: self.textures, timePerFrame: 0))
//
//            self.firstBackground.texture = self.textures[nextTexture]
//
//            print(nextTexture)
//
//            nextTexture = nextTexture + 1 > self.textures.capacity - 1 ? 0 : nextTexture + 1
//        }, wait, fadeIn, SKAction.run {
////            self.secondBackground.run(SKAction.animate(with: self.textures, timePerFrame: 0))
//
//            self.secondBackground.texture = self.textures[nextTexture]
//
//            print(nextTexture)
//
//            nextTexture = nextTexture + 1 > self.textures.capacity - 1 ? 0 : nextTexture + 1
//        }])
        
        let sequence = SKAction.sequence([wait, fadeOut, wait, fadeIn])
        
        firstBackground.run(SKAction.repeatForever(sequence))
    }
    
    func startRun() {
        
    }
    
}
