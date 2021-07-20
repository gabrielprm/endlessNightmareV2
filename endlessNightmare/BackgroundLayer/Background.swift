//
//  Background.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import Foundation
import SpriteKit

class Background: SKSpriteNode {
    
    init(position: CGPoint) {
        let background = SKTexture(imageNamed: "Background")
        
        super.init(texture: background, color: .clear, size: background.size())
    
        self.setScale(1.5)
        self.position = position
        self.zPosition = -1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.zPosition = -1
    }
    
}
