//
//  SparklesGenerator.swift
//  endlessNightmare
//
//  Created by Victor Henrique Caliope Soares on 30/07/21.
//

import Foundation
import SpriteKit

class SparklesGenerator: SKSpriteNode{
    
    init(position: CGPoint, imageName: String) {
        let texture = SKTexture(imageNamed: imageName)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        self.position = position
        self.zPosition = -1
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
