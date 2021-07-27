//
//  PreSetsEnemy.swift
//  endlessNightmare
//
//  Created by Victor Henrique Caliope Soares on 23/07/21.
//

import Foundation
import SpriteKit

class PreSetsEnemy{
    
    static let enemyMasterNode = SKNode()
    
    static func everyLineOcuped() {
        
        generateEnemyLine1()
        generateEnemyLine2()
        generateEnemyLine3()
    }
    
    static func line1And2Ocuped(){
        
        generateEnemyLine1()
        generateEnemyLine2()
    }
    
    static func line1And3Ocuped(){
        
        generateEnemyLine1()
        generateEnemyLine3()
    }
    
    static func line2And3Ocuped(){
        
        generateEnemyLine3()
        generateEnemyLine2()
    }
    
    static func line1Ocuped(){
        
        generateEnemyLine1()
    }
    
    static func line2Ocuped(){
        
        generateEnemyLine2()
    }
    
    static func line3Ocuped(){
        
        generateEnemyLine3()
    }
    
    
    //Gerando inimigos em suas respectivas linhas
    
    static func generateEnemyLine1() {
        
        let line1 = EnemyGenerator()
        let diferenca = CGPoint(x: 441 - enemyMasterNode.position.x, y: 371 - enemyMasterNode.position.y)
        line1.position = diferenca
        line1.zPosition = 5
        enemyMasterNode.addChild(line1)
    }
    
    static func generateEnemyLine2() {
        
        let line2 = EnemyGenerator()
        let diferenca = CGPoint(x: 482 - enemyMasterNode.position.x, y: 318 - enemyMasterNode.position.y)
        line2.position = diferenca
        line2.zPosition = 7
        enemyMasterNode.addChild(line2)
    }
    
    static func generateEnemyLine3() {
        
        let line3 = EnemyGenerator()
        let diferenca = CGPoint(x: 533 - enemyMasterNode.position.x, y: 267 - enemyMasterNode.position.y)
        line3.position = diferenca
        line3.zPosition = 10
        enemyMasterNode.addChild(line3)
    }
}
