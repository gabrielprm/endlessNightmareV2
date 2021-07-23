//
//  EnemyManager.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 16/07/21.
//

import SpriteKit

struct EnemyManager {
    
    static let enemyMasterNode = SKNode()
    static var lastPosition = 0
    
    static func enemyBorn() {
        let node = EnemyGenerator()
        var random = Int.random(in: 1...3)
        
        while random == lastPosition {
            random = Int.random(in: 1...3)
        }
        
        switch random {
        case 1:
            let diferenca = CGPoint(x: 580 - enemyMasterNode.position.x, y: 340 - enemyMasterNode.position.y)
            
            node.position = diferenca
            node.zPosition = 10
            break
        case 2:
            let diferenca = CGPoint(x: 580 - enemyMasterNode.position.x, y: 390 - enemyMasterNode.position.y)
            
            node.position = diferenca
            node.zPosition = 7
            break
        case 3:
            let diferenca = CGPoint(x: 580 - enemyMasterNode.position.x, y: 440 - enemyMasterNode.position.y)
            
            node.position = diferenca
            node.zPosition = 5
            break
        default:
            break
        }
        
        lastPosition = random
        enemyMasterNode.addChild(node)
    }
    
    static func enemyDie() {
       
        let ultimaPosXMasterNode = -((enemyMasterNode.children.first?.position.x)! - 580)
        let posAtualXMAsterNode = enemyMasterNode.position.x
        if posAtualXMAsterNode - ultimaPosXMasterNode  <= -980{
            enemyMasterNode.removeChildren(in: [enemyMasterNode.children.first!])
        }
    }

    static func move(count:CGFloat ) {
        enemyMasterNode.run(SKAction.moveBy(x: MapData.movXCoefficient * count, y: MapData.movYCoefficient * count, duration: 0.1))

    }
    
}
