//
//  MapGenerator.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit
import GameplayKit

public class Map: SKSpriteNode{

    init(imageName: String, position: CGPoint, zPosition: CGFloat) {
        let texture = SKTexture(imageNamed: imageName)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.zPosition = zPosition
        self.position = position
    }
    
    convenience init(imageName: String, zPosition: CGFloat) {
        self.init(imageName: imageName, position: CGPoint(x: 0, y: 0), zPosition: zPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
