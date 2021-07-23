//
//  GameScene.swift
//  endlessNightmare
//
//  Created by Gabriel do Prado Moreira on 12/07/21.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var background: SKSpriteNode!
    
    var character: SKNode! = nil
    var mapa: SKSpriteNode! = nil
    var mapa2: SKSpriteNode! = nil
    var buttonPause: SKSpriteNode! = nil
    var score: SKLabelNode! = nil

    var masterNode = SKNode()
  
    let difficultyMultiplier = DifficultyIncrement()
    
    var i = 1.0
    var scoreInt = ScoreCalculator()
    
    override func didMove(to view: SKView) {
//        background = childNode(withName: "background") as? SKSpriteNode
        
        buttonPause = childNode(withName: "buttonPause") as? SKSpriteNode
        
        score = childNode(withName: "score") as? SKLabelNode
        
        mapa = MapGenerator(imageName: "chao", zPosition: 1)
        addChild(mapa)
        
        mapa2 = MapGenerator(imageName: "chao", position: CGPoint(x: MapData.initialXPositionSecondMap, y: MapData.initialYPositionSecondMap), zPosition: 0)
        addChild(mapa2)
        
        CharacterManager.rowPosition = 2
        
        character = CharacterGenerator()
        addChild(character)
        
        let enemyMasterNode = EnemyManager.enemyMasterNode
        
        enemyMasterNode.removeAllChildren()
        enemyMasterNode.removeFromParent()
        
        addChild(enemyMasterNode)
        
//        physicsWorld.contactDelegate = self
        
        let attPontos = SKAction.customAction(withDuration: 1, actionBlock: { node, elapsedTime in
            //Funcao responsavel por aumenta a velocidade, e por consequencia a dificuldade
            self.difficultyMultiplier.speedProgression()
            
            //Calculo progressivo da pontuacao
            self.scoreInt.scoreIncrement(counter: self.difficultyMultiplier.difficultyCounter)
            
            if let node = node as? SKLabelNode{
                
                //Mostra a pontuacao na tela
                //E dividido por 60, pois e a taxa de atualizacao do update
                //score.text = "\(scoreInt.scoreCounter / 60)"
                node.text = "\(self.scoreInt.scoreCounter / 30)"
            }
        })
        
//        MapManager.moveMap(scene: self, firstMap: mapa, secondMap: mapa2, count: CGFloat(difficultyMultiplier.difficultyCounter))
        
        let movMap = SKAction.customAction(withDuration: 1, actionBlock: { node, elapsedTime in
            
            MapManager.updateMap(firstMap: self.mapa, secondMap: self.mapa2, count: CGFloat(self.difficultyMultiplier.difficultyCounter))
        })
        
        run(SKAction.repeatForever(movMap))
        
        score.run(SKAction.repeatForever(attPontos))
        
        setupGestures()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        guard let touchLocation = touch?.location(in: self) else { return }
        guard let node = nodes(at: touchLocation).first else { return }
        guard let nodeName = node.name else { return }
        
        if nodeName == "buttonPause" {
            let buttonPlay = SKSpriteNode(imageNamed: "button_play")
            buttonPlay.name = "buttonPlay"
            buttonPlay.zPosition = 999
            buttonPlay.setScale(4)
            
            addChild(buttonPlay)
            
            buttonPause.isUserInteractionEnabled = true
            isPaused = true
        } else if nodeName == "buttonPlay" {
            node.removeFromParent()
            
            buttonPause.isUserInteractionEnabled = false
            isPaused = false
        }
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .up:
                CharacterManager.moveUp(character)
            case .down:
                CharacterManager.moveDown(character)
            default:
                break
            }
        }
    }
    
    func setupGestures() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeUp.direction = .up
        view!.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .down
        view!.addGestureRecognizer(swipeDown)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let transition = SKTransition.fade(withDuration: 1.5)
        let gameOverScene = SKScene(fileNamed: "GameOverScene")!
        
        gameOverScene.scaleMode = .aspectFill
        
        view!.presentScene(gameOverScene, transition: transition)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // spawn de inimigos
        if i > 120 {
            EnemyManager.enemyBorn()
            EnemyManager.enemyDie()
            i = 0
        }
        
        i += difficultyMultiplier.difficultyCounter
            
        //E responsavel pela movimentacao dos inimigos
        EnemyManager.move(count: CGFloat(difficultyMultiplier.difficultyCounter))
    }
}
