//
//  Actions.swift
//  endlessNightmare
//
//  Created by Victor Henrique Caliope Soares on 21/07/21.
//
//
import Foundation
import SpriteKit

public class Actions{
    
    var array:[SKAction] = [SKAction]()
    var movMap = SKAction()
    
    init(firstMap: SKSpriteNode, secondMap: SKSpriteNode, count:CGFloat) {
        mapMovment(firstMap: firstMap, secondMap: secondMap, count: count)
        self.enemyBornAction()
//        array.append(SKAction.wait(forDuration: 1))
    }
    
    func enemyBornAction(){
        
        let criaInimigos = SKAction.customAction(withDuration: 0.0, actionBlock: {
            node, elapsedTime in
            EnemyManager.enemyBorn()
            print(elapsedTime)
            
        })
        array.append(criaInimigos)
    }
    
    func mapMovment(firstMap: SKSpriteNode, secondMap: SKSpriteNode, count:CGFloat){

         movMap = SKAction.customAction(withDuration: 1, actionBlock: {
            node, elapsedTime in

            MapManager.updateMap(firstMap: firstMap, secondMap: secondMap, count: count)
        })
        
    }
}
