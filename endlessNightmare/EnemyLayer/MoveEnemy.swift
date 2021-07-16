//
//  MoveEnemy.swift
//  endlessNightmare
//
//  Created by Victor Henrique Caliope Soares on 16/07/21.
//

import Foundation
import SpriteKit

public class MoveEnemy{
    
    static func Move(masterNode: SKNode){
        masterNode.run(SKAction.moveBy(x: MapData.movXCoefficient, y: MapData.movYCoefficient, duration: 1))
    }
}
