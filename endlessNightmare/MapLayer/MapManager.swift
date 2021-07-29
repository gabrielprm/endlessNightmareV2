//
//  MapManager.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

class MapManager: SKNode{
    
    static func updateMap(firstMap: SKSpriteNode, secondMap: SKSpriteNode, count: CGFloat) {
        let distanceSecondTofirst = CGPoint(x: secondMap.position.x - firstMap.position.x, y: secondMap.position.y - firstMap.position.y)
        let comprimentoSecondToFirst = sqrt(Double(distanceSecondTofirst.x * distanceSecondTofirst.x + distanceSecondTofirst.y * distanceSecondTofirst.y))
        
        let distanceFirstToScond = CGPoint(x: firstMap.position.x - secondMap.position.x, y: firstMap.position.y - secondMap.position.y)
        let comprimentoFirstToScond = sqrt(Double(distanceFirstToScond.x * distanceFirstToScond.x + distanceFirstToScond.y * distanceFirstToScond.y))
        
        if firstMap.position.x <= -680 {
            firstMap.position = CGPoint(x: MapData.initialXPositionSecondMap, y: MapData.initialYPositionSecondMap)
            firstMap.zPosition = 0
            secondMap.zPosition = 1
        } else if secondMap.position.x <= -680 {
            secondMap.position = CGPoint(x: MapData.initialXPositionSecondMap, y: MapData.initialYPositionSecondMap)
            firstMap.zPosition = 1
            secondMap.zPosition = 0
        }
        
        if comprimentoSecondToFirst >= 820 || firstMap.position.x < 150{
            firstMap.run(SKAction.moveBy(x: MapData.movXCoefficient * count * 0.9, y: MapData.movYCoefficient * count * 0.9, duration: 0.1))
        }
        
        if comprimentoFirstToScond >= 820 || secondMap.position.x < 150{
            secondMap.run(SKAction.moveBy(x: MapData.movXCoefficient * count * 0.9, y: MapData.movYCoefficient * count * 0.9, duration: 0.1))
        }
    }
    
}
