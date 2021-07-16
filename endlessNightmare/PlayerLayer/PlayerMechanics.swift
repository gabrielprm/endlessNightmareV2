//
//  PlayerMechanics.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import Foundation
import SpriteKit

public class PlayerMechanics {
    static func moveDown(_ character: SKNode){
        switch characterGenerator.rowPosition {
            case 1:
                let action = SKAction.move(to: NodePosition.nodePosition(row: 2), duration: 0.1)
                character.run(action)
                characterGenerator.rowPosition = 2
            case 2:
                let action = SKAction.move(to: NodePosition.nodePosition(row: 3), duration: 0.1)
                character.run(action)
                characterGenerator.rowPosition = 3
            default:
                break
        }
    }
    
    static func moveUp(_ character: SKNode){
        switch characterGenerator.rowPosition {
            case 2:
                let action = SKAction.move(to: NodePosition.nodePosition(row: 1), duration: 0.1)
                character.run(action)
                characterGenerator.rowPosition = 1
            case 3:
                let action = SKAction.move(to: NodePosition.nodePosition(row: 2), duration: 0.1)
                character.run(action)
                characterGenerator.rowPosition = 2
            default:
                break
        }
    }
    
    static func jump(){
       print("Pulou...")
    }
    
    
}
