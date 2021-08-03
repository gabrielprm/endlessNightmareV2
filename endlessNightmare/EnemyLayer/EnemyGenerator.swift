//
//  EnemyGenerator.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

class EnemyGenerator: SKSpriteNode {
    
    init() {
        let firstTexture = SKTexture(imageNamed: "Moth01")
        let secondTexture = SKTexture(imageNamed: "Moth02")
        let thirdTexture = SKTexture(imageNamed: "Moth03")
        let fourthTexture = SKTexture(imageNamed: "Moth04")
        var textures: [SKTexture]
        
        let random = Int.random(in: 1...2)
        
        switch random {
        case 1:
            textures = [firstTexture, secondTexture]
        default:
            textures = [thirdTexture, fourthTexture]
        }
        
        super.init(texture: firstTexture, color: .clear, size: textures[0].size())
        
//        setScale(0.75)
        
        let physics = SKPhysicsBody(circleOfRadius: 10)
        
        physics.affectedByGravity = false
        physics.categoryBitMask = 1
        physics.contactTestBitMask = 2
        physics.collisionBitMask = 0 // Ignorar colisão
        
        physicsBody = physics
        
        let animation = SKAction.animate(with: textures, timePerFrame: 0.25)
        let runAnimation = SKAction.repeatForever(animation)
        
        run(runAnimation)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
