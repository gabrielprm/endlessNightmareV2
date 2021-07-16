//
//  MapManager.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import Foundation
import SpriteKit
import GameplayKit

public class MapManager: SKNode{
    
    static func updateMap(firstMap: SKSpriteNode, secondMap: SKSpriteNode){
        firstMap.run(SKAction.moveBy(x: MapData.movXCoefficient, y: MapData.movYCoefficient, duration: 0.1))

        if (firstMap.position.x < -1310) {
            firstMap.position = secondMap.position
            secondMap.position = CGPoint(x: MapData.initialXPositionSecondMap, y: MapData.initialYPositionSecondMap)
        }

        secondMap.run(SKAction.moveBy(x: MapData.movXCoefficient, y: MapData.movYCoefficient, duration: 0.1))
    }
}
