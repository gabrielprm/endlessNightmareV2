//
//  EnemyManager.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 16/07/21.
//

import SpriteKit

struct EnemyManager {
    
    static var lastPosition = 0
    
    static func enemyBorn() {

        var random = Int.random(in: 1...7)
        
        while random == lastPosition {
            random = Int.random(in: 1...7)
        }
        
        switch random {
        case 1:
            //PreSetsEnemy.everyLineOcuped()
            break
        case 2:
            PreSetsEnemy.line1Ocuped()
            break
        case 3:
            PreSetsEnemy.line2Ocuped()
            break
        case 4:
            PreSetsEnemy.line3Ocuped()
            break
        case 5:
            PreSetsEnemy.line1And2Ocuped()
            break
        case 6:
            PreSetsEnemy.line2And3Ocuped()
            break
        case 7:
            PreSetsEnemy.line1And3Ocuped()
            break
        default:
            break
        }
        
        lastPosition = random
    }

    
    static func enemyDie(enemyMasterNode: SKNode) {
        if PreSetsEnemy.enemyMasterNode.children.count > 13{
            PreSetsEnemy.enemyMasterNode.removeChildren(in: [PreSetsEnemy.enemyMasterNode.children.first!])
        }
    }

    static func move(enemyMasterNode: SKNode,count:CGFloat ) {
        enemyMasterNode.run(SKAction.moveBy(x: MapData.movXCoefficient * count, y: MapData.movYCoefficient * count, duration: 0.1))
    }
    
}
