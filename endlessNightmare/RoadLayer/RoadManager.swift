//
//  MapManager.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import SpriteKit

class RoadManager: SKNode{
    
    static func updateRoad(firstRoad: SKSpriteNode, secondRoad: SKSpriteNode, count: CGFloat) {
        let distanceSecondTofirst = CGPoint(x: secondRoad.position.x - firstRoad.position.x, y: secondRoad.position.y - firstRoad.position.y)
        let comprimentoSecondToFirst = sqrt(Double(distanceSecondTofirst.x * distanceSecondTofirst.x + distanceSecondTofirst.y * distanceSecondTofirst.y))
        
        let distanceFirstToScond = CGPoint(x: firstRoad.position.x - secondRoad.position.x, y: firstRoad.position.y - secondRoad.position.y)
        let comprimentoFirstToScond = sqrt(Double(distanceFirstToScond.x * distanceFirstToScond.x + distanceFirstToScond.y * distanceFirstToScond.y))
        
        if firstRoad.position.x <= -680 {
            firstRoad.position = CGPoint(x: RoadData.initialXPositionSecondRoad, y: RoadData.initialYPositionSecondRoad)
            firstRoad.zPosition = 0
            secondRoad.zPosition = 1
        } else if secondRoad.position.x <= -680 {
            secondRoad.position = CGPoint(x: RoadData.initialXPositionSecondRoad, y: RoadData.initialYPositionSecondRoad)
            firstRoad.zPosition = 1
            secondRoad.zPosition = 0
        }
        
        if comprimentoSecondToFirst >= 820 || firstRoad.position.x < 150{
            firstRoad.run(SKAction.moveBy(x: RoadData.movXCoefficient * count * 0.9, y: RoadData.movYCoefficient * count * 0.9, duration: 0.1))
        }
        
        if comprimentoFirstToScond >= 820 || secondRoad.position.x < 150{
            secondRoad.run(SKAction.moveBy(x: RoadData.movXCoefficient * count * 0.9, y: RoadData.movYCoefficient * count * 0.9, duration: 0.1))
        }
    }
    
}
