//
//  EnemyManager.swift
//  endlessNightmare
//
//  Created by Johnny Camacho on 16/07/21.
//

import SpriteKit

struct EnemyManager {
    

    static let enemyMasterNode = SKNode()
    
    static func enemyBorn() {
        let node = EnemyGenerator()
        
        switch Int.random(in: 1...3) {
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
        
        enemyMasterNode.addChild(node)
    }
    
//    static func enemyBornAction() -> SKAction{
//
//        let criaInimigos = SKAction.customAction(withDuration: 0.0, actionBlock: {
//            node, elapsedTime in
//
//            EnemyManager.enemyBorn()
//        })
//        return criaInimigos
//    }
    

    static func enemyDie(node: SKSpriteNode){
       
    }
    
    //static func move(masterNode: SKNode){
    //   masterNode.run(SKAction.moveBy(x: MapData.movXCoefficient, y: MapData.movYCoefficient, duration: 1))

    static func move(count:CGFloat ) {
        enemyMasterNode.run(SKAction.moveBy(x: MapData.movXCoefficient * count, y: MapData.movYCoefficient * count, duration: 1))

    }
    
}
