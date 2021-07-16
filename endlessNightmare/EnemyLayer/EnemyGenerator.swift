//
//  EnemyGenerator.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 15/07/21.
//

import Foundation
import SpriteKit

public class EnemyGenerator{
    
    static func enemyBorn(masterNode: SKNode){
        
        let node = SKSpriteNode(imageNamed: "enemy")
        node.setScale(0.3)
        
        let random = Int.random(in: 1...3)
        
        switch random{
        case 1:
            let diferenca = CGPoint(x: 580 - masterNode.position.x, y: 340 - masterNode.position.y)
            node.position = diferenca
            print("1 - \(node.position)")
            break
        case 2:
            let diferenca = CGPoint(x: 580 - masterNode.position.x, y: 390 - masterNode.position.y)
            node.position = diferenca
            print("2 - \(node.position)")
            break
        case 3:
            let diferenca = CGPoint(x: 580 - masterNode.position.x, y: 440 - masterNode.position.y)
            node.position = diferenca
            print("3 - \(node.position)")
            break
            
        default:
            print("Deu ruim")
        }
        masterNode.addChild(node)
    }
    
}
