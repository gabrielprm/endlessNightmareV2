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
    
    static func updateMap(firstMap: SKSpriteNode, secondMap: SKSpriteNode, count:CGFloat){
        firstMap.run(SKAction.moveBy(x: MapData.movXCoefficient * count, y: MapData.movYCoefficient * count, duration: 0.1))

        if (firstMap.position.x < -1250) {
            firstMap.position = CGPoint(x: MapData.initialXPositionSecondMap, y: MapData.initialYPositionSecondMap)
            firstMap.zPosition = 0
            secondMap.zPosition = 1
        }else{
            if secondMap.position.x < -1250{
                secondMap.position = CGPoint(x: MapData.initialXPositionSecondMap, y: MapData.initialYPositionSecondMap)
                firstMap.zPosition = 1
                secondMap.zPosition = 0
            }
        }

        secondMap.run(SKAction.moveBy(x: MapData.movXCoefficient * count, y: MapData.movYCoefficient * count, duration: 0.1))
    }
}
