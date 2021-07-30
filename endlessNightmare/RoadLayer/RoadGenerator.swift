//
//  MapGenerator.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

class RoadGenerator: SKSpriteNode{

    init(position: CGPoint, zPosition: CGFloat) {
        let texture = SKTexture(imageNamed: "Road")
        
        super.init(texture: texture, color: .clear, size: texture.size())
        self.position = position
        self.zPosition = zPosition
        self.isUserInteractionEnabled = true
//        self.setScale(0.9)
    }
    
    convenience init(zPosition: CGFloat) {
        self.init(position: CGPoint(x: 0, y: 0), zPosition: zPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
