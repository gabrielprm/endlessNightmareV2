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
        
        self.zPosition = -1
        

    }
}
