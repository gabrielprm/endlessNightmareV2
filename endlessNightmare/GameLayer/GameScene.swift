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
    var mapa: SKSpriteNode! = nil
    var mapa2: SKSpriteNode! = nil
    var character: SKNode! = nil
    var buttonPause: SKSpriteNode! = nil
    var menuPause: PauseMenu! = nil
    var score: SKLabelNode! = nil
    var tick = 1.0
    
    let difficultyMultiplier = DifficultyIncrement()
    let scoreInt = ScoreCalculator()
    let haptich = HaptictsManager()
    
    let gameSound: SKAudioNode = SKAudioNode(fileNamed: "gameSceneSound")
    
    override func didMove(to view: SKView) {
        if UserDefaults.standard.stateSong() {
            addChild(gameSound)
        }
        
        background = childNode(withName: "background") as? SKSpriteNode
        buttonPause = childNode(withName: "buttonPause") as? SKSpriteNode
        menuPause = childNode(withName: "menuPause") as? PauseMenu
        
        score = childNode(withName: "score") as? SKLabelNode
        
        mapa = MapGenerator(imageName: "chao", zPosition: 1)
        addChild(mapa)
        
        mapa2 = MapGenerator(imageName: "chao", position: CGPoint(x: MapData.initialXPositionSecondMap, y: MapData.initialYPositionSecondMap), zPosition: 0)
        addChild(mapa2)
        
        CharacterManager.rowPosition = 2
        
        character = CharacterGenerator()
        addChild(character)
        
        let enemyMasterNode = PreSetsEnemy.enemyMasterNode
        
        enemyMasterNode.removeAllChildren()
        enemyMasterNode.removeFromParent()
        
        addChild(enemyMasterNode)
        
        physicsWorld.contactDelegate = self
        
        let movMap = SKAction.customAction(withDuration: 1, actionBlock: { node, elapsedTime in

            MapManager.updateMap(firstMap: self.mapa, secondMap: self.mapa2, count: CGFloat(self.difficultyMultiplier.difficultyCounter))
        })
        
        let attPontos = SKAction.customAction(withDuration: 1, actionBlock: { node, elapsedTime in
            
            self.difficultyMultiplier.speedProgression()
            
            self.scoreInt.scoreIncrement(counter: self.difficultyMultiplier.difficultyCounter)
            
            if let node = node as? SKLabelNode{
                node.text = "\(self.scoreInt.scoreCounter / 30)"
            }
        })
        
        self.run(SKAction.repeatForever(movMap))
        score.run(SKAction.repeatForever(attPontos))
        
        setupGestures()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        guard let touchLocation = touch?.location(in: self) else { return }
        guard let node = nodes(at: touchLocation).first else { return }
//        guard let nodeName = node.name else { return }
        
        if node == buttonPause {
            menuPause.toggleVisibility()
            
            if gameSound.parent != nil {
                gameSound.run(SKAction.pause())
            }
            
            buttonPause.isUserInteractionEnabled = true
            isPaused = true
        } else if node == menuPause.buttonPlay {
            menuPause.toggleVisibility()
            
            if gameSound.parent != nil {
                gameSound.run(SKAction.play())
            }
            
            buttonPause.isUserInteractionEnabled = false
            isPaused = false
        } else if node == menuPause.buttonSong {
            let defaults = UserDefaults.standard
            
            defaults.changeStateSong()
            menuPause.changeTextureSong()
            
            if defaults.stateSong() {
                addChild(gameSound)
            } else {
                gameSound.removeFromParent()
            }
        } else if node == menuPause.buttonHome {
            let transition = SKTransition.fade(withDuration: 1.5)
            let gameOverScene = SKScene(fileNamed: "HomeScene")!
            
            gameOverScene.scaleMode = .aspectFill
            
            view!.presentScene(gameOverScene, transition: transition)
        }
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
                case .up, .left:
                    haptich.oneVibrationHaptic()
                    CharacterManager.moveUp(character)
                case .down, .right:
                    haptich.oneVibrationHaptic()
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
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        view!.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .left
        view!.addGestureRecognizer(swipeLeft)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if gameSound.parent != nil {
            gameSound.run(SKAction.stop())
        }
        
        saveScore()
        
        let transition = SKTransition.fade(withDuration: 1.5)
        let gameOverScene = SKScene(fileNamed: "GameOverScene")!
        
        haptich.twoVibrationHaptic(for: .success)
        gameOverScene.scaleMode = .aspectFill
        
        view!.presentScene(gameOverScene, transition: transition)
    }
    
    func saveScore() {
        let newScore = (scoreInt.scoreCounter / 30)
        let defaults = UserDefaults.standard
        let highScore = defaults.integer(forKey: "highScore") as Int? ?? 0
        
        if newScore > highScore {
            UserDefaults.standard.set(newScore, forKey: "highScore")
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    // spawn de inimigos
        if tick > 120{
            EnemyManager.enemyBorn()
            tick = 0
        }
        if scoreInt.scoreCounter < 15000{
            tick = tick + (difficultyMultiplier.difficultyCounter / 2)
        } else{
            tick = tick + (difficultyMultiplier.difficultyCounter * 0.7)
        }
        EnemyManager.enemyDie(enemyMasterNode: PreSetsEnemy.enemyMasterNode)
        print(difficultyMultiplier.difficultyCounter)

            
        //E responsavel pela movimentacao dos inimigos
        EnemyManager.move(enemyMasterNode: PreSetsEnemy.enemyMasterNode, count: CGFloat(difficultyMultiplier.difficultyCounter))
    }
}
