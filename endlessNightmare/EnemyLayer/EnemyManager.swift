//
//  EnemyManager.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 16/07/21.
//

import SpriteKit

public class EnemyManager {
    
    
    static func enemyBorn(masterNode: SKNode) {
        let node = SKSpriteNode(imageNamed: "enemy")
        node.setScale(0.12)
        
        switch Int.random(in: 1...3) {
        case 1:
            let diferenca = CGPoint(x: 580 - masterNode.position.x, y: 340 - masterNode.position.y)
            
            node.position = diferenca
            node.zPosition = 10
            break
        case 2:
            let diferenca = CGPoint(x: 580 - masterNode.position.x, y: 390 - masterNode.position.y)
            
            node.position = diferenca
            node.zPosition = 7
            break
        case 3:
            let diferenca = CGPoint(x: 580 - masterNode.position.x, y: 440 - masterNode.position.y)
            
            node.position = diferenca
            node.zPosition = 5
            break
        default:
            print("Deu ruim")
        }
        
        masterNode.addChild(node)
    }
    
    static func enemyDie(node: SKSpriteNode){
       
    }
    
    static func move(masterNode: SKNode){
        masterNode.run(SKAction.moveBy(x: MapData.movXCoefficient, y: MapData.movYCoefficient, duration: 1))
    }
    
}
