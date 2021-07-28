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
    
    static let instance = GameScene()

    var mapa: SKSpriteNode! = nil
    var mapa2: SKSpriteNode! = nil
    var character: SKNode! = nil
    var buttonPause: SKSpriteNode! = nil
    var pauseMenu: PauseMenu! = nil
    var scoreLabel: SKLabelNode! = nil
    var tick = 1.0
    
    let difficultyMultiplier = DifficultyIncrement()
    let scoreInt = ScoreCalculator()
    let haptich = HaptictsManager()
    
    let gameMusic: SKAudioNode = SKAudioNode(fileNamed: "gameSceneSound")
    
    override func didMove(to view: SKView) {
        if UserDefaults.standard.stateMusic() {
            addChild(gameMusic)
        }
        
        buttonPause = childNode(withName: "pause") as? SKSpriteNode
        pauseMenu = childNode(withName: "pauseMenu") as? PauseMenu
        
        scoreLabel = childNode(withName: "scoreLabel") as? SKLabelNode
        
        mapa = MapGenerator(imageName: "Road", zPosition: 1)
        addChild(mapa)
        
        mapa2 = MapGenerator(imageName: "Road", position: CGPoint(x: MapData.initialXPositionSecondMap, y: MapData.initialYPositionSecondMap), zPosition: 0)
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
        scoreLabel.run(SKAction.repeatForever(attPontos))
        
        setupGestures()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        guard let touchLocation = touch?.location(in: self) else { return }
        guard let node = nodes(at: touchLocation).first else { return }
//        guard let nodeName = node.name else { return }
        
        if node == buttonPause {
            pauseMenu.toggleVisibility()
            
            if gameMusic.parent != nil {
                gameMusic.run(SKAction.pause())
            }
            
            buttonPause.isUserInteractionEnabled = true
            isPaused = true
        } else if node == pauseMenu.buttonPlay {
            pauseMenu.toggleVisibility()
            
            if gameMusic.parent != nil {
                gameMusic.run(SKAction.play())
            }
            
            buttonPause.isUserInteractionEnabled = false
            isPaused = false
        } else if node == pauseMenu.buttonMusic {
            let defaults = UserDefaults.standard
            
            defaults.changeStateMusic()
            Music.changeTextureMusicPause(pauseMenu.buttonMusic)
            
            if defaults.stateMusic() {
                addChild(gameMusic)
            } else {
                gameMusic.removeFromParent()
            }
        } else if node == pauseMenu.buttonHome {
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
        if gameMusic.parent != nil {
            gameMusic.run(SKAction.stop())
        }
        
        saveScore()
        
        haptich.twoVibrationHaptic(for: .success)
        
        let transition = SKTransition.fade(withDuration: 1.5)
        let gameOverScene = SKScene(fileNamed: "GameOverScene")!
        
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
        
        UserDefaults.standard.set(newScore, forKey: "score")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // spawn de inimigos
        if tick > 120 {
            EnemyManager.enemyBorn()
            tick = 0
        }
        
        tick += difficultyMultiplier.difficultyCounter * 0.5
        EnemyManager.enemyDie(enemyMasterNode: PreSetsEnemy.enemyMasterNode)
//        print(difficultyMultiplier.difficultyCounter)
        
        //E responsavel pela movimentacao dos inimigos
        EnemyManager.move(enemyMasterNode: PreSetsEnemy.enemyMasterNode, count: CGFloat(difficultyMultiplier.difficultyCounter))
    }
}
