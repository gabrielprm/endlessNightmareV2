//
//  CharacterGenerator.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

class CharacterGenerator: SKSpriteNode {
    
    init() {
        let textureCharacter1 = SKTexture(imageNamed: "character1")
        let textureCharacter2 = SKTexture(imageNamed: "character2")
        let textures = [textureCharacter1, textureCharacter2]
        
        super.init(texture: textureCharacter1, color: .clear, size: textureCharacter1.size())
        
        position = CharacterManager.nodePosition(row: CharacterManager.rowPosition)
        setScale(0.013)
        zPosition = 4
        
        let physics = SKPhysicsBody(circleOfRadius: 10)
        
        physics.isDynamic = false
        physics.categoryBitMask = 2
        physics.contactTestBitMask = 1
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
