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
        thirdBackground = childNode(withName: "fundo3") as? SKSpriteNode
        fourthBackground = childNode(withName: "fundo4") as? SKSpriteNode
        
//        let backgrounds = [firstBackground, secondBackground, thirdBackground, fourthBackground]
        
        let fadeOut = SKAction.fadeOut(withDuration: 5)
        let fadeIn = SKAction.fadeIn(withDuration: 5)
        
        let sequence = SKAction.sequence([SKAction.wait(forDuration: 5), fadeOut])
        
        firstBackground.run(sequence, completion: {
            self.secondBackground.run(sequence, completion: {
                self.thirdBackground.run(sequence, completion: {
                    self.fourthBackground.run(sequence, completion: {
                        self.firstBackground.run(fadeIn)
                        
                        self.secondBackground.alpha = 1
                        self.thirdBackground.alpha = 1
                        self.fourthBackground.alpha = 1
                    })
                })
            })
        })
        
//        let firstSequence = SKAction.sequence([SKAction.wait(forDuration: 5 * 1), fadeOut])
//        let secondSequence = SKAction.sequence([SKAction.wait(forDuration: 5 * 2), fadeOut])
//        let thirdSequence = SKAction.sequence([SKAction.wait(forDuration: 5 * 3), fadeOut])
//        let fourthSequence = SKAction.sequence([SKAction.wait(forDuration: 5 * 4), fadeOut])
//        let fiveSequence = SKAction.sequence([SKAction.wait(forDuration: 5 * 4), fadeIn])
//
//        self.firstBackground.run(firstSequence)
//        self.secondBackground.run(secondSequence)
//        self.thirdBackground.run(thirdSequence)
//        self.fourthBackground.run(fourthSequence)
//
//        self.firstBackground.run(fiveSequence)
//
//        self.secondBackground.alpha = 1
//        self.thirdBackground.alpha = 1
//        self.fourthBackground.alpha = 1
    }
    
    func startRun() {
        
    }
    
}
