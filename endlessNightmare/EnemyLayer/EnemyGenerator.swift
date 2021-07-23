//
//  EnemyGenerator.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

class EnemyGenerator: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "enemy")

        super.init(texture: texture, color: .clear, size: texture.size())
        
        setScale(0.12)
        
        let physics = SKPhysicsBody(circleOfRadius: 10)
        
        physics.affectedByGravity = false
        physics.categoryBitMask = ContactCategory.enemy.rawValue
        physics.contactTestBitMask = ContactCategory.character.rawValue
        physics.collisionBitMask = 0 // Ignorar colisão
        
        physicsBody = physics
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
