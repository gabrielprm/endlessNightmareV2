//
//  EnemyGenerator.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

class EnemyGenerator: SKSpriteNode {
    
    init() {
        let enemy = SKTexture(imageNamed: "enemy")
        let enemy1 = SKTexture(imageNamed: "enemy1")
        let textures = [enemy, enemy1]
        
        super.init(texture: enemy, color: .clear, size: enemy.size())
        
        setScale(0.25)
        
        let physics = SKPhysicsBody(circleOfRadius: 10)
        
        physics.affectedByGravity = false
        physics.categoryBitMask = 1
        physics.contactTestBitMask = 2
        physics.collisionBitMask = 0 // Ignorar colisão
        
        physicsBody = physics
        
        let animateEnemy = SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.25))
        run(animateEnemy)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
