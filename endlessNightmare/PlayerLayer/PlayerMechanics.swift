//
//  PlayerMechanics.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

public class PlayerMechanics {
    
    static func moveDown(_ character: SKNode) {
        switch CharacterGenerator.rowPosition {
            case 1:
                let action = SKAction.move(to: NodePosition.nodePosition(row: 2), duration: 0.1)
                character.run(action)
                CharacterGenerator.rowPosition = 2
                character.zPosition = 8
            case 2:
                
                let action = SKAction.move(to: NodePosition.nodePosition(row: 3), duration: 0.1)
                character.run(action)
                CharacterGenerator.rowPosition = 3
            default:
                break
        }
    }
    
    static func moveUp(_ character: SKNode) {
        switch CharacterGenerator.rowPosition {
            case 2:
                let action = SKAction.move(to: NodePosition.nodePosition(row: 1), duration: 0.1)
                character.run(action)
                CharacterGenerator.rowPosition = 1
                character.zPosition = 6
            case 3:
                let action = SKAction.move(to: NodePosition.nodePosition(row: 2), duration: 0.1)
                character.run(action)
                CharacterGenerator.rowPosition = 2
                character.zPosition = 8
            default:
                break
        }
    }
    
    static func jump() {
       print("Pulou...")
    }
    
}
