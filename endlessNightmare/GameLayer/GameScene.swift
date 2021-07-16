//
//  GameScene.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 12/07/21.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var character: SKNode! = nil
    var masterNode = SKNode()
    
    override func didMove(to view: SKView) {
        let mapa = MapGenerator(imageName: "chao-2", zPosition: 1)
        addChild(mapa)
        
        let mapa2 = MapGenerator(imageName: "chao-2", position: CGPoint(x: MapData.initialXPositionSecondMap, y: MapData.initialYPositionSecondMap), zPosition: 0)
        addChild(mapa2)
        
        character = characterGenerator()
        addChild(character)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeUp.direction = .up
        self.view!.addGestureRecognizer(swipeUp)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .down
        self.view!.addGestureRecognizer(swipeDown)
        
        let background = Background(position: CGPoint(x: 0, y: 0))
        self.addChild(background)
        
        addChild(masterNode)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Recupero a posição do toque com referência à minha scene. À minha tela.
        let touch = touches.first
        // Enumero e recupero todos os nodes com o mesmo 'name' dentro da cena
        let _ = touch?.location(in: self)
 
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .up:
                PlayerMechanics.moveUp(character)
            case .down:
                PlayerMechanics.moveDown(character)
            default:
                break
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
  
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    var i = 0
    
    override func update(_ currentTime: TimeInterval) {
        
        if i > 120{
            EnemyGenerator.enemyBorn(masterNode: masterNode)
            i = 0
        }
        MoveEnemy.Move(masterNode: masterNode)
        i += 1
    }
}
