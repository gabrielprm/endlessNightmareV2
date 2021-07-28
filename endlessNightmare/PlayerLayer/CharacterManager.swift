//
//  PlayerMechanics.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

class CharacterManager {
    
    static var rowPosition = 2
    
    static func moveDown(_ character: SKNode) {
        switch rowPosition {
            case 1:
                let action = SKAction.move(to: nodePosition(row: 2), duration: 0.1)
                character.run(action)
                rowPosition = 2
                character.zPosition = 8
            case 2:
                let action = SKAction.move(to: nodePosition(row: 3), duration: 0.1)
                character.run(action)
                rowPosition = 3
            default:
                break
        }
    }
    
    static func moveUp(_ character: SKNode) {
        switch rowPosition {
            case 2:
                let action = SKAction.move(to: nodePosition(row: 1), duration: 0.1)
                character.run(action)
                rowPosition = 1
                character.zPosition = 6
            case 3:
                let action = SKAction.move(to: nodePosition(row: 2), duration: 0.1)
                character.run(action)
                rowPosition = 2
                character.zPosition = 8
            default:
                break
        }
    }
    
    static func jump() {
       print("Pulou...")
    }
    
    static func nodePosition(row: Int) -> CGPoint {
        var x: CGFloat = 0
        var y: CGFloat = 0
        switch row {
            case 1:
                x = -176.312
                y = 1.25
            case 2:
                x = -149.062
                y = -45.5
            case 3:
                x = -118.187
                y = -102.191
            default:
                break
        }
        return CGPoint(x: x, y: y)
    }
    
}
