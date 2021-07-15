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
                character.position = NodePosition.nodePosition(row: 2)
                characterGenerator.rowPosition = 2
            case 2:
                character.position = NodePosition.nodePosition(row: 3)
                characterGenerator.rowPosition = 3
            default:
                break
        }
    }
    
    static func moveUp(_ character: SKNode){
        switch characterGenerator.rowPosition {
            case 2:
                character.position = NodePosition.nodePosition(row: 1)
                characterGenerator.rowPosition = 1
            case 3:
                character.position = NodePosition.nodePosition(row: 2)
                characterGenerator.rowPosition = 2
            default:
                break
        }
    }
    
    static func jump(){
       print("Pulou...")
    }
    
    
}
