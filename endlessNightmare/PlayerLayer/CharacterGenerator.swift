//
//  CharacterGenerator.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//
import Foundation
import SpriteKit

public class CharacterGenerator: SKSpriteNode {
    
    static var rowPosition = 2
    
    init() {
        let character = SKTexture(imageNamed: "character")
        
        super.init(texture: character, color: .clear, size: character.size())
        
        self.position = NodePosition.nodePosition(row: 2)
        self.setScale(0.013)
        self.zPosition = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
