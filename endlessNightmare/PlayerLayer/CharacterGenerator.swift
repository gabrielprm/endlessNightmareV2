//
//  CharacterGenerator.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

class CharacterGenerator: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "character")
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.position = CharacterManager.nodePosition(row: CharacterManager.rowPosition)
        self.setScale(0.013)
        self.zPosition = 4
        
        let physics = SKPhysicsBody(rectangleOf: size)
        
        physics.isDynamic = false
        physics.categoryBitMask = 1
        physics.contactTestBitMask = 2
        physics.collisionBitMask = 0 // Ignorar colisão
        
        self.physicsBody = physics
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
