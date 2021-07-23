//
//  Background.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import Foundation
import SpriteKit

class Background: SKSpriteNode {
    
    let fundo1 = SKTexture(imageNamed: "FundoTeste1")
    let fundo2 = SKTexture(imageNamed: "FundoTeste2")
    let fundo3 = SKTexture(imageNamed: "FundoTeste3")
    let fundo4 = SKTexture(imageNamed: "FundoTeste4")
    
    var textures: [SKTexture] {
        return [fundo1, fundo2, fundo3, fundo4]
    }
    
    init(position: CGPoint) {
//        let background = SKTexture(imageNamed: "background")
        
        super.init(texture: fundo1, color: .clear, size: fundo1.size())
        
        self.setScale(1.5)
        self.position = position
        self.zPosition = -1
        
        let animation = SKAction.animate(with: textures, timePerFrame: 1)
        let runAnimation = SKAction.repeatForever(animation)
        
        run(runAnimation)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.zPosition = -1
        
//        let firstBackground = SKSpriteNode(texture: fundo1, size: size)
        let secondBackground = SKSpriteNode(texture: fundo2, size: size)
        let thirdBackground = SKSpriteNode(texture: fundo3, size: size)
        let fourthBackground = SKSpriteNode(texture: fundo4, size: size)
        
//        addChild(firstBackground)
        addChild(secondBackground)
        addChild(thirdBackground)
        addChild(fourthBackground)
        
        let fadeOut = SKAction.fadeOut(withDuration: 5)
        let fadeIn = SKAction.fadeIn(withDuration: 5)
        
//        firstBackground.run(fadeOut)
        
        run(fadeOut)
        secondBackground.run(fadeIn)
        
        print("teste")
    }
    
}
