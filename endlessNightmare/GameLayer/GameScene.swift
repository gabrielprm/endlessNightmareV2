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
    var mapa: SKSpriteNode! = nil
    var mapa2: SKSpriteNode! = nil
    var buttonPause: SKSpriteNode! = nil
    var score: SKLabelNode! = nil
    var masterNode = SKNode()
    let difficultyMultiplier = DifficultyIncrement()
    
    override func didMove(to view: SKView) {
        buttonPause = childNode(withName: "button_pause") as? SKSpriteNode
        score = childNode(withName: "score") as? SKLabelNode
        
        mapa = MapGenerator(imageName: "chao", zPosition: 1)
        addChild(mapa)
        
        mapa2 = MapGenerator(imageName: "chao", position: CGPoint(x: MapData.initialXPositionSecondMap, y: MapData.initialYPositionSecondMap), zPosition: 0)
        addChild(mapa2)
        
        character = CharacterGenerator()
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
        let touch = touches.first
        
        guard let touchLocation = touch?.location(in: self) else { return }
        guard let node = nodes(at: touchLocation).first else { return }
        guard let nodeName = node.name else { return }
        
        if nodeName == "button_pause" {
            let buttonPlay = SKSpriteNode(imageNamed: "button_play")
            buttonPlay.name = "button_play"
            buttonPlay.zPosition = 999
            buttonPlay.setScale(4)
            
            addChild(buttonPlay)
            
            node.isUserInteractionEnabled = true
            isPaused = true
        } else if nodeName == "button_play" {
            node.removeFromParent()
            
            buttonPause.isUserInteractionEnabled = false
            isPaused = false
        }
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
    var scoreInt = 0
    
    override func update(_ currentTime: TimeInterval) {
        
        difficultyMultiplier.speedProgression()
        
        MapManager.updateMap(firstMap: mapa, secondMap: mapa2, count:CGFloat(difficultyMultiplier.difficultyCounter))
        
        if i > 120 {
            EnemyManager.enemyBorn(masterNode: masterNode)
            i = 0
        }
        
        EnemyManager.move(masterNode: masterNode)
        
        if scoreInt % 60 == 0 {
            score.text = "\(scoreInt / 60)"
        }
        
        i += 1
        scoreInt += 1
    }
}
