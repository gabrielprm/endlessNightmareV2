//
//  MapGenerator.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import Foundation
import SpriteKit
import GameplayKit

public class MapGenerator: SKSpriteNode{

    init(imageName: String, position: CGPoint, zPosition: CGFloat) {
        let texture = SKTexture(imageNamed: imageName)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        self.position = position
        self.zPosition = zPosition
        self.isUserInteractionEnabled = true
//        self.setScale(0.6)
    }
    
    convenience init(imageName: String, zPosition: CGFloat) {
        self.init(imageName: imageName, position: CGPoint(x: 0, y: 0), zPosition: zPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
